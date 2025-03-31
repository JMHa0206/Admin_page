<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리</title>
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
			<a href="#" data-target="create">사원 등록</a> <a href="#"
				data-target="read">사원 조회</a> <a href="#" data-target="update">사원
				수정</a> <a href="#" data-target="delete">사원 삭제</a>
		</div>
		<div class="main-content">

			<div id="create" class="section active">
				<h2>사원 등록</h2>
				<form action="/Employee/insertEmp" method="post">
					<div>
						<p>사원정보</p>
						<input type="text" name="emp_code_id" placeholder="사원 코드번호"
							required /> <input type="text" name="emp_loginId"
							placeholder="사원 로그인ID" required /> <input type="text"
							name="emp_pw" placeholder="사원 비밀번호" required /> <input
							type="text" name="emp_name" placeholder="이름" required /> <input
							type="text" name="emp_rrn" placeholder="주민등록번호" required /> <input
							type="text" name="emp_phone" placeholder="연락처" required /> <input
							type="text" name="salary" placeholder="연봉" required /> <input
							type="date" name="hire_date" placeholder="입사일(연도-월-일)" /> <input
							type="email" name="emp_email" placeholder="이메일" /> <input
							type="text" name="postcode" placeholder="우편번호" /> <input
							type="text" name="address1" placeholder="주소를 입력해주세요" /> <input
							type="text" name="address2" placeholder="상세주소를 입력해주세요." />
					</div>
					<div>
						<p>부서</p>
						<select name="emp_dept_id">
							<option value="5001">개발팀</option>
							<option value="5002">인사팀</option>
							<option value="5003">경영팀</option>
						</select>
					</div>
					<div>
						<p>직급</p>
						<select name="emp_job_id">
							<option value="1001">사원</option>
							<option value="1002">대리</option>
							<option value="1003">과장</option>
							<option value="1004">차장</option>
							<option value="1005">부장</option>
							<option value="1006">이사</option>
							<option value="1007">상무</option>
							<option value="1008">전무</option>
							<option value="1009">대표이사</option>
						</select>
					</div>
					<button>등록</button>
				</form>
			</div>

			<div id="read" class="section">
				<h2>사원 목록</h2>
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>부서</th>
						</tr>
					</thead>
					<tbody id="empboardTable">
						<c:forEach var="member" items="${memberList}">
							<tr>
								<td>${member.memberId}</td>
								<td>${member.name}</td>
								<td>${member.email}</td>
								<td>${member.deptId}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div id="update" class="section">
				<h2>사원 정보 수정</h2>
				<form action="/Employee/update" method="post">
					<input type="text" name="emp_code_id" placeholder="수정하고 싶은 사원 ID" />

					
					<!--	<label for="emp_dept_id">부서 ID</label> -->
						<select id="emp_dept_id" name="emp_dept_id">
							<option value="5001">개발팀</option>
							<option value="5002">인사팀</option>
							<option value="5003">경영팀</option>
						</select> 
						
					<!--	<label for="emp_job_id">직급 ID</label> -->
						<select id="emp_job_id" name="emp_job_id">
							<option value="1001">사원</option>
							<option value="1002">대리</option>
							<option value="1003">과장</option>
							<option value="1004">차장</option>
							<option value="1005">부장</option>
							<option value="1006">이사</option>
							<option value="1007">상무</option>
							<option value="1008">전무</option>
							<option value="1009">대표이사</option>
						</select>
						
					<!--   <input type="text" name="emp_dept_id" placeholder="수정하고 싶은 부서 ID" required />-->
					<!-- <input type="text" name="emp_job_id" placeholder="수정하고 싶은 직급 ID" />  -->
						<input type="text" name="address1" placeholder="수정하고 싶은 주소" />

					<button type="submit">수정</button>
				</form>
			</div>

			<div id="delete" class="section">
				<h2>사원 삭제</h2>
				<form action="/Employee/delete" method="post">
					<input type="text" name="emp_code_id" placeholder="삭제할 사원 ID"
						required />
					<button type="submit">삭제</button>
				</form>
			</div>

		</div>
	</div>

	<script>
$(document).ready(function() {

	 $.ajax({
	    	url:"/Employee/selectAll"
	    }).done(function(resp){
	    	let html = "";
	    	
	    	resp.forEach(function(emp){
	    		html += "<tr><td>" + emp.emp_code_id + "</td><td>" + emp.emp_name + "</td><td>" + emp.emp_email + "</td><td>" + emp.emp_dept_id + "</td></tr>";
	    	});
	    	$("#empboardTable").html(html);
	    })
	
    $('.sidebar a').click(function(e) {
        e.preventDefault();
        var target = $(this).data('target');
        $('.section').removeClass('active');
        $('#' + target).addClass('active');
    });
	 

	 

});
</script>
</body>
</html>