<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 로그인</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 320px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #0066cc;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        button:hover {
            background-color: #0052a3;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            font-size: 13px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>CodeBreaker 관리자 로그인</h2>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="아이디" required />
            <input type="password" name="password" placeholder="비밀번호" required />
            <button type="submit">로그인</button>
        </form>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>
    </div>

</body>
</html>
