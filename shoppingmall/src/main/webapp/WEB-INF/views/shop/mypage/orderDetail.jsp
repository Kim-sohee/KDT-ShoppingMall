<%@page import="shoppingmall.util.PriceFormat"%>
<%@page import="shoppingmall.domain.ProductSnapshot"%>
<%@page import="shoppingmall.domain.OrderDetail"%>
<%@page import="shoppingmall.domain.Status"%>
<%@page import="shoppingmall.domain.OrderSummary"%>
<%@page import="java.util.List"%>
<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp"%>
<%
	OrderSummary orderSummary = (OrderSummary)request.getAttribute("orderSummary");
	List<Status> statusList = (List)request.getAttribute("statusList");
%>
<%
    if (statusList == null) {
%>
    <p>상태 목록이 없습니다.</p>
<%
    } else {
        for (int i = 0; i < statusList.size() + 1; i++) {
            // 기존 반복문 내용
        }
    }
%>
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
			<%@include file="../inc/sidebar.jsp"%>
			<!-- 마이페이지 사이드바 끝 -->

			<!-- 페이지 우측 aside 시작 -->
			<section class="aside-container">
				<!-- 주문 요약 시작 -->
				<%@include file="../inc/order-summary.jsp"%>
				<!-- 주문 요약 끝 -->

				<!-- 마이페이지 상세내용 시작 -->
				<section class="detail-content">
					<div class="detail-content-name">
						<span>배송 상세 조회</span>
					</div>
					<!-- 주문/배송 조회 시작 -->
					<div class="delivery-process">
						<% for(int i = 0; i < statusList.size()+1 ; i++) { %>
							<div class="process-card">
								<% if(i != 0) { %>
									<div>
										<%= (statusList.get(i-1).getStatus_id() == orderSummary.getStatus().getStatus_id()) ? "O" : "X" %>
									</div>
								<% } %>
								<div>
									<%= (i == 0) ? "전체" : statusList.get(i-1).getStatus_name() %>
								</div>
							</div>
						<% } %>
					</div>
					<!-- 주문/배송 조회 끝 -->

					<!-- 상품 항목 card 영역 시작 -->
					<div class="mypage-product">
						<div class="product-item-list">
						
							<%	for(OrderDetail orderDetail : orderSummary.getOrderDetailList()) { %>
							<%	ProductSnapshot product = orderDetail.getProductSnapshot(); %>
							<%	
								String contextPath = request.getContextPath();
								String imageUrl = "";
								if(!product.getProductImages().isEmpty()){
									imageUrl = contextPath+"/data/p_"+product.getProduct_snapshot_id()+"/"+product.getProductImages().get(0).getFileName();
								} 
							%>
							
							<div class="product-item">
								<div class="item-main-header">
									<span> <%= orderSummary.getOrdered_at() %> <%= orderSummary.getStatus().getStatus_name() %> </span> 
									<span><a href="/shop/product/detail">상품 보러가기></a></span>
								</div>
								
								<div class="product-card">
									<div class="product-item-main">
									
										<div class="item-image">
											<img src="${imageUrl}" alt="상품 이미지">
										</div>
										
										<div class="item-info">
											<h3>
												<a href="/shop/product/detail"><%=product.getProduct_name() %></a>
											</h3>
											<div class="item-brand">
												<span class="option-label">카테고리:</span> <span
													class="option-value"><%=product.getTheme().getTheme_name() %></span>
											</div>
											<div class="item-specs">
												<span class="option-label">인원:</span> <span
													class="option-value"><%=product.getPlayerRange().getPlayer_min() %>-<%=product.getPlayerRange().getPlayer_max() %>명</span>
											</div>
											<div class="item-specs">
												<span class="option-label">연령:</span> <span
													class="option-value"><%=product.getAgeRange().getAge_min()%>세
													이상</span>
											</div>
											<div class="item-specs">
												<span class="option-label">수량:</span> <span
													class="option-value"><%=product.getProduct_quantity()%>개</span>
											</div>
											<div class="item-options" style="display:none;">
												<span class="option-label">옵션:</span> <span
													class="option-value">기본판</span>
											</div>
										</div>
										<div class="item-price">
											<div class="price-original">
												<span class="discount-rate"> <%	if(product.getDiscount_rate() > 0 ) {%> <%=product.getDiscount_rate() %> % <%	} else{ %> - <%	} %> </span> 
												<span class="original-price"><%=PriceFormat.productPriceFormat(product.getPrice()) %>원</span>
											</div>
											<div class="price-sale">
												<%int discountedPrice = (int)(product.getPrice() * (1 - (product.getDiscount_rate() / 100.0)));%>
												<%= PriceFormat.productPriceFormat(discountedPrice) %>원
											</div>
										</div>
										
									</div>
								</div>
								
							</div>
						<%} %>
							
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



