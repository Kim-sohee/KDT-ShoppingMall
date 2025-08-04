<%@page import="shoppingmall.util.PriceFormat"%>
<%@page import="shoppingmall.domain.Status"%>
<%@page import="shoppingmall.domain.OrderSummary"%>
<%@page import="java.util.List"%>
<%@page import="shoppingmall.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file = "../inc/init.jsp" %>

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
	<%-- 오른쪽 메인 컨텐츠는 pageParam에 따라 분기해서 보여줌 --%>
	<main class="detail-content">
	    <%
	        if ("order".equals(pageParam)) {
	    %>
	        <jsp:include page="order.jsp" />
	    <%
	        } else if ("return".equals(pageParam)) {
	    %>
	        <jsp:include page="return.jsp" />
	    <%
	        } else if ("edit-mypage".equals(pageParam)) {
	    %>
	        <jsp:include page="editMypage.jsp" />
	    <%
	        } else if ("cancel".equals(pageParam)) {
	    %>
	        <jsp:include page="cancel.jsp" />
	    <%
	        } else if ("delivery-payment".equals(pageParam)) {
	    %>
	        <jsp:include page="delivery.jsp" />
	    <%
	        } else if ("point".equals(pageParam)) {
	    %>
	        <jsp:include page="point.jsp" />
	    <%
	        } else if ("review".equals(pageParam)) {
	    %>
	        <jsp:include page="review.jsp" />
	    <%
	        } else if ("qna".equals(pageParam)) {
	    %>
	        <jsp:include page="qna.jsp" />
	    <%
	        } else {
	    %>
	        <div>존재하지 않는 페이지입니다.</div>
	    <%
	        }
	    %>
	</main>
</body>
</html>