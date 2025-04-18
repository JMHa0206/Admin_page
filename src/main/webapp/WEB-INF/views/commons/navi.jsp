<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<style>
.navbar {
  background-color: #2a4a77;
  padding: 12px 0;
  height: 30px;
  box-shadow: inset 0 -1px 0 rgba(0,0,0,0.05);
  display: flex;               /* 플렉스박스 사용 */
  justify-content: center;     /* 가로 중앙 정렬 */
  align-items: center;         /* 세로 중앙 정렬 (높이 30px에 대해) */
  gap: 20px;                   /* 링크 간 여백 설정 (선택) */
}


.navbar a {
  color: #f1f5fb;
  margin: 0 15px;
  text-decoration: none; /* 밑줄 제거 */
  font-weight: 500;
  font-size: 15px;
  padding: 6px 10px;
  border-radius: 4px;
  transition: background-color 0.2s ease, color 0.2s ease;
}

.navbar a:hover {
  background-color: #3b5d91; /* 마우스 오버 시 배경 변화 */
  color: #ffffff;
}
</style>

<div class="navbar">
    <a href="/admin/home?menu=basement" style="color: white; margin: 0 15px;">기본 관리</a>
    <a href="/admin/home?menu=permission" style="color: white; margin: 0 15px;">권한 관리</a>
    <a href="/admin/home?menu=emp" style="color: white; margin: 0 15px;">사원 관리</a>
    <a href="/admin/home?menu=dept" style="color: white; margin: 0 15px;">부서 관리</a>
    <a href="/admin/home?menu=board" style="color: white; margin: 0 15px;">게시판 관리</a>
    <a href="/admin/home?menu=work" style="color: white; margin: 0 15px;">인사정보 관리</a>
    <a href="/admin/home?menu=EDMS" style="color: white; margin: 0 15px;">전자결재 관리</a>
    <a href="/admin/home?menu=analysis" style="color: white; margin: 0 15px;">활동 분석(클릭금지)</a>
</div>