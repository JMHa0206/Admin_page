<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><c:out value="${company.comName} 관리페이지" default="회사"/> 관리</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <style>
    body {
        margin: 0;
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f9fbfd;
    }

    .header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: #f9fbfd;
        padding: 14px 24px;
        color: #1a3c6c;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        height:100px;
    }

    .header-logo {
        height: 40px;
    }

    .header-title {
        flex-grow: 1;
        text-align: center;
        font-size: 20px;
        font-weight: 600;
        margin: 0;
        color: #1a3c6c;
        letter-spacing: 0.5px;
        padding:0px;
    }

    /* 필요시 버튼 등 재사용 UI 요소에 대한 공통 스타일 유지 */
    button {
        background-color: #1a3c6c;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    button:hover {
        background-color: #274b84;
    }
</style>

</head>
<body>

<div class="header">
    <!-- <img src="/resources/upload/logo.png" alt="로고" class="header-logo" /> -->
    <h2 class="header-title">
        <c:out value="${company.comName} 관리페이지" default="회사명 없음" />
    </h2>
</div>