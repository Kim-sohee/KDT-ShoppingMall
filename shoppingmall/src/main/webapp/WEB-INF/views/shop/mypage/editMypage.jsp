<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>
<%
	Member logginedMember = (Member) session.getAttribute("member");
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
%>
<script>alert("<%= msg %>");</script>
<%
        session.removeAttribute("msg"); // 한 번만 띄우기 위해 제거
    }
%>

<body>
	<!-- header 시작 -->
	<%@ include file="../inc/header.jsp"%>
	<!-- header 끝 -->

	<!-- navigation 시작 -->
	<%@ include file="../inc/nav.jsp"%>
	<!-- navigation 끝 -->
		
	<!-- 마이페이지 본문 시작 -->
	<main class="main-content">
		<div class="mypage-header">
			<h1>마이페이지</h1>
		</div>
		<div class="container">
			<!-- 마이페이지 사이드바 시작 -->
			<%@ include file="../inc/sidebar.jsp"%>
			<!-- 마이페이지 사이드바 끝 -->
		
			<!-- 페이지 우측 aside 시작 -->
			<section class="aside-container">
				<!-- 주문 요약 시작 -->
				<%@include file="../inc/order-summary.jsp"%>
				<!-- 주문 요약 끝 -->

				<!-- 마이페이지 상세내용 시작 -->
				
				<%
				String activeTab = request.getParameter("tab");
				if (activeTab == null) activeTab = "check-pwd"; // 기본 탭은 전체				
				%>
				
				<section class="detail-content">
				<% if("check-pwd".equals(activeTab)){%>
					<!-- 회원정보 수정 안내 항목 입력 시작 -->
					<div class="detail-content-name">
						<span>회원정보 수정</span>
					</div>
					
					<div class="check-pwd-container">
						<div>
							<span>개인정보를 위해 </span> <br>
							<span class="chechk-pwd-highlight">비밀번호를 다시 한 번 확인</span><span> 합니다.</span>
						</div>
						<form method="post" action="/shop/mypage/check-password">
							<input type="password" name="password" placeholder="비밀번호 입력">
							<input type="hidden" name="page" value="edit-mypage" />
							<button class="btn-check-pwd">확인</button>
						</form>
					</div>
					<!-- 회원정보 수정 안내 항목 입력 끝 -->
				
				<% } else if("edit-detail".equals(activeTab)) { %>
				
					<div class="detail-content-name">
						<span>회원정보 수정</span>
					</div>
						
					<!-- 회원정보 수정 항목 입력 시작 -->
					<div class="edit-fill-data">
						<form method="post" action="/shop/mypage/updateInfo">
						<div class="edit-content">
							<div><span>닉네임</span></div>
							<input type="text" 			name="member_name" 	value=<%=logginedMember.getMember_name() %>	readonly style="background:#eee;">
						</div>
						<div class="edit-content">
							<div><span>아이디</span></div>
							<input type="text" 			name="id" 							value=<%=logginedMember.getId() %> 						readonly style="background:#eee;"> 
						</div>
						<div class="edit-content">
							<div><span>비밀번호</span></div>
							<input type="password" 	name="password" 			value="12345678">
							<label style="align-content: center">* 비밀번호는 8자 이상 16자 이내로 입력해주세요.</label>
						</div>
						<div class="edit-content">
							<div><span>연락처</span></div>
							<input type="text" 			name="phone" 					value=<%=logginedMember.getPhone() %>>
							<label style="align-content: center">* 000-0000-0000 형식으로 입력해 주세요.</label>
						</div>
						<div class="edit-content">
							<div><span>이메일</span></div>
							<input type="text" 			name="email" 					value=<%=logginedMember.getEmail() %> 					readonly style="background:#eee;">
						</div>
						<div class="edit-content">
							<button>수정</button>
						</div>
						</form>
					</div>
					<!-- 회원정보 수정 항목 입력 끝 -->
				<%} %>

				</section>
				<!-- 마이페이지 상세내용 끝 -->
			</section>
			<!-- 페이지 우측 aside 끝 -->

		</div>
	</main>
	<!-- 마이페이지 본문 끝 -->

	<!-- footer 시작 -->
	<%@ include file="../inc/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>