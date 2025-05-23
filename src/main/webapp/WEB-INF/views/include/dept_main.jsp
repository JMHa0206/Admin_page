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

h3 {
  border-bottom: 1px solid #ccc;
  padding-bottom: 5px;
  font-size: 20px;
  color: #1a3c6c;
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

.btn {
  padding: 10px 16px;
  background-color: #1a3c6c;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.btn:hover {
  background-color: #274b84;
}

button.edit-btn,
button.confirm-edit-btn,
button.cancel-edit-btn,
button.delete-btn {
  padding: 6px 10px;
  margin: 2px;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  background-color: #1a3c6c;
  color: white;
  font-size: 13px;
}

button.confirm-edit-btn {
  background-color: #28a745;
}

button.cancel-edit-btn {
  background-color: #6c757d;
}

button.delete-btn {
  background-color: #dc3545;
}

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
      <h2  style="color:black">부서 등록</h2>
      <form action="/Depart/insertDept" id="deptForm" method="post">
        <div class="form-group">
          <label>부서 이름</label>
          <input type="text" name="dept_name" />
        </div>
        <button type="submit" class="btn">등록</button>
      </form>

      <h2 style="color:black">부서 목록</h2>
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
      if (confirm("부서를 삭제하시겠습니까?")) {
    	  $.ajax({
    	        url: '/Depart/deleteDept',
    	        type: 'POST',
    	        data: { dept_id: deptid }
    	      }).done(function () {
    	        row.remove();
    	      });
    	  console.log("부서가 삭제되었습니다.");
    	} else {
    	  return;
    	  console.log("삭제가 취소되었습니다.");
    	}

    });
    
    
  });
    
    </script>
</body>
</html>