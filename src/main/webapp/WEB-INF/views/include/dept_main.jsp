<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>부서 관리</title>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <style>
    body { font-family: 'Segoe UI', sans-serif; background: #f4f4f4; margin: 0; color: #333; }
    .wrapper { display: flex; height: 100vh; }
    .sidebar { width: 200px; background: #222; color: #fff; padding: 20px; box-sizing: border-box; }
    .sidebar h2 { font-size: 20px; margin-bottom: 20px; }
    .sidebar a { display: block; color: #ccc; text-decoration: none; margin-bottom: 10px; }
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
    <div class="section active" id="dept-section">
      <h3>부서 등록</h3>
      <form action="/Depart/insertDept" id="deptForm" method="post">
        <div class="form-group">
          <label>부서 이름</label>
          <input type="text" name="dept_name" />
        </div>
        <button type="submit" class="btn">등록</button>
      </form>

      <h3>부서 목록</h3>
      <table>
        <thead>
        <tr><th>부서ID</th><th>부서명</th><th>부서장</th><th>upper_dept</th><th>관리</th></tr>
        </thead>
        <tbody id="deptTable"></tbody>
      </table>
    </div>
  </div>
</div>

<script>
  $(document).ready(function () {
    $('.menu-btn').click(function (e) {
      e.preventDefault();
      const target = $(this).data('target');
      $('.section').removeClass('active');
      $('#' + target).addClass('active');
    });

    // 부서 목록 불러오기
    $.ajax({
      url: "/Depart/selectAllDept",
      type: "GET"
    }).done(function (resp) {
  	
      $('#deptTable').empty();
      resp.forEach(function (dept) {
    
    	  let row = '<tr>' +
          '<td class="dept-id">' + dept.dept_id + '</td>' +
          '<td class="dept-name" contenteditable="false">' + dept.dept_name + '</td>' +
          '<td class="dept-manager">' +
          '<span class="current-manager">' +
           (dept.emp_name ? dept.emp_name : '<span class="no-manager">부서장 없음</span>') + 
          '</span>' + 
          '<select class="manager-select" style="display:none;">' +
          '<option value="">부서장 선택</option>' +
          '</select>' +
          '</td>' +
          '<td class="upper_dept">' +
          '<span class="current-upper">' +
          (dept.upper_dept ? dept.upper_dept : '<span class="no-upper">직속부서 없음</span>') +
          '</span>' +
          '<select class="upper-select" style="display:none;">' +
          '<option value="">직속부서ID 선택</option>' +
          '</select>' +
          '</td>' +
          '<td>' +
          '<button class="edit-btn">수정</button>' +
          '<button class="confirm-edit-btn" style="display:none;">수정 완료</button>' +
          '<button class="cancel-edit-btn" style="display:none;">취소</button>' +
          '<button class="delete-btn">삭제</button>' +
          '</td>' +
          '</tr>';
        $('#deptTable').append(row);
      });
    });

  

    $(document).on('click', '.edit-btn', function () {
      const row = $(this).closest('tr');
      row.find('.dept-name').attr('contenteditable', 'true').focus();
	  const originalName = row.find('.dept-name').text().trim();
	  row.data('originalName' , originalName);
       $.ajax({
    	url:"/Employee/selectDeptManager",
    	type:'GET',
    	data:{
    		id:row.find('.dept-id').text()
    	}
      }).done(function(resp){
    	
     	    const managerSelect = row.find('.manager-select');
     	 	managerSelect.empty();
     		managerSelect.append('<option class="option" value="">부서장 선택</option>'); 
    	  
    	  resp.forEach(function(dept){
    		 managerSelect.append('<option class="option" value="'+dept.emp_code_id+'">'+dept.emp_name+'</option>');
    	 
    	  });   
      row.find('.manager-select').show();
    	
       $.ajax({
    	  url:"/Depart/selectUpperDept",
    	  type:'GET',
    	  data:{
    		  id:row.find('.dept-id').text()
    	  }
      }).done(function(resp){
   
    	 
     	 const upperSelect = row.find('.upper-select');
    	 upperSelect.empty();
    	 upperSelect.append('<option class="option" value="">직속부서ID 선택</option>');
    	 
    	  for(let i=0; i< resp.length; i++ ){
    		 upperSelect.append('<option class="option" value="'+resp[i]+'">'+resp[i]+'</option>');
    	 }; 
    	 row.find('.upper-select').show(); 
    	 
      });//done여기까지 
      
     });
       
      
      row.find('.edit-btn').hide();
      row.find('.delete-btn').hide();
      row.find('.confirm-edit-btn').show();
      row.find('.cancel-edit-btn').show();
  });
      
    $(document).on('click', '.confirm-edit-btn', function () {
      const row = $(this).closest('tr');
      const deptId = row.find('td:first').text();
      const updatedName = row.find('.dept-name').text();
      const managerId = row.find('.manager-select').val();
      const upperDept = row.find('.upper-select').val() || null;
      console.log(upperDept);
	
  	if(managerId !== "" && updatedName !== ""){
      $.ajax({
        url: '/Depart/updateDept',
        type: 'POST',
        data: {
          dept_id: deptId,
          dept_name: updatedName,
          dept_manager: managerId,
          upper_dept: upperDept
        }
      }).done(function () {
    	   
        row.find('.dept-name').attr('contenteditable', 'false');
        row.find('.dept-manager .current-manager').text(row.find('.manager-select option:selected').text()); // 부서장 이름 업데이트
       	row.find('.upper_dept .current-upper' ).text(upperDept ? row.find('.upper-select option:selected').text() : '직속부서 없음');
        row.find('.edit-btn').show();
        row.find('.delete-btn').show();
        row.find('.confirm-edit-btn').hide();
        row.find('.cancel-edit-btn').hide();
        row.find('.manager-select').hide();
		row.find('.upper-select').hide();
        
      });
  	
    }else{
    	alert("빈값 입니다.");
    	return false;
    }
       
});
    

    $(document).on('click', '.cancel-edit-btn', function () {
    	 const row = $(this).closest('tr');
    	 const originalName = row.data('originalName');
    	
    	 row.find('.dept-name').text(originalName);
    	 row.find('.dept-name').attr('contenteditable', 'false');
    	 row.find('.no-manager').show();
    	 row.find('.manager-select').hide();
    	 row.find('.confirm-edit-btn').hide();
    	 row.find('.cancel-edit-btn').hide();
    	 row.find('.edit-btn').show();
    	 row.find('.delete-btn').show();
    	 row.find('.upper-select').hide();
    });

    $(document).on('click', '.delete-btn', function () {
      const row = $(this).closest('tr');
      const deptid = row.find('td:first').text();

      $.ajax({
        url: '/Depart/deleteDept',
        type: 'POST',
        data: { dept_id: deptid }
      }).done(function () {
        row.remove();
      });
    });
    
    
  });
    
    </script>
</body>
</html>