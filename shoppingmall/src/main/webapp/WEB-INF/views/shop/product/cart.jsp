<%@page import="shoppingmall.domain.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Cart> cart_list = (List) request.getAttribute("cartList"); //cart 내부 내용들 불러오기
int totalPrice = (int)request.getAttribute("totalPrice");
int discount = (int)request.getAttribute("discount");
int deliveryFee = (int)request.getAttribute("deliveryFee");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보드게임</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/static/shop/styles/main.css">
<link rel="stylesheet" href="/static/shop/styles/cart.css">
<link rel="stylesheet" href="/static/shop/styles/footer.css">
</head>
<body>
	<%@ include file="../../shop/inc/header.jsp"%>
	<%@ include file="../../shop/inc/nav.jsp"%>
	<main class="main-content">
		<div class="container">
			<div class="breadcrumb">
				<a href="index.html">홈</a> <span>></span> <span>장바구니</span>
			</div>
			<!-- 장바구니 페이지 제목 시작 -->
			<div class="cart-header">
				<h1>장바구니</h1>
				<div class="cart-steps">
					<div class="step active">
						<span class="step-number">1</span> <span class="step-text">장바구니</span>
					</div>
					<div class="step">
						<span class="step-number">2</span> <span class="step-text">주문/결제</span>
					</div>
					<div class="step">
						<span class="step-number">3</span> <span class="step-text">주문완료</span>
					</div>
				</div>
			</div>
			<!-- 장바구니 페이지 제목 끝 -->

			<!-- 장바구니 컨텐츠 영역 시작 -->
			<div class="cart-layout">
				<div class="cart-items">

					<!-- 전체 선택 항목 시작 -->
					<div class="cart-controls">
						<div class="select-all">
							<label> <input type="checkbox" id="selectAll" checked>
								전체 선택
							</label>
						</div>
						<button class="btn-delete-selected">선택 삭제</button>
					</div>
					<!-- 전체 선택 항목 끝 -->

					<!-- 담겨진 상품 리스트 시작 -->
					<div class="cart-item-list">

						<%
						if (cart_list != null && !cart_list.isEmpty()) {
							for (Cart cart : cart_list) {
								String title = cart.getProduct().getProduct_name();
								int price = cart.getProduct().getPrice();
								String thumbnail = cart.getProduct().getImage(); // 예: /static/images/product123.jpg
								int quantity = cart.getQuantity();
						%>
						<div class="cart-item">
							<div class="item-select">
								<input type="checkbox" class="item-checkbox" checked>
							</div>
							<div class="item-image">
								<img src="<%=thumbnail%>" alt="<%=title%>">
							</div>
							<div class="item-info">
								<h3><%=title%></h3>
								<div class="item-options">
									<span class="option-label">수량:</span> <span
										class="option-value"><%=quantity%></span>
								</div>
							</div>
							<div class="item-quantity">
								<div class="quantity-controls">
									<button class="qty-btn minus">-</button>
									<input type="number" value="<%=quantity%>" min="1" max="99"
										class="qty-input">
									<button class="qty-btn plus">+</button>
								</div>
							</div>
							<div class="item-price">
								<div class="price-sale"><%=String.format("%,d원", price)%></div>
							</div>
							<div class="item-actions">
								<button class="btn-delete">삭제</button>
							</div>
						</div>
						<%
						} // for 끝
						} else {
						%>
						<p>장바구니에 담긴 상품이 없습니다.</p>
						<%
						}
						%>

						<!-- 계속 쇼핑하기 버튼 -->
						<div class="continue-shopping">
							<a href="./list.jsp" class="btn btn-secondary">계속 쇼핑하기</a>
						</div>
					</div>
					<!-- 담겨진 상품 리스트 끝 -->
				</div>
				<!-- 주문 요약 시작 -->
				<div class="cart-summary">
					<div class="summary-card">
						<h3>주문 요약</h3>

						<div class="summary-item">
						    <span>상품 금액</span>
						    <span><%= String.format("%,d원", totalPrice) %></span>
						</div>
						
						<div class="summary-item">
						    <span>할인 금액</span>
						    <span class="discount"><%= String.format("-%,d원", discount) %></span>
						</div>
						
						<div class="summary-item">
						    <span>배송비</span>
						    <span class="shipping-free"><%= deliveryFee == 0 ? "무료배송" : String.format("%,d원", deliveryFee) %></span>
						</div>
						
						<div class="summary-divider"></div>
						
						<div class="summary-total">
						    <span>총 결제 금액</span>
			
						    <span class="total-amount"><%= String.format("%,d원", totalPrice - discount) %></span>
						</div>
						
						<div class="summary-savings">
						    <span>총 절약 금액</span>
						    <span class="savings-amount"><%= String.format("%,d원", discount) %></span>
						</div>

						<button class="btn btn-primary btn-checkout">주문하기</button>

						<div class="payment-info">
							<h4>결제 혜택</h4>
							<ul>
								<li>카드 무이자 할부 (2-6개월)</li>
								<li>적립금 2% 적립</li>
								<li>구매 시 포인트 10% 환급</li>
							</ul>
						</div>
						<div class="delivery-info">
							<h4>배송 정보</h4>
							<div class="delivery-item">
								<span>배송 방법</span> <span>택배 배송</span>
							</div>
							<div class="delivery-item">
								<span>배송 예정일</span> <span>1-2일 (영업일 기준)</span>
							</div>
							<div class="delivery-item">
								<span>배송비</span> <span>무료배송</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 주문 요약 끝 -->
			</div>
			<!-- 장바구니 컨텐츠 영역 끝 -->
		</div>
	</main>
	<%@ include file="../inc/footer.jsp"%>
</body>
</html>