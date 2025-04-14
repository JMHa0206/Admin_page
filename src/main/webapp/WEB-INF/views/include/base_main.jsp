<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 정보 관리</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: #f9f9f9;
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
	padding: 30px;
	background: #fff;
}
input, select, button {
	margin: 5px 0;
	padding: 8px;
	width: 100%;
	border: 1px solid #ccc;
	background: #fefefe;
}
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}
th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
.logo-img {
	max-width: 150px;
}
</style>
</head>
<body>
<div class="container">
	<div class="sidebar">
		<h3>기초정보 관리</h3>
		<a href="#" data-target="register">회사 정보 등록</a>
		<a href="#" data-target="view">회사 목록 조회</a>
	</div>

	<div class="main-content">

		<!-- 회사 정보 등록 -->
		<div id="register" class="section active">
			<h2>회사 정보 등록</h2>
			<form id="companyForm" enctype="multipart/form-data" method="post">
				<input type="text" name="com_name" placeholder="회사명" required />
				<input type="file" name="logo_file" accept="image/*" required />
				<button type="submit">등록</button>
			</form>
		</div>

		<!-- 회사 정보 목록 -->
		<div id="view" class="section" style="display:none;">
			<h2>회사 정보 목록</h2>
			<table>
				<thead>
					<tr>
						<th>회사 ID</th>
						<th>회사명</th>
						<th>로고</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="company-list">
					<!-- JS로 채워짐 -->
				</tbody>
			</table>
		</div>

	</div>
</div>

<script>
$(document).ready(function () {

	// 메뉴 클릭 처리
	$('.sidebar a').click(function (e) {
		e.preventDefault();
		$('.section').hide();
		let target = $(this).data('target');
		$('#' + target).show();
		if (target === 'view') loadCompanyList();
	});

	// 회사 정보 등록
	$('#companyForm').on('submit', function (e) {
		e.preventDefault();
		const formData = new FormData(this);

		$.ajax({
			url: "/Company/add",
			type: "POST",
			data: formData,
			processData: false,
			contentType: false,
			success: function () {
				alert("회사 정보가 등록되었습니다.");
				$('#companyForm')[0].reset();
			},
			error: function () {
				alert("등록 실패");
			}
		});
	});

	// 회사 목록 조회
	function loadCompanyList() {
		$.ajax({
			url: "/Company/list",
			method: "GET",
			dataType: "json",
			success: function (data) {
				const tbody = $('#company-list');
				tbody.empty();
				data.forEach(company => {
					const row = `
						<tr>
							<td>${company.com_id}</td>
							<td><input type="text" value="${company.com_name}" class="edit-name" data-id="${company.com_id}" /></td>
							<td><img src="${company.logo_path}" class="logo-img" /></td>
							<td><button class="update-btn" data-id="${company.com_id}">수정</button></td>
							<td><button class="delete-btn" data-id="${company.com_id}">삭제</button></td>
						</tr>`;
					tbody.append(row);
				});
			}
		});
	}

	// 수정
	$(document).on('click', '.update-btn', function () {
		const id = $(this).data('id');
		const name = $(`.edit-name[data-id='${id}']`).val();

		$.ajax({
			url: "/Company/update",
			method: "POST",
			data: { com_id: id, com_name: name },
			success: function () {
				alert("수정 완료");
				loadCompanyList();
			},
			error: function () {
				alert("수정 실패");
			}
		});
	});

	// 삭제
	$(document).on('click', '.delete-btn', function () {
		if (!confirm("정말 삭제하시겠습니까?")) return;

		const id = $(this).data('id');
		$.ajax({
			url: "/Company/delete",
			method: "POST",
			data: { com_id: id },
			success: function () {
				alert("삭제 완료");
				loadCompanyList();
			},
			error: function () {
				alert("삭제 실패");
			}
		});
	});
});
</script>
</body>
</html>
