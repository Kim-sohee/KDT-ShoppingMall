<%@page import="shoppingmall.domain.Product"%>
<%@page import="shoppingmall.domain.Review"%>
<%@page import="shoppingmall.util.PriceFormat"%>
<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>
<%
	List<Review> reviewList = (List)request.getAttribute("reviewList");
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
				<section class="detail-content">
					<div class="detail-content-name">
						<span>상품 후기</span>
					</div>

					<!-- 기간 조회 시작 -->
					<div>
						<%@ include file="../inc/date.jsp"%>
					</div>
					<!-- 기간 조회 끝 -->

					<!-- 상품 항목 card 영역 시작 -->
					<div class="mypage-product">
					<%  
				        if(reviewList.size() == 0) {
				    %>
					    <div class="no-orders">
					        작성한 리뷰가 없습니다.
					    </div>
					<% } else { %>
													
					<!-- 상품 항목 card 영역 시작 -->
					<div class="mypage-product">
						<div class="product-item-list">
							
							<!-- for문 시작 -->
							<% for(Review review : reviewList) { %>
							<% Product product = review.getProduct(); %>
							<%	
							   String contextPath = request.getContextPath();
							   String imageUrl = "";
							   if(!product.getProductImages().isEmpty()){
								   imageUrl = contextPath+"/data/p_"+product.getProduct_id()+"/"+product.getProductImages().get(0).getFileName();
							   } 
							%>	
													
							<div class="product-item">
								<div class="item-main-header">
									<span> <%= review.getReviewed_at() %> 구매 완료 </span>
								</div>
								
								<div class="product-card">
									<div class="product-item-main">
									
										<div class="item-image">
											<img src="${imageUrl}" alt="상품 이미지">
										</div>
										
										<div class="item-info">
											<h3>
												<a href="/shop/product/detail?product_id=<%=product.getProduct_id()%>"><%=product.getProduct_name() %></a>
											</h3>
											<div class="item-brand">
												<span class="option-label">카테고리:</span> 
												<span class="option-value">
												<%=product.getTheme().getTheme_name() %>
												</span>
											</div>
											<div class="item-specs">
												<span class="option-label">인원:</span> <span class="option-value">
												<%=product.getPlayerRange().getPlayer_min() %>-<%=product.getPlayerRange().getPlayer_max() %>명
												</span>
											</div>
											<div class="item-specs">
												<span class="option-label">연령:</span> 
												<span class="option-value">
													<%=product.getAgeRange().getAge_min()%>세 이상
												</span>
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
												<span class="discount-rate"> 
												<%	if(product.getDiscount_rate() > 0 ) {%> 
												<%=	product.getDiscount_rate() %>% 
												<%	}%>
												</span> 
												<span class="original-price"><%=PriceFormat.productPriceFormat(product.getPrice()) %>원</span>
											</div>
											<div class="price-sale">
												<%	int discountedPrice = (int)(product.getPrice() * (1 - (product.getDiscount_rate() / 100.0)));%>
												<%= PriceFormat.productPriceFormat(discountedPrice) %>원
											</div>
										</div>
										
									</div>
								</div>
							</div>
							
							<% } %>
							<!-- for문 끝 -->
							
						</div>
					</div>
					<!-- 상품 항목 card 영역 끝 -->
							
					<% } %>
							
					<!-- paging 영역 시작 -->
					<% if (reviewList.size() > 0) { %>
						<div class="card-footer clearfix">
							<ul class="mypage-table-paging">
								<% if(paging.getFirstPage()-1 > 0){ %>
							<li><a class="page-link" href="#" data-page="<%=paging.getFirstPage()-1%>">&laquo;</a></li>
							<% } else { %>
							<li><a class="page-link disabled" href="#">&laquo;</a></li>
							<% } %>
						
							<% for(int i = paging.getFirstPage(); i <= paging.getLastPage(); i++) { %>
							<% if (i > paging.getTotalPage()) break; %>
							<li><a href="#" class="page-link <%=(paging.getCurrentPage() == i) ? "active" : "" %>" data-page="<%=i %>"><%=i %></a></li>
							<% } %>
						
							<% if(paging.getLastPage() < paging.getTotalPage()) { %>
							<li><a class="page-link" href="#" data-page="<%=paging.getLastPage()+1%>">&raquo;</a></li>
							<% } else { %>
							<li><a class="page-link disabled" href="#">&raquo;</a></li>
							<% } %>
							</ul>
						</div>
					<% } %>			
					<!-- paging 영역 끝 -->

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
<script>
	const pageParam = "<%= pageParam %>";
</script>
<script src="/static/mypage.js"></script>
</html>