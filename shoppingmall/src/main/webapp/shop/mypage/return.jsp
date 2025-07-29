<%@page import="ShoppingMall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp"%>
<%
	Paging paging = new Paging(); 
	//productController 생기면 paging productController에서 request에 담아 넘기겠습니다.
	pageParam = "return";
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
				<section class="detail-content">
					<div class="detail-content-name">
						<span>취소 / 반품 / 교환 조회</span>
					</div>

					<!-- 기간 조회 시작 -->
					<div>
						<%@ include file="../inc/date.jsp"%>
					</div>
					<!-- 기간 조회 끝 -->

					<!-- 상품 항목 card 영역 시작 -->
					<div class="mypage-product">

						<%
						String activeTab = request.getParameter("tab");
						if (activeTab == null) activeTab = "all"; // 기본 탭은 전체
						%>

						<div class="mypage-product-header">
							<div
								class="header-item <%= "all".equals(activeTab) ? "selected" : "" %>">
								<a href="?tab=all">전체</a>
							</div>
							<div
								class="header-item <%= "cancel".equals(activeTab) ? "selected" : "" %>">
								<a href="?tab=cancel">취소/반품</a>
							</div>
							<div
								class="header-item <%= "exchange".equals(activeTab) ? "selected" : "" %>">
								<a href="?tab=exchange">교환</a>
							</div>
						</div>
						<%
						    // 예시: 실제로는 request 속성에서 주문 리스트를 가져와서 size 확인
						    // List<Order> cancelList = (List<Cancel>) request.getAttribute("orderList");
						    // int orderCount = (orderList != null) ? orderList.size() : 0;
						    int orderCount = 0;
						%>
						
						<% if (orderCount == 0) { %>
						    <div class="no-orders">
						        <% if ("cancel".equals(activeTab)) { %> 취소/반품 내역이 없습니다.
						        <% } else if ("exchange".equals(activeTab)) { %> 교환 내역이 없습니다.
						        <% } else { %> 나의 취소/반품/교환 내역이 없습니다.
						        <% } %>
						    </div>
						<% } else { %>
						
						<div class="product-item-list">
							<%for(int i = 0; i < orderCount; i++ ){ %>
							<div class="product-item">
								<div class="item-main-header">
									<span><%="2025. 8. 1." %> <%="반품" %></span> <span><a
										href="#">주문 상세보기></a></span>
								</div>
								<div class="product-card">
									<div class="product-item-main">
										<div class="item-image">
											<img src="/img/Welcome.png" alt="아그리콜라">
										</div>
										<div class="item-info">
											<!-- <h3><a href="product-detail.jsp"> 입력해주어야 함 -->
											<h3>
												<a href="#"><%="아그리콜라" %></a>
											</h3>
											<p class="item-brand"><%="에이스" %></p>
											<div class="item-specs">
												<span class="option-label">인원:</span> <span
													class="option-value"><%=2 %>-<%=4 %>명</span>
											</div>
											<div class="item-specs">
												<span class="option-label">연령:</span> <span
													class="option-value"><%=14 %>세 이상</span>
											</div>
											<div class="item-specs">
												<span class="option-label">수량:</span> <span
													class="option-value"><%=10 %>개</span>
											</div>
											<div class="item-options">
												<span class="option-label">옵션:</span> <span
													class="option-value">기본판</span>
											</div>
										</div>
										<div class="item-price">
											<div class="price-original">
												<span class="discount-rate"><%="10%" %> </span> <span
													class="original-price"><%="50,000" %>원</span>
											</div>
											<div class="price-sale"><%="145,000" %>원
											</div>
										</div>
									</div>
									<div class="item-actions">
										<button class="btn-detail">반품 상세 보기</button>
									</div>
								</div>
							</div>
							<%} %>
						</div>
						<%} %>
						<div class="card-footer clearfix">
							<ul class="mypage-table-paging">
								<li><a class="page-link" href="#">&laquo;</a></li>
								<% for(int i = paging.getFirstPage(); i <= paging.getLastPage(); i++) { %>
								<% if (i > paging.getTotalPage()) break; //총 페이지 수를 넘으면 반복문 빠져나오기 %>
								<li><a class="page-link" href="?page=<%='#' %>"><%=i %></a></li>
								<% } %>
								<li><a class="page-link" href="#">&raquo;</a></li>
							</ul>
						</div>
					</div>
					<!-- 상품 항목 card 영역 끝 -->

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



