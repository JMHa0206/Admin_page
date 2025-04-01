<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: #f4f4f4;
	margin: 0;
	color: #333;
}

.container {
	display: flex;
	height: 100vh;
}

.sidebar {
	width: 200px;
	background-color: #222;
	color: #fff;
	padding: 20px;
}

.sidebar a {
	color: #ccc;
	display: block;
	margin: 10px 0;
	text-decoration: none;
}

.sidebar a:hover {
	color: #fff;
}

.main-content {
	flex: 1;
	padding: 20px;
	background: #fff;
}

.section {
	display: none;
}

.section.active {
	display: block;
}

input, select, button {
	margin: 5px 0;
	padding: 8px;
	width: 100%;
	border: 1px solid #ccc;
	background: #f9f9f9;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<h3>사원 관리</h3>
			<a href="#" data-target="create">권한 등록</a> 
			<a href="#" data-target="read">권한 목록 조회</a> 
			<a href="#" data-target="update">권한 수정</a>
			<a href="#" data-target="assign">권한일괄부여</a>			
		</div>
		<div class="main-content">

			<!-- 권한 등록 -->
			<div id="create" class="section active">
				<h2>권한 등록</h2>
				<form action="/Permission/add" method="post">
					<input type="text" name="per_name" placeholder="권한명" required /> <label
						for="per_secure">보안등급</label> <select name="per_secure" required>
						<option value="1">1등급</option>
						<option value="2">2등급</option>
						<option value="3">3등급</option>
					</select> <label for="per_function">권한등급</label> <select name="per_function"
						required>
						<option value="N">Normal (일반 사용자)</option>
						<option value="A">Admin (부서관리자)</option>
						<option value="I">IT Manager (IT 관리자)</option>
					</select>
					<hr>
					<button type="submit">등록</button>
				</form>
			</div>

			<!-- 권한 목록 조회 -->
			<div id="read" class="section">
				<h2>권한 목록</h2>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>권한명</th>
							<th>보안등급</th>
							<th>접근등급</th>
						</tr>
					</thead>
					<tbody id="permission-list">
						<!-- JavaScript로 채움 -->
					</tbody>
				</table>
			</div>

			<!-- 권한 수정 -->
			<div id="update" class="section">
				<h2>권한 정보 수정</h2>
				<form id="updateForm" action="/Permission/update" method="post">
					<input type="text" name="per_id" id="update_per_id"
						placeholder="권한 ID (기존)" required /> <input type="text"
						name="per_name" id="update_per_name" placeholder="새 권한명" /> <label
						for="update_per_secure">보안등급</label> <select name="per_secure"
						id="update_per_secure">
						<option value="1">1등급</option>
						<option value="2">2등급</option>
						<option value="3">3등급</option>
					</select> <label for="update_per_function">권한등급</label> <select
						name="per_function" id="update_per_function">
						<option value="N">Normal</option>
						<option value="A">Admin</option>
						<option value="I">IT Manager</option>
					</select>
					<div style="display: flex; gap: 10px;">
						<button type="submit" id="updateBtn">수정</button>
						<button type="button" id="deleteBtn"
							style="background: #d9534f; color: white;">삭제</button>
					</div>
				</form>
			</div>

			<!-- 권한 일괄 부여 -->
			<div id="assign" class="section">
				<h2>권한 일괄 부여</h2>
				<label>부여할 권한 선택</label> <select id="assign_permission">
					<option value="">선택하세요</option>
					<c:forEach var="permission" items="${perlist}">
						<option value="${permission.per_id}">${permission.per_name}</option>
					</c:forEach>
				</select>

				<h3>사원 목록</h3>
				<table>
					<thead>
						<tr>
							<th>선택</th>
							<th>사번</th>
							<th>이름</th>
							<th>부서</th>
							<th>현재 권한</th>
						</tr>
					</thead>
					<tbody id="employee-list">
						<!-- JS로 채워짐 -->
					</tbody>
				</table>
				<button type="button" id="assignBtn">선택된 사원에 권한 부여</button>
			</div>
		</div>

		<!-- ✅ JavaScript -->
		<script>
			$(document).ready(
					function() {

						// 삭제 버튼 클릭 시
						$('#deleteBtn').on('click', function() {
							const perId = $('#update_per_id').val().trim();
							if (!perId) {
								alert("삭제할 권한 ID를 입력해주세요.");
								return;
							}

							if (!confirm("정말 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.")) {
								return;
							}

							$.ajax({
								url : "/Permission/delete",
								method : "POST",
								data : {
									perid : perId
								},
								success : function(result) {
									alert("삭제가 완료되었습니다.");
									$('#updateForm')[0].reset(); // 폼 초기화
									$('#updateBtn').text('수정');
									$('#permission-list').empty(); // 조회 목록도 비움
								},
								error : function() {
									alert("삭제 중 오류가 발생했습니다.");
								}
							});
						});

						// 메뉴 이동
						$('.sidebar a').click(function(e) {
							e.preventDefault();
							var target = $(this).data('target');
							$('.section').removeClass('active');
							$('#' + target).addClass('active');
						});

						// 권한 목록 불러오기
						function loadlist() {
							$.ajax({
								url : "/Permission/selectAll",
								method : "GET",
								dataType : "json",
								success : function(data) {
									console.log(data)
									var tbody = $("#permission-list");
									tbody.empty();
									data.forEach(function(permission) {
										console.log("→ keys:", Object
												.keys(permission));
										var row = "<tr>" + "<td>"
												+ permission.per_id + "</td>"
												+ "<td>" + permission.per_name
												+ "</td>" + "<td>"
												+ permission.per_secure
												+ "</td>" + "<td>"
												+ permission.per_function
												+ "</td>" + "</tr>";
										tbody.append(row);
									});
								}
							});
						}

						// 목록 탭 클릭 시 목록 불러오기
						$('.sidebar a[data-target="read"]').click(function() {
							loadlist();
						});

						// 수정: ID 입력 시 자동조회
						$('#update_per_id').on(
								'blur',
								function() {
									let perId = $(this).val().trim();
									if (!perId)
										return;

									$.ajax({
										url : "/Permission/get",
										method : "GET",
										data : {
											id : perId
										},
										success : function(data) {
											if (data) {
												$('#update_per_name').val(
														data.per_name);
												$('#update_per_secure').val(
														data.per_secure);
												$('#update_per_function').val(
														data.per_function);
												$('#updateBtn').text('확인');
											} else {
												alert("해당 ID의 권한 정보가 없습니다.");
												$('#update_per_name').val('');
												$('#update_per_secure')
														.val('1');
												$('#update_per_function').val(
														'N');
											}
										},
										error : function() {
											alert("서버 요청 실패");
										}
									});
								});
						
						$('.sidebar a[data-target="assign"]').click(function () {
							  $.ajax({
							    url: "/Employee/selectEmpForPermission", // 사원 전체 조회 URL
							    method: "GET",
							    dataType: "json",
							    success: function (data) {
							      const tbody = $('#employee-list');
							      tbody.empty();
							      console.log(data);
							      data.forEach(function (emp) {
							        const row = '<tr><td><input type="checkbox" class="emp-check" value="'
							        			+ emp.emp_code_id + '"></td><td>'
							            		+ emp.emp_name + '</td><td>'
							            		+ (emp.departDTO ? emp.departDTO.dept_name : "-") + '</td><td>'
							            		+ (emp.permissionDTO ? emp.permissionDTO.per_name : "-") + '</td></tr>';
							        tbody.append(row);
							      });
							    }
							  });
							  $.ajax({
								  url: "/Permission/selectAll",
								  method: "GET",
								  dataType: "json",
								  success: function (data) {
								    const select = $('#assign_permission');
								    select.empty().append('<option value="">선택하세요</option>');
								    data.forEach(function (permission) {
								      const option = $('<option>').val(permission.per_id).text(permission.per_name);
								      select.append(option);
								    });
								  }
								});
							});

							// 권한 부여 버튼 클릭 시
							$('#assignBtn').click(function () {
							  const selectedPerId = $('#assign_permission').val();
							  const selectedEmpIds = $('.emp-check:checked').map(function () {
							    return $(this).val();
							  }).get();

							  if (!selectedPerId || selectedEmpIds.length === 0) {
							    alert("권한과 사원을 모두 선택해주세요.");
							    return;
							  }

							  $.ajax({
							    url: "/Permission/assignToEmployees",
							    method: "POST",
							    traditional: true, // 배열 전송 시 필수
							    data: {
							      per_id: selectedPerId,
							      emp_ids: selectedEmpIds
							    },
							    success: function () {
							      alert("권한이 성공적으로 부여되었습니다.");
							      $('#employee-list').empty();
							    },
							    error: function () {
							      alert("권한 부여 실패");
							    }
							  });
							});
							
					});
			  $(document).on('keydown', function (e) {
				    if (e.key === "Enter") {
				      const tag = e.target.tagName.toLowerCase();
				      const type = $(e.target).attr('type');
				      if ((tag === 'input' && type === 'text') || tag === 'select') {
				        e.preventDefault();
				        return false;
				      }
				    }
				  });
		</script>
</body>
</html>
