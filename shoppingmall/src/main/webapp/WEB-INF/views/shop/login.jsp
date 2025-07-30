<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 로그인</title>
    <link rel="stylesheet" href="/static/shop/styles/footer.css">
    <style>
        body {
            margin: 0;
            font-family: '맑은 고딕', sans-serif;
            background-color: #fff;
        }
        .container {
            display: flex;
            height: 100vh;
        }
        .left {
            flex: 1;
            background-color: #5c2c1b;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            font-size: 24px;
            font-weight: bold;
            line-height: 1.6;
            white-space: pre-line;
        }
        .right {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 80px;
        }
        .login-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .input-box {
            width: 100%;
            padding: 12px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            margin-bottom: 20px;
        }
        .btn-login {
            width: 100%;
            padding: 14px;
            background-color: #d71920;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 10px;
        }
        .btn-join {
            width: 100%;
            padding: 14px;
            background-color: white;
            color: black;
            border: 1px solid #ccc;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 30px;
        }
        .sns-login {
            text-align: center;
            font-size: 13px;
            color: #888;
            margin-bottom: 10px;
        }
        .sns-icons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .sns-icons img {
            width: 40px;
            height: 40px;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	<!-- navigation -->
	<%@ include file="./inc/nav.jsp"%>
    <div class="container">
        <div class="left">
            지금,<br>
            여기 페이지 수정해주실분<br>
            찾습니다! 선착순 3명!<br>
            박유신김소희<br>
            류희용문창규
        </div>
        <div class="right">
            <div class="login-title">회원 로그인</div>
            <form action="/shop/member/login" method="post">
                <input type="text" name="email" class="input-box" placeholder="이메일을 입력해주세요" required>
                <input type="password" name="password" class="input-box" placeholder="비밀번호를 입력해주세요" required>

                <div class="options">
                    <label><input type="checkbox" name="saveid"> 이메일 저장</label>
                    <div>
                        <a href="#">이메일 찾기</a> | 
                        <a href="#">비밀번호 찾기</a>
                    </div>
                </div>

                <button type="submit" class="btn-login">로그인</button>
            </form>
            <button onclick="location.href='/shop/member/join'" class="btn-join">회원가입</button>

            <div class="sns-login">SNS 로그인</div>
            <div class="sns-icons">
                <img src="/static/img/naver.png" alt="네이버 로그인">
                <img src="/static/img/kakao.png" alt="카카오 로그인">
            </div>
        </div>
    </div>
	<%@include file = "./inc/footer.jsp" %>
</body>
</html>
