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
            font-family: 'Segoe UI', sans-serif;
        }

        .header {
            display: flex;
            align-items: center;
            background: #f9f9f9;
            padding: 10px 20px;
            border-bottom: 1px solid #ccc;
        }

        .header-logo {
            height: 40px;
            margin-right: 20px;
        }

        .header-title {
            flex-grow: 1;
            text-align: center;
            font-size: 20px;
            font-weight: 600;
            color: #222;
            margin: 0;
            letter-spacing: 0.5px;
        }
    </style>
</head>
<body>

<div class="header">
    <img src="/resources/upload/logo.png" alt="로고" class="header-logo" />
    <h2 class="header-title">
        <c:out value="${company.comName} 관리페이지" default="회사명 없음" />
    </h2>
</div>