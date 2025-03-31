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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
<<<<<<< HEAD
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
        padding: 8px;
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
            <p>기본 설정</p>
            	아이디<input type="text" id="code_id" name="emp_loginId"/><br></br>
                비밀번호<input type="text" id="pw" name="emp_pw"/><br></br>
                <input type="date" name="hire_date" placeholder="입사일(연도-월-일)" /><br></br>
                <input type="text" name="salary" placeholder="연봉" required />
            <p>사원정보</p>
                <input type="text" name="emp_name" placeholder="이름" required /><br></br>
                <input type="text" name="emp_rrn" placeholder="주민등록번호" required /><br></br>
                <input type="text" name="emp_phone" placeholder="연락처" required /><br></br>
                <input type="email" name="emp_email" placeholder="이메일" /><br></br>
                <input type="text" id="postcode" name="postcode" placeholder="우편번호" /><br></br>
                <button type="button" id="btn">우편번호 찾기</button>
                <input type="text" id="address" name="address1" placeholder="주소를 입력해주세요" /><br></br>
                <input type="text" name="address2" placeholder="상세주소를 입력해주세요." />
            </div>
                <div>
                	<p>부서 및 직급</p>
	                <select name="emp_dept_id">
	                  <option value="">부서 선택</option>
					  <option value="5001">개발팀</option>
					  <option value="5002">인사팀</option>
					  <option value="5003">경영팀</option>
					</select>
	                <select name="emp_job_id">
	                  <option value="">직급 선택</option>
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
                <button id="addEmp">등록</button>
            </form>
        </div>

        <div id="read" class="section">
            <h2>사원 목록</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th><th>이름</th><th>부서</th><th>직급</th><th>이메일</th>
                    </tr>
                </thead>
                <tbody id="empboardTable">
                </tbody>
            </table>
        </div>


			<div id="update" class="section">
				<h2>사원 정보 수정</h2>
				<form action="/Employee/update" method="post">
					<input type="text" name="emp_code_id" placeholder="수정하고 싶은 사원 ID" />

						<select id="emp_dept_id" name="emp_dept_id">
							<option value="5001">개발팀</option>
							<option value="5002">인사팀</option>
							<option value="5003">경영팀</option>
						</select> 
						
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
	    	let defaultId="";
	    	
	    	resp.forEach(function(emp){
	    		html += "<tr><td>" 
	    				+ emp.emp_code_id 
	    				+ "</td><td>" + emp.emp_name 
	    				+ "</td><td>" + emp.departDTO.dept_name 
	    				+ "</td><td>" + (emp.jobDTO ? emp.jobDTO.job_name : "직급 없음")
	    				+ "</td><td>" + emp.emp_email 
	    				+ "</td></tr>";
	    		defaultId = "emp_" + (emp.emp_code_id + 1);
	    	});
	    	$("#empboardTable").html(html);
	    	$("#code_id").val(defaultId);
	    	$("#pw").val(defaultId);
	    })
	
    $('.sidebar a').click(function(e) {
        e.preventDefault();
        var target = $(this).data('target');
        $('.section').removeClass('active');
        $('#' + target).addClass('active');
    });
	 

	 

});

document.getElementById("btn").onclick = function () {
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("address").value = data.roadAddress;
        }
    }).open();
};

$("#addEmp").on("click", function(){
	
})
</script>
</body>
</html>