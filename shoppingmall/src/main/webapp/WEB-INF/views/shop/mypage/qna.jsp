<%@page import="shoppingmall.util.Paging"%>
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
						<span>문의 내역</span>
					</div>
					
					<!-- 기간 조회 시작 -->
					<div>
						<%@ include file="../inc/date.jsp" %>
					</div>
					<!-- 기간 조회 끝 -->
					
					<%
					    // 예시: 실제로는 request 속성에서 주문 리스트를 가져와서 size 확인
					    // List<Order> orderList = (List<Order>) request.getAttribute("orderList");
					    // int orderCount = (orderList != null) ? orderList.size() : 0;
					    int orderCount = 0;
					%>
					
					<% if (orderCount == 0) { %>
					    <div class="no-orders">
					        나의 문의 내역이 없습니다.
					    </div>
					<% } else { %>
								
					<!-- table 영역 시작 -->
					<div class="mypage-table">
						<div class="col-12">				
							<table class="my-hover-table">
								<thead>
									<tr>
										<th>No</th>
										<th>제목</th>
										<th>답변여부</th>
										<th>답변자</th>
									</tr>
								</thead>
								<tbody>
								
									<%for(int i=0; i<orderCount; i++){ %>
									<tr>
										<td><%="1" %></td>
										<td><%="상품 배송 중 훼손된 것 같은데, 환불 되나요?" %></td>
										<td><%="답변 대기 중" %></td>
										<td><%="-" %></td>
									</tr>
									<%} %>
									
								</tbody>
							</table>
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
</html>



