<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보드게임</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap">
<link rel="stylesheet" href="/static/shop/styles/join.css">
<link rel="stylesheet" href="/static/shop/styles/footer.css">
<link rel="stylesheet" href="/static/shop/styles/footer2.css">
</head>
<body>
	<!-- header 시작 -->
	<%@ include file="./inc/header.jsp"%>
	<!-- header 끝 -->

	<!-- navigation 시작 -->
	<%@ include file="./inc/nav.jsp"%>
	<!-- navigation 끝 -->

	<!-- 회원가입 본문 시작 -->
	<section class="join">
		<div class="join-container">
			<div class="join-content">

				<!-- 회원가입 절차 시작 -->
				<div class="join-process">
					<h2>회원가입</h2>

					<!-- 회원가입 이미지 시작 -->
					<div class="process-steps">
						<div class="steps">
							<div class="img_container">
								<img src="/img/Accept_terms.png" alt="약관동의"><br>
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
					<!-- 회원가입 이미지 끝 -->

				</div>
				<!-- 회원가입 절차 끝 -->

				<!-- 회원가입 필수항목 입력 시작 -->
				<form id="form1">
					<div class="join-fill">
						<div class="join-fill-header">
							<h3>필수항목을 반드시 입력해주세요.</h3>
							<h5>*필수항목</h5>
						</div>
	
						<hr style="border: thin 1px #ccc;">
	
							<div class="join-fill-data">
									<div class="fill-content">
										<div>이름</div>
										<input type="text" name="member_name" id="member_name" placeholder="이름을 입력하세요">
									</div>
									<div class="fill-content">
										<div>연락처</div>
										<input type="text" name="phone" id="phone" placeholder="휴대폰 번호를 입력하세요">
									</div>
									<div class="fill-content">
										<div>아이디</div>
										<input type="text" name="id" id="id" placeholder="영소문자 혹은 영소문자/숫자 조합 6~16자">
									</div>
									<div class="fill-content">
										<div>비밀번호</div>
										<input type="password" name="password" id="password" placeholder="영대문자 포함, 영어/숫자/특수문자 조합 8~16자">
									</div>
									<div class="fill-content">
										<div>비밀번호 확인</div>
										<input type="password" name="password_confirm" id="password_confirm" placeholder="비밀번호 확인을 위해 한번 더 입력해주세요">
									</div>
									<div class="fill-content">
										<div>주소(배송지)</div>
										<input type="text" name="default_address" id="default_address" placeholder="기본배송지 설정을 위한 주소를 입력해주세요">
									</div>
									<input type="hidden" name="email" id="email" />
							</div>
							
							<!-- 이메일 입력 시작 -->
							<div class="email-box">
								<div>이메일 주소</div>
								<input type="text" placeholder="이메일을 입력하세요"	name="email_id"> <span>@</span>
								<input type="text" placeholder="직접 입력" 				name="email_domain"	 id="emailDomainInput"> 
								<select id="emailDomainSelect">
									<option value="0">도메인을 선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.com">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="kakao.com">kakao.com</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
								</select>
							</div>
							<!-- 이메일 입력 끝 -->
						</div>
	
					<!-- 이메일 주의사항 시작 -->
					<div class="email-info">
						<h6>주문 및 배송확인 정보 등이 e-mail로 발송되므로 반드시 수신가능한 e-mail 주소를 입력하세요.</h6>
					</div>
					<!-- 이메일 주의사항 끝 -->
	
					<hr style="border: thin 1px #ccc;">
	
					<!-- 회원가입 버튼 시작 -->
					<button id="bt_regist">회원가입 완료</button>
					<!-- 회원가입 버튼 끝 -->
				</form>
				<!-- 회원가입 필수항목 입력 끝 -->
			</div>
		</div>
	</section>
	<!-- 회원가입 본문 끝 -->

	<!-- footer 시작 -->
	<%@ include file="./inc/footer.jsp"%>
	<!-- footer 끝 -->
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	//회원가입 데이터 전송 함수
	function regist(){
        //이메일 합치기
        const emailId = $('input[name="email_id"]').val().trim();
        const emailDomain = $('input[name="email_domain"]').val().trim();
        
        if(emailId === "" || emailDomain === "") {
			return;
        } else {
			$("#email").val(emailId+"@"+emailDomain);
		}

		//비밀번호 검증
		const password = $('input[name="password"]').val().trim();
		const passwordConfirm = $('input[name="password_confirm"]').val().trim();

		if(password !== passwordConfirm) {
			alert('비밀번호가 일치하지 않습니다.');
			return;
		}
		
		$("#form1").attr({
			action:"/shop/member/join",
			method:"post"
		});
		$("#form1").submit();
		
		/*
		$.ajax({
			url:"/shop/member/regist",
			type:"post",
			data:{
                member_name: $("#member_name").val(),
                phone: $("#phone").val(),
                id: $("#id").val(),
                password: $("#password").val(),
                email: $("#email").val()
                default_address: $("#default_address").val()
			},
			success: function(result, status, xhr) {
			    console.log(result);
			    alert("회원가입이 완료되었습니다.");
			    location.href = '/shop/join';
		  	},
			  error: function(xhr, status, error) {
			    console.error("에러 발생: ", error);
			    alert("회원가입 중 오류가 발생했습니다.");
			}
		});
		*/
	}

	// 도메인 선택 시 도메인 input 자동 채우기 / 수정 가능 여부 제어 함수
	function selectedDomainInput(){
		const selectedDomain = $("#emailDomainSelect").val();
		const domainInput = $("#emailDomainInput");
		
		if(selectedDomain !== "0") {
			domainInput.val(selectedDomain).prop('readonly', true);
		} else {
			domainInput.val('').prop('readonly', false);
		}
	}
	
	$(()=>{
		//회원가입 데이터 전송
		$("#bt_regist").click(()=>{
			regist();
		});
		
		$('#emailDomainSelect').change(()=>{
			selectedDomainInput();
		});
	});
</script>
</html>


