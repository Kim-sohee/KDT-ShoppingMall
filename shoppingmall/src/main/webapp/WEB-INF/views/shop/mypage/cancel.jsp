<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../inc/init.jsp" %>
<%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
%>
<script>alert("<%= msg %>");</script>
<%
        session.removeAttribute("msg"); // 한 번만 띄우기 위해 제거
    }
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
					<div class="detail-content-name">
						<span>회원탈퇴</span>
					</div>
					
					<!-- 비밀번호 확인 시작 -->
					<% if("check-pwd".equals(activeTab)){%>
					<div class="check-pwd-container">
						<div>
							<span>개인정보를 위해 </span> <br>
							<span class="chechk-pwd-highlight">비밀번호를 다시 한 번 확인</span><span> 합니다.</span>
						</div>
						<form method="post" action="/shop/mypage/check-password">
							<input type="password" name="password" placeholder="비밀번호 입력">
							<input type="hidden" name="page" value="cancel" />
							<button class="btn-check-pwd">확인</button>
						</form>
					</div>
					<!-- 비밀번호 확인 끝 -->
						
					<!-- 회원탈퇴 안내문 시작 -->
					<% } else if("cancel-info".equals(activeTab)) { %>
					<div class="cancel-info">
							<div class="cancel-info-item">
								<span class="cancel-info-highlight">회원탈퇴 유의사항</span>
								<span>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</span>
							</div>
							<div class="cancel-info-item">
								<span>✔ 사용하고 계신 아이디(<%=loginMember.getId() %>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</span>
								<span>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</span>
								<span>부정 가입 또는 부정 이용이 의심되는 아이디는 탈퇴 후 6개월간 동일한 실명정보로 재가입 할 수 없습니다.</span>
							</div>
							<div class="cancel-info-item">
								<span>✔ 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</span>
								<span>회원정보 및 메일, 배송지, 등록계좌 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</span>
							</div>
							<div class="cancel-info-item">
								<span>✔ 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</span>
								<span>Q&A 게시글 및 후기는 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</span>
								<span>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span>
								<span>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</span>
							</div>
							<div class="cancel-final-confirm">
								<span>정말 삭제하시겠습니까?</span>
							</div>
							<form method="post" action="/shop/mypage/delete">
								<input type="hidden" name="page" value="cancel" />
								<input type="hidden" name="member_id" value=<%=loginMember.getMember_id() %> />
								<button class="btn-check-pwd">삭제</button>
							</form>
					</div>
					<!-- 회원탈퇴 안내문 끝 -->				
					
					<!-- 회원탈퇴 완료 시작 -->
					<% } else if("cancel-complete".equals(activeTab)) { %>
					<div class="check-pwd-container">
						<div>
							<span class="chechk-pwd-highlight">회원탈퇴</span><span>가 완료되었습니다.</span>
							<br>
							<span>보다 나은 보드게임으로 다시 만나뵐 수 있기를 바랍니다. </span> 
						</div>
					</div>
					<!-- 회원탈퇴 완료 끝 -->
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