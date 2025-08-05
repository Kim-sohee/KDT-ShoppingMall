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
            width:100%;
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
            <form id="login-form">
                <input type="text" name="id" class="input-box" placeholder="아이디를 입력해주세요" required>
                <input type="password" name="password" class="input-box" placeholder="비밀번호를 입력해주세요" required>

                <div class="options">
                    <label><input type="checkbox" name="saveid"> 아이디 저장</label>
                    <div>
                        <a href="/shop/member/findForm">아이디 찾기</a> | 
                        <a href="/shop/member/findForm">비밀번호 찾기</a>
                    </div>
                </div>

                <button type="button" class="btn-login" id="bt_login">로그인</button>
            </form>
            <button onclick="location.href='/shop/member/joinform'" class="btn-join">회원가입</button>

            <div class="sns-login">SNS 로그인</div>
            <div class="sns-icons">
                <a href="javascript:login('naver')" ><img src="/img/login/naver_login.png" alt="네이버 로그인"></a>
                <a href="javascript:login('google')"><img src="/img/login/google_login.png"  alt="구글 로그인"></a>
            </div>
        </div>
    </div>
	<%@include file = "./inc/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function login(sns){
		$.ajax({
			url:"/shop/member/"+sns+"/authurl",
			type:"get",
			success:function(result, status, xhr){
				alert(result);
				location.href=result;
			}
		});
	}
	
	function homeLogin(){
		$.ajax({
			url:"/shop/member/login",
			type:"post",
			data: $("#login-form").serialize(),
			success:function(result, status, xhr){
				if (result.success) {
	                location.href = "/shop/main";
	            } else {
	                alert(result.message || "로그인에 실패했습니다.");
	            }
			},
			error:function(xhr, status, error){
				alert("서버 오류가 발생했습니다: " + (xhr.responseJSON?.message || error));
			}
		});
	}
	
	$(()=>{
		$("#bt_login").click(()=>{
			homeLogin();
		});
	});
</script>
</html>
