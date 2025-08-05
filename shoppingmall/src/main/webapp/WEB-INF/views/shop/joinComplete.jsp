<%@ page contentType="text/html; charset=UTF-8"%>
<% Member member = (Member)session.getAttribute("member"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보드게임 | 회원가입 완료</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/shop/styles/joinComplete.css">
    <link rel="stylesheet" href="/static/shop/styles/footer.css">
</head>
<body>

    <!-- header 시작 -->
    <%@ include file="./inc/header.jsp"%>
    <!-- header 끝 -->

    <!-- navigation 시작 -->
    <%@ include file="./inc/nav.jsp"%>
    <!-- navigation 끝 -->

    <!-- 회원가입 완료페이지 시작 --> 
    <section class="join">
        <div class="join-container">
            <div class="join-content">

                <!-- 회원가입 절차 시작 -->
                <div class="join-process">
                    <h2>회원가입</h2>
                    <div class="process-steps">
                        <div class="steps">
                            <div class="img_container">
                                <img src="/img/Accept_terms.png" alt="약관동의">
                            </div>
                            <p>약관동의</p>
                        </div>
                        <div class="steps">
                            <div class="img_container">
                                <img src="/img/Fill_detail.png" alt="정보입력">
                            </div>
                            <p>정보입력</p>
                        </div>
                        <div class="steps">
                            <div class="img_container">
                                <img src="/img/Regist_complete.png" alt="가입완료">
                            </div>
                            <p>가입완료</p>
                        </div>
                    </div>
                </div>
                <!-- 회원가입 절차 끝 -->

                <hr style="border: thin 1px #ccc;">

                <!-- 회원가입 완료 안내 시작 -->
                <div class="join-complete">
                    <h2>회원가입 완료!</h2>
                    <img src="/img/Welcome.png" alt="회원가입을 환영합니다.">
                    <div class="info">
                        <p><%=member.getMember_name() %> 님의 회원가입이 성공적으로 완료되었습니다.</p>
                        <p>회원가입 내역 확인 및 수정은 마이페이지 > 회원정보 수정에서 가능합니다.</p>
                    </div>
                </div>
                <!-- 회원가입 완료 안내 끝 -->
              
                <hr style="border: thin 1px #ccc;">

                <!-- 버튼 시작 -->
                <div class="button-container">
                    <button type="button" id="bt_login">로그인 하기</button>
                    <button type="button" id="bt_home">홈으로</button>
                </div>
                <!-- 버튼 끝 -->
              
            </div>
        </div>
    </section>

    <!-- footer 시작 -->  
    <%@ include file="./inc/footer.jsp" %>
    <!-- footer 끝 -->  
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(()=>{
		//로그인 하기
		$("#bt_login").click(()=>{
			location.href="/shop/member/loginform";
		});

		//홈으로 이동
		$("#bt_home").click(()=>{
			location.href="/shop/main";
		});
			
		
	});
</script>
</html>
