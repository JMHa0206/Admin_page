<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>전자결재 관리</title>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdn.tiny.cloud/1/hxn7uw6e8li0hmpqrhwhgm2sr6jrapxrnjhu8g4bvl8cm8fg/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
  <style>
    body { font-family: 'Segoe UI', sans-serif; background: #f4f4f4; margin: 0; color: #333; }
    .container { display: flex; height: 100vh; }
    .sidebar { width: 200px; background-color: #222; color: #fff; padding: 20px; }
    .sidebar a { color: #ccc; display: block; margin: 10px 0; text-decoration: none; }
    .sidebar a:hover { color: #fff; }
    .main-content { flex: 1; padding: 20px; background: #fff; overflow-y: auto; }
    .section { display: none; }
    .section.active { display: block; }
    input, select, button { padding: 8px; border: 1px solid #ccc; background: #f9f9f9; margin-bottom: 10px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { padding: 10px; border-bottom: 1px solid #ccc; text-align: left; }
  </style>
</head>
<body>
  <div class="container">
    <div class="sidebar">
      <h3>전자결재 관리</h3>
      <a href="#" data-target="create">전자결재 양식 등록</a>
      <a href="#" data-target="read">전자결재 양식 조회</a>
      <a href="#" data-target="manage">양식 수정/삭제</a>
    </div>

    <div class="main-content">

      <!-- 등록 탭 -->
      <div id="create" class="section active">
        <h2>전자결재 양식 등록</h2>
        <form id="formMain" action="/form/insert" method="post">
          <input type="hidden" name="formId" value="" />
          <label>양식명:</label>
          <input type="text" name="formName" required />

          <label>양식 유형:</label>
          <select name="formType">
            <option value="연차">연차</option>
            <option value="출장">출장</option>
            <option value="지출결의">지출결의</option>
            <option value="기타">기타</option>
          </select>

          <label>양식 내용:</label>
          <textarea id="formContent" name="formContent"></textarea>

          <button type="submit" id="submitBtn">양식 등록</button>
        </form>
      </div>

      <!-- 조회 탭 -->
      <div id="read" class="section">
        <h2>전자결재 양식 조회</h2>
        <table>
          <thead>
            <tr>
              <th>번호</th>
              <th>양식명</th>
              <th>유형</th>
              <th>작성일</th>
              <th>작성자</th>
            </tr>
          </thead>
          <tbody>
            <!-- AJAX로 데이터 채움 -->
          </tbody>
        </table>
      </div>

      <!-- 수정/삭제 탭 -->
      <div id="manage" class="section">
        <h2>전자결재 양식 수정 / 삭제</h2>
        <label>양식 선택:</label>
        <select id="formSelector">
          <option value="">양식을 선택하세요</option>
        </select>
        <div id="previewArea" style="margin-top: 20px;"></div>
      </div>

    </div>
  </div>

  <script>
    $(document).ready(function () {
      // TinyMCE 초기화
      tinymce.init({
        selector: '#formContent',
        height: 400,
        plugins: 'table lists code',
        toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent | table | code',
        menubar: false
      });

      // 템플릿 자동 삽입
      $('select[name="formType"]').change(function () {
        const type = $(this).val();
        let template = "";

        if (type === "연차") {
        	  template = `
        	    <h3 style="text-align:center;">[연차 신청서]</h3>
        	    <table style="width: 100%; border-collapse: collapse;" border="1">
        	      <colgroup>
        	        <col style="width: 20%;" />
        	        <col style="width: 80%;" />
        	      </colgroup>
        	      <tbody>
        	        <tr><td><strong>제목</strong></td><td>{{제목}}</td></tr>
        	        <tr><td><strong>신청자</strong></td><td>{{신청자}}</td></tr>
        	        <tr><td><strong>연차 시작일</strong></td><td>{{시작일}}</td></tr>
        	        <tr><td><strong>연차 종료일</strong></td><td>{{종료일}}</td></tr>
        	        <tr><td><strong>사유</strong></td><td>{{사유}}</td></tr>
        	      </tbody>
        	    </table>

        	    <hr />
        	    <p style="font-weight:bold;">결재선</p>
        	    <table border="1" style="width:100%; text-align:center; border-collapse:collapse;">
        	      <thead>
        	        <tr>
        	          <td>1차</td><td>결재</td>
        	          <td>2차</td><td>결재</td>
        	          <td>3차</td><td>결재</td>
        	          <td>4차</td><td>결재</td>
        	          <td>최종</td><td>결재</td>
        	        </tr>
        	      </thead>
        	      <tbody>
        	      <tr>
        	      <td>{{level1.name}}</td><td rowspan="2"></td>
        	      <td>{{level2.name}}</td><td rowspan="2"></td>
        	      <td>{{level3.name}}</td><td rowspan="2"></td>
        	      <td>{{level4.name}}</td><td rowspan="2"></td>
        	      <td>{{finalLevel.name}}</td><td rowspan="2"></td>
        	    </tr>
        	    <tr>
        	      <td>{{level1.position}}</td>
        	      <td>{{level2.position}}</td>
        	      <td>{{level3.position}}</td>
        	      <td>{{level4.position}}</td>
        	      <td>{{finalLevel.position}}</td>
        	    </tr>
        	      </tbody>
        	    </table>
        	    

        	    <p style="font-weight:bold;">세부내용</p>
        	    <table style="width: 100%; border-collapse: collapse;" border="1">
        	      <colgroup>
        	        <col style="width: 20%;" />
        	        <col style="width: 80%;" />
        	      </colgroup>
        	      <tbody>
        	        <tr><td><strong>세부내용</strong></td><td><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></td></tr>
        	      </tbody>
        	    </table>
        	  `;
        	} else if (type === "출장") {
        	  template = `
        		    <h3 style="text-align:center;">[출장 신청서]</h3>
        		    <table style="width: 100%; border-collapse: collapse;" border="1">
        		      <colgroup>
        		        <col style="width: 20%;" />
        		        <col style="width: 80%;" />
        		      </colgroup>
        		      <tbody>
        		        <tr><td><strong>제목</strong></td><td>{{제목}}</td></tr>
        		        <tr><td><strong>신청자</strong></td><td>{{신청자}}</td></tr>
        		        <tr><td><strong>출장 시작일</strong></td><td>{{시작일}}</td></tr>
        		        <tr><td><strong>출장 종료일</strong></td><td>{{종료일}}</td></tr>
        		      </tbody>
        		    </table>

        		    <hr />
        		    <p style="font-weight:bold;">결재선</p>
        		    <table border="1" style="width:100%; text-align:center; border-collapse:collapse;">
        		      <thead>
        		        <tr>
        		          <td>1차</td><td>결재</td>
        		          <td>2차</td><td>결재</td>
        		          <td>3차</td><td>결재</td>
        		          <td>4차</td><td>결재</td>
        		          <td>최종</td><td>결재</td>
        		        </tr>
        		      </thead>
        		      <tbody>
        		      <tr>
        		      <td>{{level1.name}}</td><td rowspan="2"></td>
        		      <td>{{level2.name}}</td><td rowspan="2"></td>
        		      <td>{{level3.name}}</td><td rowspan="2"></td>
        		      <td>{{level4.name}}</td><td rowspan="2"></td>
        		      <td>{{finalLevel.name}}</td><td rowspan="2"></td>
        		    </tr>
        		    <tr>
        		      <td>{{level1.position}}</td>
        		      <td>{{level2.position}}</td>
        		      <td>{{level3.position}}</td>
        		      <td>{{level4.position}}</td>
        		      <td>{{finalLevel.position}}</td>
        		    </tr>
        		      </tbody>
        		    </table>

        		    <p style="font-weight:bold;">세부내용</p>
        		    <table style="width: 100%; border-collapse: collapse;" border="1">
        		      <colgroup>
        		        <col style="width: 20%;" />
        		        <col style="width: 80%;" />
        		      </colgroup>
        		      <tbody>
        		        <tr><td><strong>세부내용</strong></td><td><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></td></tr>
        		      </tbody>
        		    </table>
        		  `;
        		}  else {
        			  template = `
        				    <h3 style="text-align:center;">[기타 양식]</h3>
        				    <table style="width: 100%; border-collapse: collapse;" border="1">
        				      <colgroup>
        				        <col style="width: 20%;" />
        				        <col style="width: 80%;" />
        				      </colgroup>
        				      <tbody>
        				        <tr><td><strong>제목</strong></td><td>{{제목}}</td></tr>
        				        <tr><td><strong>작성자</strong></td><td>{{신청자}}</td></tr>
        				      </tbody>
        				    </table>

        				    <hr />
        				    <p style="font-weight:bold;">결재선</p>
        				    <table border="1" style="width:100%; text-align:center; border-collapse:collapse;">
        				      <thead>
        				        <tr>
        				          <td>1차</td><td>결재</td>
        				          <td>2차</td><td>결재</td>
        				          <td>3차</td><td>결재</td>
        				          <td>4차</td><td>결재</td>
        				          <td>최종</td><td>결재</td>
        				        </tr>
        				      </thead>
        				      <tbody>
        				      <tr>
        				      <td>{{level1.name}}</td><td rowspan="2"></td>
        				      <td>{{level2.name}}</td><td rowspan="2"></td>
        				      <td>{{level3.name}}</td><td rowspan="2"></td>
        				      <td>{{level4.name}}</td><td rowspan="2"></td>
        				      <td>{{finalLevel.name}}</td><td rowspan="2"></td>
        				    </tr>
        				    <tr>
        				      <td>{{level1.position}}</td>
        				      <td>{{level2.position}}</td>
        				      <td>{{level3.position}}</td>
        				      <td>{{level4.position}}</td>
        				      <td>{{finalLevel.position}}</td>
        				    </tr>
        				      </tbody>
        				    </table>

        				    <p style="font-weight:bold;">세부내용</p>
        				    <table style="width: 100%; border-collapse: collapse;" border="1">
        				      <colgroup>
        				        <col style="width: 20%;" />
        				        <col style="width: 80%;" />
        				      </colgroup>
        				      <tbody>
        				        <tr><td><strong>세부내용</strong></td><td><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></td></tr>
        				      </tbody>
        				    </table>
        				  `;
        				}

        tinymce.get("formContent").setContent(template);
      });

      // 탭 전환
      $('.sidebar a').click(function (e) {
        e.preventDefault();
        const target = $(this).data('target');
        $('.section').removeClass('active');
        $('#' + target).addClass('active');

        if (target === 'read') loadTable();
        if (target === 'manage') loadFormSelector();
      });

      // 폼 제출 시 TinyMCE 값 반영
      $('#formMain').submit(function () {
        const content = tinymce.get("formContent").getContent();
        $('#formContent').val(content);
      });

      // 양식 선택 시 미리보기
      $('#formSelector').change(function () {
        const selectedId = $(this).val();
        if (!selectedId) return;
        $.get("/form/" + selectedId, function (form) {
          $('#previewArea').html(
            '<h3>' + form.formName + '</h3>' +
            '<p><strong>유형:</strong> ' + form.formType + '</p>' +
            '<p><strong>작성일:</strong> ' + form.createdAt + '</p>' +
            '<p><strong>작성자:</strong> ' + form.createdBy + '</p>' +
            '<div style="border:1px solid #ccc; padding:10px; margin:10px 0;">' + form.formContent + '</div>' +
            '<button onclick="editSelectedForm(' + form.formId + ')">수정</button> ' +
            '<button onclick="deleteSelectedForm(' + form.formId + ')">삭제</button>'
          );
        });
      });
    });

    function loadTable() {
      $.get("/form/api/list", function (data) {
        const tbody = $('#read tbody');
        tbody.empty();
        data.forEach(function (form) {
          tbody.append(
            '<tr>' +
              '<td>' + form.formId + '</td>' +
              '<td>' + form.formName + '</td>' +
              '<td>' + form.formType + '</td>' +
              '<td>' + form.createdAt + '</td>' +
              '<td>' + form.createdBy + '</td>' +
            '</tr>'
          );
        });
      });
    }

    function loadFormSelector() {
      $.get("/form/api/list", function (data) {
        const selector = $('#formSelector');
        selector.empty().append('<option value="">양식을 선택하세요</option>');
        data.forEach(function (form) {
          selector.append('<option value="' + form.formId + '">' + form.formName + '</option>');
        });
      });
    }

    function editSelectedForm(formId) {
      $.get("/form/" + formId, function (form) {
        $('[data-target="create"]').click();
        $('[name="formName"]').val(form.formName);
        $('[name="formType"]').val(form.formType);
        tinymce.get("formContent").setContent(form.formContent);

        $('[name="formId"]').val(form.formId);
        $('#formMain').attr("action", "/form/update");
        $('#submitBtn').text("수정 완료");
      });
    }

    function deleteSelectedForm(formId) {
      if (confirm("정말 삭제하시겠습니까?")) {
        $.get("/form/delete/" + formId, function () {
          alert("삭제 완료");
          $('#formSelector').val('');
          $('#previewArea').empty();
          loadTable();
        });
      }
    }
  </script>
</body>
</html>
