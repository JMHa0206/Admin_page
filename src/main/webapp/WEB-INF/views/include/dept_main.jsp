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
    	url:"/Depart/selectAllDept",
    	type:"GET"
    }).done(function(resp){    	
    	 $('#deptTable').empty(); 
    	 resp.forEach(function(dept) {
    	        	 let row = '<tr>' +
                     '<td>' + dept.dept_id + '</td>' + // 부서 ID
                     '<td class="dept-name" contenteditable="false">' + dept.dept_name + '</td>' + // 부서 이름
                     '<td>' + dept.manager + '</td>' + // 부서장 정보
                     '<td>' +
                     '<button class="edit-btn">수정</button>' + // 수정 버튼
                     '<button class="confirm-edit-btn" style="display:none;">수정 완료</button>' + // 수정 완료 버튼, 처음에는 숨김
                     '<button class="cancel-edit-btn" style="display:none;">취소</button>' + // 취소 버튼, 처음에는 숨김
                     '<button class="delete-btn">삭제</button>' + // 삭제 버튼
                     '</td>' +
                 '</tr>';
    	        $('#deptTable').append(row); // 테이블에 추가
    	    });
    	
 
    })
    
    // 수정 버튼 클릭 이벤트
    $(document).on('click', '.edit-btn', function() {
        // 클릭한 버튼의 부모 tr을 찾음
        const row = $(this).closest('tr');
        // 부서명 셀을 찾고 contenteditable을 true로 설정
        row.find('.dept-name').attr('contenteditable', 'true').focus();
        // 수정 완료 버튼과 취소 버튼을 보여주고 수정 버튼은 숨김
        row.find('.delete-btn').hide();
        row.find('.confirm-edit-btn').show();
        row.find('.cancel-edit-btn').show();
        $(this).hide();
    });
    
    //수정 완료 버튼 클릭 이벤트
    $(document).on('click', '.confirm-edit-btn', function() {
        const row = $(this).closest('tr'); // 현재 행을 선택
        const deptId = row.find('td:first').text(); // 부서 ID 가져오기
        const updatedName = row.find('.dept-name').text(); // 수정된 부서 이름 가져오기

        // AJAX 요청으로 수정된 부서 이름 전송
        $.ajax({
            url: '/Depart/updateDept', // 수정 요청을 처리할 URL
            type:'POST',
           	data:{
           		dept_id:deptId,
           		dept_name:updatedName
           	}
        }).done(function(resp){
       		console.log(resp);
       	});

        // 부서명 셀의 contenteditable을 false로 설정
        row.find('.dept-name').attr('contenteditable', 'false');

        // 버튼 상태 조정
        row.find('.edit-btn').show();
        row.find('.delete-btn').show();
        row.find('.confirm-edit-btn').hide(); // 수정 완료 버튼 숨김
        $(this).siblings('.cancel-edit-btn').hide(); // 취소 버튼 숨김
    });   
    
    // 취소 버튼 클릭 이벤트
    $(document).on('click', '.cancel-edit-btn', function() {
        const row = $(this).closest('tr'); // 현재 행을 선택
        // 부서명 셀의 contenteditable을 false로 설정
        row.find('.dept-name').attr('contenteditable', 'false');

        // 수정 버튼과 수정 완료 버튼 상태 조정
        row.find('.edit-btn').show();
        row.find('.delete-btn').show();
        row.find('.confirm-edit-btn').hide(); // 수정 완료 버튼 숨김
        $(this).hide(); // 취소 버튼 숨김
    });
    
    $(document).on('click','.delete-btn',function(){
    	const row = $(this).closest('tr');
    	let deptid = row.find('td:first').text();
    	
    	$.ajax({
    		url:'/Depart/deleteDept',
    		type:'POST',
    		data :{
    			dept_id:deptid
    		}
    	});//ajax
    	row.remove();
    	
    	
    })
    
});
    
</script>
</body>
</html>
