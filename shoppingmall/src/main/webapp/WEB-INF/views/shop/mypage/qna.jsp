<%@page import="shoppingmall.domain.Qna"%>
<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>
<%
	List<Qna> qnaList = (List)request.getAttribute("qnaList");
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
						<span>문의 내역</span>
					</div>
					
					<!-- 기간 조회 시작 -->
					<div>
						<%@ include file="../inc/date.jsp" %>
					</div>
					<!-- 기간 조회 끝 -->
					
					<%
				        int curPos = paging.getCurPos();
				        int num = paging.getNum();
				        
				        if(qnaList.size() == 0) {
				    %>
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
										<th>질문내용</th>
										<th>답변여부</th>
										<th>답변자</th>
									</tr>
								</thead>
								
								<!-- for문 시작 -->
								<% for(Qna qna : qnaList) { 
								   String content = qna.getContent().toString();
								   int isCommented = qna.getIs_commented(); 
								%>
								<tbody>
									
									<tr>
										<td><%=num-- %></td>
										<td><%=qna.getTitle() %></td>
										<td><a href = "/shop/mypage/detail?page=qna&qna_id=<%=qna.getQna_id() %>">
										<% if(content.length() <= 20) { %>
											<%=content %>
										<% } else { %>
											<%=content.substring(0, 20) + "..." %>
										<% } %>
										</a></td>
										<%if(isCommented == 1){ %>
										<td>답변완료</td>
										<%} else{ %>
										<td>답변대기중</td>
										<%} %>
										<% if(qna.getComment_member() == null){ %>
										<td><%="-" %></td>
										<% } else { %>
										<td><%=qna.getComment_member() %></td>
										<% } %>
									</tr>
									
								</tbody>
								<%} %>
								<!-- for문 끝 -->
							</table>
					<%} %>
					
							<!-- paging 영역 시작 -->
							<% if (qnaList.size() > 0) { %>
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