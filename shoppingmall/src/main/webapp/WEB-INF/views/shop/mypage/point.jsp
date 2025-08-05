<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>
<%
	List<OrderSummary> orderSummaryList = (List)request.getAttribute("orderSummaryList");
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
				<%@include file="../inc/order-summary.jsp" %>
				<!-- 주문 요약 끝 -->		
				
				<!-- 마이페이지 상세내용 시작 -->
				<section class="detail-content">
					<div class="detail-content-name">
						<span>포인트</span>
					</div>
					
					<!-- 기간 조회 시작 -->
					<div>
						<%@ include file="../inc/date.jsp" %>
					</div>
					<!-- 기간 조회 끝 -->
					
					<%
				        int curPos = paging.getCurPos();
				        int num = paging.getNum();
				        
				        if(orderSummaryList.size() == 0) {
				    %>
					    <div class="no-orders">
					        포인트 내역이 없습니다.
					    </div>
					<% } else { %>
													
					<!-- table 영역 시작 -->
					<div class="mypage-table">
						<div class="col-12">				
							<table class="my-hover-table">
								<thead>
									<tr>
										<th>No</th>
										<th>사용/적립 일자</th>
										<th>총 결제금액</th>
										<th>사용/적립 포인트</th>
										<th>남은 포인트</th>
									</tr>
								</thead>
								<tbody>
								
									<%	for(int i=0; i<paging.getPageSize(); i++){
											if(curPos >= orderSummaryList.size()) break;
											OrderSummary orderSummary = orderSummaryList.get(curPos++);									 		
									 %>
									<tr>
										<td><span><%=num-- %></span></td>
										<td><span><%=orderSummary.getOrdered_at() %></span></td>
										<td><span><%=PriceFormat.productPriceFormat(orderSummary.getFinal_price()) %></span></td>
										<%int changedPrice = ((int)(orderSummary.getFinal_price()) / 100 - orderSummary.getPoint_used());%>
										<%if (changedPrice > 0) { %>
										<td><span><%=changedPrice %>p 적립</span></td>
										<%}else if (changedPrice < 0) { %>
										<td><span><%=Math.abs(changedPrice) %>p 차감</span></td>
										<%} else{%>
										<td><span>-</span></td>
										<%} %>
										<td><span><%=loginMember.getPoint_remained() %>p </span></td>
									</tr>
									<%} %>
									
								</tbody>
							</table>
						<%} %>
							<% if (orderSummaryList.size() > 0) { %>
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
						</div>
					</div>
					<!-- table 영역 끝 -->
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