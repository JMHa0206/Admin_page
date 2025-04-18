<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board_Admin</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
  background: #f9fbfd;
  margin: 0;
  color: #333;
}

.wrapper {
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

.sidebar h2 {
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

.content {
  flex-grow: 1;
  padding: 30px;
  background-color: #f9fbfd;
  box-sizing: border-box;
  overflow-y: auto;
}

h2 {
  font-size: 24px;
  margin-bottom: 20px;
  color: #fff;
}

h3 {
  font-size: 18px;
  margin: 20px 0 10px;
  color: #1a3c6c;
  border-bottom: 1px solid #ccc;
  padding-bottom: 5px;
}

.section {
  display: none;
}

.section.active {
  display: block;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 15px;
  background: white;
  border: 1px solid #dce9f5;
}

th, td {
  border: 1px solid #dce9f5;
  padding: 12px;
  text-align: center;
}

thead {
  background-color: #f0f4fa;
}

input[type="text"], select {
  padding: 10px;
  width: 100%;
  box-sizing: border-box;
  margin-top: 6px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
  background-color: #fff;
}

.form-group {
  margin-bottom: 16px;
}

button, .btn {
  padding: 10px 16px;
  background-color: #1a3c6c;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.2s;
}

button:hover, .btn:hover {
  background-color: #274b84;
}

</style>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar">
			<h2>게시판 관리</h2>
			<a href="#" class="menu-btn" data-target="boardList">게시판 목록</a>
			<a href="#" class="menu-btn" data-target="addBoard">게시판 생성하기</a>
			<a href="#" class="menu-btn" data-target="editBoard">게시판 수정 및 삭제</a> 
		</div>
		<div class="content">
			<div class="section active" id="boardList">
				<h2 style="color:black">게시판 목록</h2>
				<table>
					<thead>
						<tr>
							<th>게시판ID</th>
							<th>게시판명</th>
						</tr>
					</thead>
					<tbody id="boardTable">
					</tbody>
				</table>
			</div>
			
			<div class="section" id="addBoard">
				<h2 style="color:black">게시판 생성하기</h2>
				<form id="boardForm" action="/board/insert">
				
					<div class="form-group">
						<input type="text" name="boardName" placeholder="생성할 게시판의 이름 입력" />
						<button class="btn">등록</button>
					</div>
				</form>
			</div>
			<div class="section" id="editBoard">
	            <h2 style="color:black">게시판 이름 수정</h2>
	            <form action="/board/updateBoard" method="post">
	                <input type="text" name="b_id" placeholder="수정할 게시판 ID 입력" required />
	                <input type="text" name="b_name" placeholder="새로운 게시판 이름 입력" required />
	                <button>수정</button>
	            </form>
	        
	            <h2 style="color:black">게시판 삭제</h2>
	            <form action="/board/deleteBoard" method="post">
	                <input type="text" name="b_id" placeholder="삭제할 게시판 ID" required />
	                <button>삭제</button>
	            </form>
	        </div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
		    $.ajax({
		    	url:"/board/selectAllBoards"
		    }).done(function(resp){
		    	let html = "";
		    	
		    	resp.forEach(function(board){
		    		html += "<tr><td>" + board.b_id + "</td><td>" + board.b_name + "</td></tr>";
		    	});
		    	$("#boardTable").html(html);
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