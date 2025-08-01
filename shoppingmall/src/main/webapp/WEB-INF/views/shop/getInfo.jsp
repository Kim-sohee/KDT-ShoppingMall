<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
        .right-title {
            font-size: 1.6rem;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }
        .insert-info {
		    border: 1px solid black;
		    padding: 1rem 2rem;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		    margin-bottom: 4rem;
		}
        .insert-info form {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    width: 100%;
		}
        .insert-info-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }
        .insert-info input {
            width: 60%;
            padding: 12px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            font-size: 16px;
            align-self: center;
        }
        .insert-info button {
            width: 40%;
            padding: 0.5rem 2.5rem;
            background-color: #d71920;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 10px;
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
            <!-- 이메일 요청 입력 시작 -->
			<div class="right-title">
				<span>요청 정보 발송 완료</span>
			</div>
				
			<div class="insert-info">
				<div class="insert-info-title">
					<span>입력하신 메일 주소로 요청하신 내용을 발송하였습니다.</span>
				</div>
				<button class="bt_return" id="bt_login">로그인 하기</button>
            	<button class="bt_return" id="bt_home">홈으로</button>
			</div>
            <!-- 비밀번호 요청 입력 끝 -->
            
        </div>
    </div>
	<%@include file = "./inc/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(()=>{
		$("#bt_login").click(()=>{
			location.href="/shop/member/loginform";
		});
		$("#bt_home").click(()=>{
			location.href="/shop/main";
		});
	});
</script>
</html>
