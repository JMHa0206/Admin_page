<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 관리</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
  background: #f9fbfd;
  margin: 0;
  color: #333;
}

.container {
  display: flex;
  min-height: 100vh;
}

.sidebar {
  width: 220px;
  background-color: #1a3c6c;
  color: #fff;
  padding: 20px;
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, 0.05);
}

.sidebar h3 {
  font-size: 18px;
  margin-bottom: 16px;
}

.sidebar a {
  display: block;
  color: #edf6ff;
  padding: 10px 12px;
  margin-bottom: 8px;
  border-radius: 6px;
  text-decoration: none;
  transition: background-color 0.2s;
}

.sidebar a:hover {
  background-color: #274b84;
}

.main-content {
  flex-grow: 1;
  padding: 30px;
  background-color: #f9fbfd;
  box-sizing: border-box;
  overflow-y: auto;
}

.section {
  display: none;
}

.section.active {
  display: block;
}

h2, h3 {
  color: #1a3c6c;
  margin-bottom: 20px;
}

h2 {
  font-size: 24px;
  padding-bottom: 10px;
}

h3 {
  font-size: 18px;
  margin-top: 20px;
}

input[type="text"], input[type="number"], input[type="time"],
select, button {
  width: 100%;
  padding: 10px;
  margin-top: 8px;
  margin-bottom: 16px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
  box-sizing: border-box;
  background-color: #fff;
}

button, input[type="submit"] {
  background-color: #1a3c6c;
  color: white;
  font-weight: bold;
  border: none;
  padding: 10px 20px;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
  width: auto;
}

button:hover, input[type="submit"]:hover {
  background-color: #274b84;
}

label {
  font-weight: bold;
  margin-top: 12px;
  display: block;
}

table {
  width: 100%;
  border-collapse: collapse;
  background: white;
  margin-top: 15px;
  border: 1px solid #dce9f5;
}

th, td {
  padding: 12px;
  border: 1px solid #dce9f5;
  text-align: center;
}

thead {
  background-color: #f0f4fa;
}

.annual-scroll-wrapper {
  max-height: 800px;
  overflow-y: auto;
  border: 1px solid #e0e0e0;
  border-radius: 4px;
  margin-top: 15px;
}

.annual-table .annual-header {
  background-color: #4a76a8;
  color: white;
  font-weight: 500;
  padding: 12px;
}

.annual-row:nth-child(even) {
  background-color: #f9f9f9;
}

.annual-row:hover {
  background-color: #e8f4f8;
}

.annual-data {
  padding: 10px;
}

.annual-days span {
  display: inline-block;
  background-color: #e8f4f8;
  color: #0277bd;
  padding: 4px 8px;
  border-radius: 3px;
}


/* ============================= */
/* ✅ 정시 출퇴근 스타일 유지됨  */
/* ============================= */

#WorkingHours {
  max-width: 800px;
  margin: 0 auto;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  padding: 25px;
}

#WorkingHours h2 {
  color: #333;
  border-bottom: 2px solid #4a76a8;
  padding-bottom: 10px;
  margin-bottom: 20px;
  font-size: 1.5rem;
}

#WorkingHours h3 {
  color: #4a76a8;
  font-size: 1.1rem;
  margin: 15px 0 5px 0;
}

#WorkingHours hr {
  border: 0;
  height: 1px;
  background-color: #e0e0e0;
  margin: 15px 0;
}

#WorkingHours table {
  width: 100%;
  border-collapse: collapse;
}

#WorkingHours td {
  padding: 8px 0;
}

#WorkingHours form {
  display: flex;
  flex-direction: column;
}

/* 라디오 버튼 컨테이너 스타일링 */
.radio-container {
  display: flex;
  gap: 20px;
  margin-bottom: 15px;
  align-items: center;
}

/* 라디오 버튼 스타일링 */
#WorkingHours input[type="radio"] {
  width: auto;
  margin-right: 5px;
  cursor: pointer;
}

#WorkingHours input[type="radio"] + label {
  display: inline;
  margin: 0;
  font-weight: normal;
  cursor: pointer;
}

.form-group {
  margin-bottom: 15px;
  background: white;
  padding: 15px;
  border-radius: 5px;
  border: 1px solid #e0e0e0;
}

#WorkingHours select,
#WorkingHours input[type="time"],
#WorkingHours input[type="number"] {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: white;
  width: 100%;
  max-width: 300px;
  font-size: 14px;
}

#WorkingHours input[type="submit"] {
  background-color: #4a76a8;
  color: white;
  border: none;
  padding: 12px 20px;
  border-radius: 4px;
  cursor: pointer;
  font-weight: bold;
  width: auto;
  align-self: flex-end;
  margin-top: 20px;
  transition: background-color 0.3s;
}

#WorkingHours input[type="submit"]:hover {
  background-color: #3a5f86;
}

#WorkingHours label {
  display: block;
  margin-bottom: 5px;
  color: #555;
  font-weight: 500;
}

#deptForm, #empForm {
  padding: 12px;
  background-color: #f0f4f8;
  border-radius: 5px;
  margin-bottom: 15px;
  border-left: 3px solid #4a76a8;
}

select option {
  color: #000 !important;
  background-color: #fff !important;
  font-size: 14px !important;
}

</style>
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<h3 style="color:#fff">인사 관리</h3>
			<a href="#" data-target="annual">연차 생성</a> 
			<a href="#" data-target="select">연차 발생</a> 
			<a href="#" data-target="WorkingHours">정시 출/퇴근</a>
		</div>

		<div class="main-content">
			<!-- 연차 생성 -->
			<div id="annual" class="section active">
				<h2 style="border-bottom: 3px solid #dce9f5">연차 생성</h2>
				<input type="text" id="years_of_service" name="years_of_service"
					placeholder="연차를 적어주세요.">년차 <input type="text"
					id="leave_days" name="leave_days" placeholder="연차 일수를 적어주세요." />
				<button type="button" onclick="generateAnnual()">연차 생성</button>
			</div>

			<div id="select" class="section">
				<h2 style="border-bottom: 3px solid #dce9f5">연차 발생</h2>
				<div class="annual-scroll-wrapper">
					<!-- 👈 추가된 부분 -->
					<table class="annual-table">
						<thead>
							<tr>
								<th class="annual-header">년차</th>
								<th class="annual-header">일수</th>
							</tr>
						</thead>
						<tbody id="empleave_days">
						</tbody>
					</table>
				</div>
				<!-- 👈 닫는 div -->
			</div>

			<div id="WorkingHours" class="section">
				<h2 style="border-bottom: 3px solid #dce9f5">정시 출/퇴근</h2>

				<form action="<c:url value='/work/setWorkHours' />" method="post">
					<!-- 한번 저렇게해보자 -->
					<div class="form-section">
						<div class="setting-type">
							<h3>출근 기준 설정</h3>
							<input type="radio" id="byDept" name="settingType" value="dept">
							<label for="byDept">부서별</label> <input type="radio" id="byEmp"
								name="settingType" value="emp"> <label for="byEmp">사원별</label>
						</div>
						<!-- 부서 -->
						<div id="deptForm" style="display: none;">
							<label for="department">부서 선택:</label> <select id="department"
								name="deptId">
								<!-- 여기서 생성 -->

							</select>
						</div>
						<!-- 사원 -->
						<div id="empForm" style="display: none;">
							<label for="employee">사원 선택:</label> <select id="employee"
								name="empCodeId">
								<!-- 여기서 생성 -->
								<!--  	 <option value="101">사원 101</option>  이런식으로감-->
							</select>
						</div>
					</div>
					<div class="time-row">
						<div class="time-group">
							<h3>출근 시간</h3>
							<input type="time" step="60" id="standardCheckIn"
								name="standardCheckIn">
						</div>
						<div class="time-group">
							<h3>퇴근 시간</h3>
							<input type="time" step="60" id="standardCheckOut"
								name="standardCheckOut">
						</div>
					</div>
					<div class="grace-row">
						<div class="grace-group">
							<h3>출근 그레이스 기간 (분)</h3>
							<input type="number" id="gracePeriodIn" name="gracePeriodIn"
								value="0" min="0">
						</div>
						<div class="grace-group">
							<h3>퇴근 그레이스 기간 (분)</h3>
							<input type="number" id="gracePeriodOut" name="gracePeriodOut"
								value="0" min="0">
						</div>
					</div>
					<label for="isActive">활성 여부</label> <select id="isActive"
						name="isActive">
						<option value="Y" selected>활성화</option>
						<option value="N">비활성화</option>
					</select> <input type="submit" value="설정 저장">
				</form>
			</div>
		</div>
	</div>

	<script>
		function generateAnnual() {
			let leave_days = $('#leave_days').val().trim();
			let years_of_service = $('#years_of_service').val().trim();

			if (!leave_days || !years_of_service) {
				alert("연차를 입력해 주세요.");
				return;
			}

			$.ajax({
				type : "POST",
				url : "/work/generateAnnual",
				contentType : "application/json; charset=UTF-8",
				data : JSON.stringify({
					years_of_service : years_of_service,
					leave_days : leave_days
				}),
				dataType : "text",
				success : function(result) {
					alert(result);
					selectAnnualLeave();
				},
				error : function(xhr, status, error) {
					alert("연차 생성에 실패했습니다.");
				}
			});
		}

		function selectAnnualLeave() {
			$.ajax({url : "/work/selectAll"})
				.done(function(resp) {
				let html = "";
				resp.forEach(function(i) {
					html += "<tr class='annual-row'><td class='annual-data annual-years'>"
					+ i.years_of_service
					+ "년차</td><td class='annual-data annual-days'><span>"
					+ i.leave_days
					+ "일</span></td></tr>";
				});
			$("#empleave_days").html(html);});
			}
//////////////////////////////////정시 출퇴근//////////////////////////////////////////////////////

		// 선택 폼 숨기기(정시 출/퇴근에서 사원 and 부서)
		function toggleForms() {
			const deptForm = document.getElementById("deptForm");
			const empForm = document.getElementById("empForm");

			if (document.getElementById("byDept").checked) {
				deptForm.style.display = "block";
				empForm.style.display = "none";
				
				setTimeout(() => {
					loadDepartment(); 
				}, 50); 
				
			} else if (document.getElementById("byEmp").checked) {
				deptForm.style.display = "none";
				empForm.style.display = "block";
				
				setTimeout(() => {
					loadEmployee(); 
				}, 50);
			}
		}

		
		// employee  사원		출력
//		function loadEmployee (){
//			$.ajax({url:"/work/employee"}).done(function(resp){
//				let html = ""
//				resp.forEach(function(emp){
//					console.log("사원명:", emp.emp_name, "| ID:", emp.emp_code_id);
//					html += `<option value="${emp.emp_code_id}">${emp.emp_name}</option>`;
//				});
////				$("#employee").html(html);
//			})
//		}
		// department 부서	출력	
		function loadDepartment (){
			$.ajax({url:"/work/department"}).done(function(resp){
				let html = "<option value=''>부서 선택</option>";
				resp.forEach(function(dept){
					html += '<option value="'+dept.dept_id+'">'+escapeHtmlString(dept.dept_name) + '</option>';
					//html += `<option value="${dept.dept_id}">${dept.dept_name}</option>`;
				});
				$("#department").html(html).hide().show();
			})
		}
		
		function loadEmployee () {
			$.ajax({ url: "/work/employee" }).done(function(resp){
				let html = "<option value=''>사원 선택</option>";
				resp.forEach(function(emp){
				html += '<option value="' + emp.emp_code_id + '">' + escapeHtmlString(emp.emp_name) + '</option>';
			});
			$("#employee").html(html).hide().show();
			});
		}
		// 이름에 특수문자가 있다네요?
		function escapeHtmlString(text) {
			if (!text) return "";
			return text
				.replace(/&/g, "&amp;")
				.replace(/</g, "&lt;")
				.replace(/>/g, "&gt;")
				.replace(/"/g, "&quot;")
				.replace(/'/g, "&#039;");
			}




		
//////////////////////////////////////////////////////////////////////////////			<option value="101">사원 101</option>

		$(document).ready(function() {
			// 탭 전환
			$('.sidebar a').click(function(e) {
				e.preventDefault();
				const target = $(this).data('target');
				$('.section').removeClass('active');
				$('#' + target).addClass('active');
			});
			// 라디오 이벤트
			$('#byDept, #byEmp').on('change', function () {
				toggleForms();
			});

			selectAnnualLeave();
		});
	</script>
</body>
</html>
