<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/init.jsp" %>
<%@ include file="../inc/header.jsp" %>
<%
    String contextPath = request.getContextPath();
    String message = (String) request.getAttribute("message");
    if (message == null) {
        message = "예기치 않은 오류가 발생했습니다.";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>알림</title>
    <link rel="stylesheet" href="/static/shop/styles/footer.css">
    <link rel="stylesheet" href="/static/shop/styles/footer2.css">
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        .result-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 500px;
            text-align: center;
        }
        .result-message {
            font-size: 24px;
            font-weight: bold;
            color: #b70000;
            margin-bottom: 30px;
        }
        .result-buttons {
            display: flex;
            gap: 20px;
        }
        .result-button {
            padding: 12px 24px;
            background-color: #e60023;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .result-button:hover {
            background-color: #cc001f;
        }
    </style>
</head>
<body>
    <div class="result-container">
        <div class="result-message">
            <%= message %>
        </div>
        <div class="result-buttons">
            <button class="result-button" onclick="history.back()">이전 페이지</button>
            <button class="result-button" onclick="location.href='<%= contextPath %>/shop/main'">메인 페이지</button>
        </div>
    </div>

    <%@ include file="../inc/footer2.jsp" %>
    <%@ include file="../inc/footer.jsp" %>
</body>
</html>