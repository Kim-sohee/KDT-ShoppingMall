<%@page import="shoppingmall.util.PriceFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>

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
				            주문 / 배송 내역이 없습니다.
				        </div>
				    <%
				        } else {
				    %>
				    
					<!-- table 영역 시작 -->
					<div class="mypage-table">
						<div class="col-12">				
							<table class="my-hover-table">
								<thead>
									<tr>
										<th>No</th>
										<th>주문일자</th>
										<th>전체금액</th>
										<th>결제금액</th>
										<th>사용포인트</th>
										<th>결제수단</th>
										<th>결제상세</th>
									</tr>
								</thead>
								<tbody>
								
									<%	for(int i=0; i<paging.getPageSize(); i++){
											if(curPos >= orderSummaryList.size()) break;
											OrderSummary orderSummary = orderSummaryList.get(curPos++);									 		
									 %>
									 
									<tr>
										<td><%=num-- %></td>
										<td><%=orderSummary.getOrdered_at() %></td>
										<td><%=PriceFormat.productPriceFormat(orderSummary.getTotal_price()) %></td>
										<td><%=PriceFormat.productPriceFormat(orderSummary.getFinal_price()) %></td>
										<td><%=orderSummary.getPoint_used() %></td>
										<td><%=orderSummary.getPayment_type() %></td>
										<td>
											<button style="border:0; border-radius: 0.5rem; background-color: #D70C19; color:white;">
												<a 
													href="/shop/mypage/order/detail?page=order&order_summary_id=<%= orderSummary.getOrder_summary_id()%>&status_type=delivery"
													class="detail-link"
												>
												상세보기
												</a>
											</button>
										</td>
									</tr>
									<%} %>
									
								</tbody>
							</table>
							<div class="card-footer clearfix">
								<ul class="mypage-table-paging">
									<%	if(paging.getFirstPage()-1 > 0){ %>
									<li><a class="page-link" href="#" data-page="<%=paging.getFirstPage()-1%>">&laquo;</a></li>
									<%	} else { %>
									<li><a class="page-link disabled" href="#">&laquo;</a></li>
									<%	} %>
									
									<% for(int i = paging.getFirstPage(); i <= paging.getLastPage(); i++) { %>
									<% if (i > paging.getTotalPage()) break; //총 페이지 수를 넘으면 반복문 빠져나오기 %>
									<li><a href=# class="page-link <%=(paging.getCurrentPage() == i) ? "active" : "" %>" data-page="<%=i %>"><%=i %></a></li>
									<% } %>
									
									<% if(paging.getLastPage() < paging.getTotalPage()) {%>
									<li><a class="page-link" href="#" data-page="<%=paging.getLastPage()+1%>">&raquo;</a></li>
									<%	} else { %>
									<li><a class="page-link disabled" href="#">&raquo;</a></li>
									<%	} %>
									
								</ul>
							</div>
						</div>
					</div>
					<% } %>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function applyDateFilter() {
	    const start = document.querySelector('input[name="start_date"]').value;
	    const end = document.querySelector('input[name="end_date"]').value;
	
	    const params = new URLSearchParams(window.location.search);
	    params.set("start_date", start);
	    params.set("end_date", end);
	    params.set("page", "<%= pageParam %>"); // 원래 페이지 유지
	
	 	// form 기본 제출 막기
	    const form = document.getElementById("date_form");
	    if (form) {
	      form.onsubmit = (e) => e.preventDefault();
	    }

	    // 주소로 이동
	    location.href = "/shop/mypage/order/list?" + params.toString();
	  }
  
	// 버튼 클릭시 폼 제출
    document.querySelector('#date_form button').addEventListener('click', (e) => {
	  e.preventDefault(); // 버튼의 submit 막기
	  applyDateFilter();
	});
</script>
</html>