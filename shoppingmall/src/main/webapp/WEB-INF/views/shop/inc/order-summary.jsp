<%@page import="shoppingmall.util.PriceFormat"%>
<%@page import="shoppingmall.domain.Member"%>
<%@page import="shoppingmall.domain.OrderSummary"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	Member loginnedMember = (Member) request.getAttribute("member");

	List<OrderSummary> DefaultOrderSummaryList = (List)request.getAttribute("defaultOrderSummaryList");
	
	int orderCount = (DefaultOrderSummaryList != null) ? DefaultOrderSummaryList.size() : 0;
	int myTotalPrice = 0;
	if (DefaultOrderSummaryList != null) {
		for (OrderSummary DefaultOrderSummary : DefaultOrderSummaryList) {
			myTotalPrice += DefaultOrderSummary.getFinal_price();
		}
	}
%>
<section class="order-summary">
	<div class="summary-container">
		<div class="order-summary-item">
			<div>
				<span>주문건수</span><span><%=orderCount %>회</span>
			</div>
			<div>
				<span>구매누적 금액</span><span><%=PriceFormat.productPriceFormat(myTotalPrice)%>원</span>
			</div>
		</div>
		<div class="order-summary-item">
			<div>
				<span>나의 포인트</span> 
				<span><%= (loginnedMember != null) ? loginnedMember.getPoint_remained() : 0 %>p</span>
			</div>
		</div>
	</div>
</section>