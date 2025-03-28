<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  </style>
</head>
<body>
  <div class="container">
    <div class="sidebar">
      <h3>인사 관리</h3>
      <a href="#" data-target="checktime">정시 출퇴근 등록</a>
      <a href="#" data-target="annual">연차 생성</a>
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
        <label for="empId">사원 ID</label>
        <input type="number" id="empId" placeholder="예: 1001" />
        <button type="button" onclick="generateAnnual()">연차 생성</button>
      </div>

    </div>
  </div>

  <!-- ✅ JavaScript -->
  <script>
    $(document).ready(function () {
      // 탭 전환
      $('.sidebar a').click(function (e) {
        e.preventDefault();
        const target = $(this).data('target');
        $('.section').removeClass('active');
        $('#' + target).addClass('active');
      });
    });

    // 연차 생성
    function generateAnnual() {
      let empId = $('#empId').val().trim();
      if (!empId) {
        alert("사원 ID를 입력하세요");
        return;
      }

      $.post("/work/generateAnnual", { empId: empId }, function(result) {
        alert(result);
      }).fail(function() {
        alert("연차 생성에 실패했습니다.");
      });
    }
  </script>
</body>
</html>
