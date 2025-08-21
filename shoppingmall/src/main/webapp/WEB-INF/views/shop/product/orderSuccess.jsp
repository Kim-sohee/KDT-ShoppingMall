<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="shoppingmall.domain.Delivery"%>
<%@page import="shoppingmall.domain.OrderDetail"%>
<%@page import="shoppingmall.domain.ProductSnapshot"%>
<%@page import="shoppingmall.domain.Member"%>
<%@page import="java.util.List"%>
<%
    List<OrderDetail> orderDetails = (List<OrderDetail>) request.getAttribute("orderDetails");
    Member member = (Member) request.getAttribute("member");

    Integer totalPriceAttr = (Integer) request.getAttribute("totalPrice");
    Integer discountAttr = (Integer) request.getAttribute("discount");
    Integer finalPriceAttr = (Integer) request.getAttribute("finalPrice");
    Integer earnedPointAttr = (Integer) request.getAttribute("earnedPoint");

    int totalPrice = totalPriceAttr != null ? totalPriceAttr : 0;
    int discount = discountAttr != null ? discountAttr : 0;
    int finalPrice = finalPriceAttr != null ? finalPriceAttr : 0;
    int earnedPoint = earnedPointAttr != null ? earnedPointAttr : 0;
    
    
    Delivery delivery = (Delivery) request.getAttribute("delivery");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>보드게임</title>
  	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="/static/shop/styles/main.css">
  	<link rel="stylesheet" href="/static/shop/styles/order_success.css">
  	<link rel="stylesheet" href="/static/shop/styles/footer.css">
</head>
<body>
<%@ include file="../../shop/inc/header.jsp"%>
<%@ include file="../../shop/inc/nav.jsp"%>
<main class="main-content">
    <div class="container">
        <div class="breadcrumb">
            <a href="index.jsp">홈</a>
            <span>></span>
            <span>주문/결제</span>
        </div>
        <div class="order-success-header">
            <h1>주문완료</h1>
            <div class="order-success-steps">
                <div class="step">
                    <span class="step-number">1</span>
                    <span class="step-text">장바구니</span>
                </div>
                <div class="step">
                    <span class="step-number">2</span>
                    <span class="step-text">주문/결제</span>
                </div>
                <div class="step active">
                    <span class="step-number">3</span>
                    <span class="step-text">주문완료</span>
                </div>
            </div>
        </div>

        <div class="order-success-layout">
            <div class="order-success-items-wrapper">
                <div class="order-success-items">
                    <div class="order-complete-msg">
                        <img src="../../img/order_success.png" alt="쇼핑백이미지"/>
                        <h2>주문이 완료되었어요</h2>
                        <p><%= orderDetails.get(0).getProductSnapshot().getProduct_name() %> 외 <%= orderDetails.size() - 1 %>개 상품이 주문되었습니다.<br>
                        회원님의 주문번호는 <%= orderDetails.get(0).getOrderSummary().getOrder_summary_id() %> 입니다.</p>
                    </div>

                    <div class="order-success-item-list">
                        <label>주문 상품</label>
                        <%
                        for (OrderDetail detail : orderDetails) {
                            ProductSnapshot snapshot = detail.getProductSnapshot();
                        %>
                        <div class="order-success-item">
                            <div class="item-image">
                                <img src="<%= (snapshot.getProductImages() != null && !snapshot.getProductImages().isEmpty()) 
						    ? "/static/uploads/" + snapshot.getProductImages().get(0).getFileName() 
						    : "/static/img/noimage.png" %>" alt="<%= snapshot.getProduct_name() %>">

                            </div>
                            <div class="item-info">
                                <h3><%= snapshot.getProduct_name() %></h3>
                                <p class="item-brand">브랜드 미지정</p>
                                <div class="item-options">
                                    <span class="option-label">옵션:</span>
                                    <span class="option-value"><%= snapshot.getTheme() != null ? snapshot.getTheme().getTheme_name() : "없음" %></span>
                                </div>
                            </div>
                            <div class="item-quantity">
                                <span class="quantity-title">개수</span>
                                <span class="quantity-value"><%= detail.getQuantity_real() %>개</span>
                            </div>
                            <div class="item-price">
                                <div class="price"><%= snapshot.getPrice() * detail.getQuantity_real() %>원</div>
                            </div>
                        </div>
                        <% } %>
                    </div>

                    <div class="order-success-delivery">
                        <label>배송지 정보</label>
                        <table class="info-table">
                            <tr><th>이름</th><td><%= member.getMember_name() %></td></tr>
                            <tr><th>휴대폰번호</th><td><%= member.getPhone() %></td></tr>
                            <tr><th>배송지 주소</th><td><%= delivery.getAddress() %></td></tr>
							<tr><th>주소 별칭</th><td><%= delivery.getAddress_alias() %></td></tr>
                        </table>
                    </div>

                    <div class="order-success-payment">
                        <label>결제 정보</label>
                        <table class="info-table">
                            <tr><th>상품 금액</th><td><%= totalPrice %> 원</td></tr>
                            <tr><th>할인 금액</th><td><%= discount %> 원</td></tr>
                            <tr><th>적립 예정 포인트</th><td><%= earnedPoint %> P</td></tr>
                            <tr><th>총 결제 금액</th><td><strong><%= finalPrice %> 원</strong></td></tr>
                        </table>
                    </div>

                    <div class="goto-home">
                        <a href="/shop/main" class="btn btn-home">홈으로</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
