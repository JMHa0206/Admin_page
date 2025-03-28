<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 관리</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
    body { font-family: 'Arial', sans-serif; background: #fff; color: #111; margin: 0; padding: 0; }
    .wrapper { display: flex; height: 100vh; }
    .sidebar { width: 200px; background: #111; color: #fff; padding: 20px; box-sizing: border-box; }
    .sidebar h2 { font-size: 20px; margin-bottom: 20px; }
    .sidebar a { display: block; color: #ddd; text-decoration: none; margin-bottom: 10px; }
    .sidebar a:hover { color: #fff; }
    .content { flex: 1; padding: 30px; box-sizing: border-box; overflow-y: auto; }
    h3 { border-bottom: 1px solid #ccc; padding-bottom: 5px; }
    table { width: 100%; border-collapse: collapse; margin-top: 15px; }
    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
    th { background: #f4f4f4; }
    input[type="text"], select { padding: 5px; width: 100%; box-sizing: border-box; margin-top: 5px; }
    .form-group { margin-bottom: 10px; }
    .btn { padding: 5px 10px; background: #111; color: white; border: none; cursor: pointer; }
    .btn:hover { background: #333; }
</style>
</head>
<body>
<div class="wrapper">
    <div class="sidebar">
        <h2>부서 관리</h2>
        <a href="#" class="menu-btn" data-target="dept-section">부서 관리</a>
    </div>
    <div class="content">
        <!-- 부서 관리 -->
        <div class="section active" id="dept-section">
            <h3>부서 등록</h3>
            <form action="/Depart/insertDept" id="deptForm" method="post" >
                <div class="form-group">
                    <label>부서 이름</label>
                    <input type="text" name="dept_name" />
                </div>
                <button type="submit" class="btn">등록</button>
            </form>

            <h3>부서 목록</h3>
            <table>
                <thead>
                    <tr><th>부서ID</th><th>부서명</th><th>부서장</th><th>관리</th></tr>
                </thead>
                <tbody id="deptTable">
                    <!-- 부서 데이터 들어옴 -->
                	<tr>
                		<td></td>
                		<td></td>
                		<td></td>
                		<td></td>
                	</tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    // 메뉴 전환 (확장 가능성 대비 유지)
    $(document).ready(function() {
        $('.menu-btn').click(function(e) {
            e.preventDefault();
            const target = $(this).data('target');
            $('.section').removeClass('active');
            $('#' + target).addClass('active');
        });

        // 초기: 부서관리 보여주기
        $('#dept-section').addClass('active');
    });
    
    $(document).ready(function() { 
    $.ajax({
    	url:"/Depart/selectAllDept"
    }).done(function(resp){
    	console.log(resp);
    
 
    		
 
    })
    
    });
    
</script>
</body>
</html>
