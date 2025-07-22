<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<div class="join">
    <div class="join-container">
        <div class="join-content">
			<div class="join-process">
                <h2>회원가입 절차</h2 >
                <div class="process-steps">
	                <div class="steps">
	                	<div class="img_container">
			                <img src="../img/Accept_terms.png" alt="약관동의"><br>
	                	</div>
		                <p>약관동의</p>
	                </div>
	                <div class="steps">
		                <div class="img_container">
			                <img src="../img/Fill_detail.png" alt="정보입력">
		                </div>
		                <p>정보입력</p>
	                </div>
	                <div class="steps">
	                	<div class="img_container">
	                		<img src="../img/Regist_complete.png" alt="가입완료">
	                	</div>	
		                <p>가입완료</p>
	                </div>
            	</div>
            </div>
            <div class="join-fill">
                <h3>필수항목을 반드시 입력해주세요.</h3>
                <hr color = "#ccc;" size=2px;>
                <div class="fill-content">
                	<div>이름</div><input type="text" placeholder="이름을 입력하세요">
                </div>
                <div class="fill-content">
	                <div>연락처</div><input type="text" placeholder="휴대폰 번호를 입력하세요">
                </div>
                <div class="fill-content">
	                <div>아이디</div><input type="text" placeholder="영소문자 혹은 영소문자/숫자 조합 6~16자">
                </div>
                <div class="fill-content">
	                <div>비밀번호</div><input type="text" placeholder="영대문자 포함, 영어/숫자/특수문자 조합 8~16자">
                </div> 
                <div class="fill-content">
                	<div>비밀번호 확인</div><input type="text" placeholder="비밀번호 확인을 위해 한번 더 입력해주세요">
                </div>
                <div class="fill-content">
                	<div>이메일 주소</div>
                	<div class="email-box">
	                	<input type="text" placeholder="이메일을 입력하세요"> 
	                	<span>@</span> 
	                	<input type="text" placeholder="비밀번호 확인을 위해 한번 더 입력해주세요">
	                	<select>
		                    <option value="naver.com">naver.com</option>
		                    <option value="daum.com">daum.net</option>
		                    <option value="gmail.com">gmail.com</option>
		                    <option value="kakao.com">kakao.com</option>
		                    <option value="nate.com">nate.com</option>
		                    <option value="hanmail.net">hanmail.net</option>     
		                </select>
                	</div>
                </div>
                <div class="fill-content">
                	<div></div><h6>주문 및 배송확인 정보 등이 e-mail로 발송되므로 반드시 수신가능한 e-mail 주소를 입력하세요.</h6>
                </div>
    			<hr color = "#ccc;" size=1px;>
            </div>
        </div>
        <button>회원가입 완료</button>
    </div>
</div>