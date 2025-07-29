<%@page import="ShoppingMall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>
<%
	Paging paging = new Paging(); 
	//productController 생기면 paging productController에서 request에 담아 넘기겠습니다.
	pageParam = "edit-mypage";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보드게임</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap">
<link rel="stylesheet" href="/static/shop/styles/mypage.css">
<link rel="stylesheet" href="/static/shop/styles/footer.css">
<link rel="stylesheet" href="/static/shop/styles/date.css">
</head>
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
						<input type="text" placeholder="비밀번호 입력">
						<button class="btn-check-pwd" onclick="location.href='?tab=edit-detail'">확인</button>
					</div>
					<!-- 회원정보 수정 안내 항목 입력 끝 -->
				
				<% } else if("edit-detail".equals(activeTab)) { %>
				
					<div class="detail-content-name">
						<span>회원정보 수정</span>
					</div>
						
					<!-- 회원정보 수정 항목 입력 시작 -->
					<div class="edit-fill-data">
						<div class="edit-content">
							<div><span>아이디</span></div>
							<div><%="sinse01" %></div>
						</div>
						<div class="edit-content">
							<div><span>비밀번호</span></div>
							<input type="password" value="12345678">
							<button>변경</button>
						</div>
						<div class="edit-content">
							<div><span>닉네임</span></div>
							<input type="text" value=<%="sinse01" %>>
						</div>
						<div class="edit-content">
							<div><span>연락처</span></div>
							<input type="text" value="010-1234-5678">
						</div>
						<div class="edit-content">
							<div><span>이메일</span></div>
							<div><%="sinse01@gmail.com" %></div>
						</div>
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



