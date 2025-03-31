<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>인사 관리</title>
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

    label {
      font-weight: bold;
      display: block;
      margin-top: 10px;
    }

    hr {
      margin: 20px 0;
    }
    
    
    .annual-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    border-radius: 4px;
    overflow: hidden;
  }
  
  .annual-header {
    background-color: #222;
    color: white;
    text-align: left;
    padding: 12px 15px;
    font-weight: 500;
  }
  
  .annual-row {
    border-bottom: 1px solid #e0e0e0;
    transition: background-color 0.2s;
  }
  
  .annual-row:last-child {
    border-bottom: none;
  }
  
  .annual-row:hover {
    background-color: #f9f9f9;
  }
  
  .annual-data {
    padding: 10px 15px;
    color: #333;
  }
  
  .annual-years {
    font-weight: 500;
  }
  
  .annual-days {
    
    font-weight: bold;
  }
  
  .annual-days span {
    display: inline-block;
    padding: 4px 8px;
    border-radius: 3px;
    background-color: #e8f4f8;
    color: #0277bd;
    min-width: 25px;
  }
  </style>
</head>
<body>
  <div class="container">
    <div class="sidebar">
      <h3>인사 관리</h3>
      <a href="#" data-target="checktime">정시 출퇴근 등록</a>
      <a href="#" data-target="annual">연차 생성</a>
      <a href="#" data-target="select">연차 발생</a>
    </div>

    <div class="main-content">

      <!-- 출퇴근 등록 -->
      <div id="checktime" class="section active">
        <h2>정시 출퇴근 시간 등록</h2>
        <form action="/work/update" method="post">
          <input type="hidden" name="id" value="1"/>
          <input type="hidden" name="updated_by" value="1001"/>
          <input type="hidden" name="updated_at" value="<%= new java.sql.Timestamp(System.currentTimeMillis()) %>"/>

          <label for="standard_check_in">출근 시간</label>
          <input type="time" name="standard_check_in" required />

          <label for="standard_check_out">퇴근 시간</label>
          <input type="time" name="standard_check_out" required />

          <hr/>
          <button type="submit">출퇴근 시간 등록</button>
        </form>
      </div>

      <!-- 연차 생성 -->
      <div id="annual" class="section">
        <h2>연차 생성</h2>
        <input type="text" id = "years_of_service" name ="years_of_service" placeholder="연차를 적어주세요.">년차
        <input type = "text" id = "leave_days" name = "leave_days" placeholder="연차 일수를 적어주세요."/>
        <button type="button" onclick="generateAnnual()">연차 생성</button>
      </div>
      <div id="select" class="section">
      	<h2>연차 발생</h2>
      		<table class="annual-table">
      			<thead>
      				<tr>
      					<th class="annual-header">년차</th><th class="annual-header">일수</th>
      				</tr>
      			</thead>
      			<tbody id = "empleave_days">
					
      			</tbody>
      		</table>
      </div>
    </div>
  </div>

  <!-- ✅ JavaScript -->
  <script>

  function generateAnnual() {
      let leave_days = $('#leave_days').val().trim();
      let years_of_service = $('#years_of_service').val().trim();
      
      if (!leave_days || !years_of_service) {
          alert("연차를 입력해 주세요.");
          return;
      }

      $.ajax({
          type: "POST",
          url: "/work/generateAnnual",
          contentType: "application/json; charset=UTF-8",
          data: JSON.stringify({
              years_of_service: years_of_service,
              leave_days: leave_days
          }),
          dataType: "text",
          success: function(result) {
              alert(result);  
              selectAnnualLeave(); 
          },
          error: function(xhr, status, error) {
              alert("연차 생성에 실패했습니다.");
          }
      });
  }

  function selectAnnualLeave() {
      $.ajax({
          url: "/work/selectAll"
      }).done(function(resp) {
          let html = "";
          resp.forEach(function(i) {
              html += "<tr class='annual-row'><td class='annual-data annual-years'>"+ i.years_of_service +
                      "년차</td><td class='annual-data annual-days'><span>"+ i.leave_days +
                      "일</span></td></tr>";
          });
          $("#empleave_days").html(html);
      });
  }


  $(document).ready(function () {
      // 탭 전환
      $('.sidebar a').click(function (e) {
          e.preventDefault();
          const target = $(this).data('target');
          $('.section').removeClass('active');
          $('#' + target).addClass('active');
      });

      selectAnnualLeave();
  });
  </script>
</body>
</html>
