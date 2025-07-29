<%@page import="ShoppingMall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>
<%
	Paging paging = new Paging(); 
	//productController 생기면 paging productController에서 request에 담아 넘기겠습니다.
	pageParam = "order";
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
			<%@include file="../inc/sidebar.jsp" %>
			<!-- 마이페이지 사이드바 끝 -->
			
			<!-- 페이지 우측 aside 시작 -->
			<section class="aside-container">
				<!-- 주문 요약 시작 -->		
				<%@include file="../inc/order-summary.jsp" %>
				<!-- 주문 요약 끝 -->
				
				<!-- 마이페이지 상세내용 시작 -->
				<section class="detail-content">
					<div class="detail-content-name">
						<span>주문 / 배송 조회</span>
					</div>
					<!-- 주문/배송 조회 시작 -->
					<div class="delivery-process">
						<%for(int i=0; i<6; i++){ %>
						<div class="process-card">
							<% if (i != 0) { %>
							<div><%= (i == 2) ? "O" : "X" %></div>
							<%} %>
							<div><%="전체"%></div>
						</div>
						<%}; %>
					</div>
					<!-- 주문/배송 조회 끝 -->
					
					<!-- 기간 조회 시작 -->
					<div>
						<%@ include file="../inc/date.jsp" %>
					</div>
					<!-- 기간 조회 끝 -->
					
					<!-- 상품 항목 card 영역 시작 -->
					<div class="mypage-product">
					<%
				        int itemCount = 0; // 예시: 실제로는 List의 size()로 대체
				        if(itemCount == 0) {
				    %>
				        <div class="no-orders">
				            주문 / 배송 내역이 없습니다.
				        </div>
				    <%
				        } else {
				    %>
						<div class="product-item-list">
							<%for(int i = 0; i < itemCount; i++ ){ %>
							<div class="product-item">
								<div class="item-main-header">
									<span><%="2025. 8. 1." %> <%="주문" %></span> 
									<span><a href="#">주문 상세보기></a></span>
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
												<span class="option-label">인원:</span> 
												<span class="option-value"><%=2 %>-<%=4 %>명</span>
											</div>
											<div class="item-specs">
												<span class="option-label">연령:</span> 
												<span class="option-value"><%=14 %>세 이상</span>
											</div>
											<div class="item-specs">
												<span class="option-label">수량:</span> 
												<span class="option-value"><%=10 %>개</span>
											</div>
											<div class="item-options">
												<span class="option-label">옵션:</span> 
												<span class="option-value">기본판</span>
											</div>
										</div>
										<div class="item-price">
											<div class="price-original">
												<span class="discount-rate"><%="10%" %> </span> 
												<span class="original-price"><%="50,000" %>원</span>
											</div>
											<div class="price-sale"><%="145,000" %>원</div>
										</div>
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
								<%} %>
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



