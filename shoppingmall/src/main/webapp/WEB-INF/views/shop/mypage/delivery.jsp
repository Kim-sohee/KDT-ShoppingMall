<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../inc/init.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보드게임</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap">
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
				<section class="detail-content">
					<div class="detail-content-name">
						<span>배송지 / 환불계좌 관리</span>
					</div>


					<!-- 배송지 항목 card 영역 시작 -->
					<%
					String activeTab = request.getParameter("tab");
					if (activeTab == null)
						activeTab = "delivery"; // 기본 탭은 전체
					%>

					<div class="mypage-product-header">
						<div
							class="header-item <%="delivery".equals(activeTab) ? "selected" : ""%>">
							<a href="?tab=delivery">배송지</a>
						</div>
						<div
							class="header-item <%="return_account".equals(activeTab) ? "selected" : ""%>">
							<a href="?tab=return_account">환불계좌</a>
						</div>
					</div>
					<%if ("delivery".equals(activeTab)) { %>
					<%
					// 예시: 실제로는 request 속성에서 주문 리스트를 가져와서 size 확인
					// List<Order> orderList = (List<Order>) request.getAttribute("orderList");
					// int orderCount = (orderList != null) ? orderList.size() : 0;
					int orderCount = 3;
					%>

					<%if (orderCount == 0) { %>
					<div class="no-orders">등록된 배송지가 없습니다.</div>
					<%} else { %>
					<div class="mypage-delivery">
						<div class="delivery-item-list">
							<%for (int i = 0; i < orderCount; i++) { %>
							<div class="delivery-item">
								<div class="delivery-item-header">
									<span><%="우리집"%></span>
									<button class="btn-select">선택</button>
								</div>
								<div class="delivery-card">
									<div class="delivery-item-main">
										<div class="delivery-item-option">
											<span class="option-label">연락처</span> <span
												class="option-value"><%="010-1234-5678"%></span>
										</div>
										<div class="delivery-item-option">
											<span class="option-label">배송지 주소</span> <span
												class="option-value"><%="서울 강남구 삼성로 534 SAC아트홀 6층"%></span>
										</div>
										<div class="delivery-item-option">
											<span class="option-label">배송 메모</span> <select
												name="deliveryMemo" class="delivery-memo-select">
												<option value="">배송 메모를 선택해주세요</option>
												<option value="문 앞에 놓아주세요">문 앞에 놓아주세요</option>
												<option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
												<option value="전화 주세요">전화 주세요</option>
												<option value="부재 시 택배함에">부재 시 택배함에 넣어주세요</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<%} %>
						</div>
					</div>
					<%} %>
					<%} else { %>
					<!-- 배송지 항목 card 영역 끝 -->

					<!-- 환불계좌 항목 card 영역 시작 -->
					<%
					// 예시: 실제로는 request 속성에서 주문 리스트를 가져와서 size 확인
					// List<Order> orderList = (List<Order>) request.getAttribute("orderList");
					// int orderCount = (orderList != null) ? orderList.size() : 0;
					int orderCount = 0;
					%>

					<% if (orderCount == 0) { %>
					<div class="no-orders">등록된 계좌가 없습니다.</div>
					<%} else { %>
					<div class="mypage-delivery">
						<div class="delivery-item-list">
							<% for (int i = 0; i < orderCount; i++) { %>
							<div class="delivery-item">
								<div class="delivery-item-header">
									<span><%="NH채움카드"%></span>
									<button class="btn-select">선택</button>
								</div>
								<div class="delivery-card">
									<div class="delivery-item-main">
										<div class="delivery-item-option">
											<span class="option-label">카드사</span> <span
												class="option-value"><%="NH농협카드"%></span>
										</div>
										<div class="delivery-item-option">
											<span class="option-label">카드번호</span> <span
												class="option-value"><%="2545-****-****-1531"%></span>
										</div>
									</div>
								</div>
							</div>
							<%} %>
						</div>
					</div>
					<%} %>
					<!-- 환불계좌 항목 card 영역 끝 -->
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

<script type="text/javascript">
	const memoSelect = document.querySelector('.delivery-memo-select');
	memoSelect.addEventListener('change', function() {
		console.log("선택한 메모:", this.value);
	});
</script>

</html>



