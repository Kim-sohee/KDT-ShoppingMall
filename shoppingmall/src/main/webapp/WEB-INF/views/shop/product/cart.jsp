<%@page import="shoppingmall.domain.Member"%>
<%@page import="shoppingmall.domain.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member member = (Member) session.getAttribute("member");
	List<Cart> cart_list = (List) request.getAttribute("cartList");
	int totalPrice = request.getAttribute("totalPrice") != null ? (int) request.getAttribute("totalPrice") : 0;
	int discount = request.getAttribute("discount") != null ? (int) request.getAttribute("discount") : 0;
	int deliveryFee = request.getAttribute("deliveryFee") != null ? (int) request.getAttribute("deliveryFee") : 0;
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
<<<<<<< HEAD
		<div class="container">
			<div class="breadcrumb">
				<a href="index.html">홈</a> <span>></span> <span>장바구린</span>
			</div>

			<!-- 장바구린 페이지 제목 시작 -->
			<div class="cart-header">
				<h1>장바구린</h1>
				<div class="cart-steps">
					<div class="step active">
						<span class="step-number">1</span> <span class="step-text">장바구린</span>
					</div>
					<div class="step">
						<span class="step-number">2</span> <span class="step-text">주문/결제</span>
					</div>
					<div class="step">
						<span class="step-number">3</span> <span class="step-text">주문완료</span>
					</div>
				</div>
			</div>
			<!-- 장바구린 페이지 제목 끝 -->

			<!-- 장바구린 컨텐츠 영역 시작 -->
			<div class="cart-layout">
				<div class="cart-items">

					<!-- 전체 선택 항목 시작 -->
					<div class="cart-controls">
						<div class="select-all">
							<label> <input type="checkbox" id="selectAll" checked>
									전체 선택
							</label>
						</div>
						<button class="btn-delete-selected" id="deleteSelectedBtn">선택 삭제</button>
					</div>
					<!-- 전체 선택 항목 끝 -->

					<!-- 달가지는 상품 리스트 시작 -->
					<div class="cart-item-list">
						<% if (cart_list != null && !cart_list.isEmpty()) {
							for (Cart cart : cart_list) {
								String title = cart.getProduct().getProduct_name();
								int price = cart.getProduct().getPrice();
								String thumbnail = cart.getProduct().getImage();
								int quantity = cart.getQuantity();
						%>
						<div class="cart-item">
							<div class="item-select">
								<input type="checkbox" class="item-checkbox"  data-cart-id="<%= cart.getCart_id() %>" checked>
							</div>
							<div class="item-image">
								<img src="<%=thumbnail%>" alt="<%=title%>">
							</div>
							<div class="item-info">
								<h3><%=title%></h3>
								<div class="item-options">
									<span class="option-label">수량:</span> <span class="option-value"><%=quantity%></span>
								</div>
							</div>
							<div class="item-quantity">
								<div class="quantity-controls">
									<button class="qty-btn minus" data-cart-id="<%= cart.getCart_id() %>">-</button>
									<input type="number" value="<%=quantity%>" min="1" max="99" class="qty-input" data-cart-id="<%= cart.getCart_id() %>">
									<button class="qty-btn plus" data-cart-id="<%= cart.getCart_id() %>">+</button>
								</div>
							</div>
							<div class="item-price">
								<div class="price-sale"><%=String.format("%,d원", price)%></div>
							</div>
							<div class="item-actions">
								<button class="btn-delete" data-cart-id="<%= cart.getCart_id() %>">삭제</button>
							</div>
						</div>
						<% } } else { %>
						<div class="cart-item-empty">
							<p>장바구린에 담긴 상품이 없습니다.</p>
							<a href="/shop/product/list" class="btn btn-secondary">상품 보러가기</a>
						</div>
						<% } %>
						<div class="continue-shopping">
							<a href="/shop/product/list" class="btn btn-secondary">계속 쇼핑하기</a>
						</div>
					</div>
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
							<span>총 저약 금액</span>
							<span class="savings-amount"><%= String.format("%,d원", discount) %></span>
						</div>
						<!-- type="submit" -> type="button" 수정 -->
						<button type="button" class="btn btn-primary btn-checkout" id="bt_order">주문하기</button>
					</div>
				</div>
				<!-- 주문 요약 끝 -->
			</div>
		</div>
	</main>
	<%@ include file="../inc/footer.jsp"%>

	<script>
		document.addEventListener('DOMContentLoaded', function () {
			 const deleteButtons = document.querySelectorAll('.btn-delete');
				
			  deleteButtons.forEach(button => {
			    button.addEventListener('click', function() {
			      const cartId = this.getAttribute('data-cart-id');
			
			      if (!confirm('이 항목을 장바구니에서 삭제하시겠습니까?')) return;
			
			      fetch('/shop/cart/delete?cart_id=' + cartId, {
			        method: 'GET' // 또는 POST (더 안전함)
			      })
			      .then(response => {
			        if (response.ok) {
			          // 성공 시 새로고침 or 해당 아이템 DOM 삭제
			          location.reload(); 
			        } else {
			          alert('삭제에 실패했습니다.');
			        }
			      })
			      .catch(err => {
			        console.error(err);
			        alert('요청 중 오류 발생');
			      });
			    });
			  });
			
		  function updateQuantity(cartId, newQty) {
		    fetch('/shop/cart/update', {
		      method: 'POST',
		      headers: {
		        'Content-Type': 'application/json'
		      },
		      body: JSON.stringify({ cart_id: cartId, quantity: newQty })
		    })
		    .then(res => {
		      if (res.ok) {
		        location.reload(); // 또는 가격만 업데이트
		      } else {
		        alert('수량 변경 실패');
		      }
		    })
		    .catch(err => {
		      console.error(err);
		      alert('에러 발생');
		    });
		  }
		
		  // + 버튼
		  document.querySelectorAll('.qty-btn.plus').forEach(btn => {
		    btn.addEventListener('click', function () {
		      const cartId = this.dataset.cartId;
		      const input = this.parentElement.querySelector('.qty-input');
		      let current = parseInt(input.value);
		      if (current < 99) {
		        input.value = ++current;
		        updateQuantity(cartId, current);
		      }
		    });
		  });
		
		  // - 버튼
		  document.querySelectorAll('.qty-btn.minus').forEach(btn => {
		    btn.addEventListener('click', function () {
		      const cartId = this.dataset.cartId;
		      const input = this.parentElement.querySelector('.qty-input');
		      let current = parseInt(input.value);
		      if (current > 1) {
		        input.value = --current;
		        updateQuantity(cartId, current);
		      }
		    });
		  });
		
		  // 직접 입력
		  document.querySelectorAll('.qty-input').forEach(input => {
		    input.addEventListener('change', function () {
		      const cartId = this.dataset.cartId;
		      let current = parseInt(this.value);
		      if (current >= 1 && current <= 99) {
		        updateQuantity(cartId, current);
		      } else {
		        alert('1~99 사이의 값을 입력해주세요.');
		        this.value = 1;
		        updateQuantity(cartId, 1);
		      }
		    });
		  });
		});
		
		document.getElementById("deleteSelectedBtn").addEventListener("click", function () {
		    const checkedBoxes = document.querySelectorAll(".item-checkbox:checked");
		    const cartIds = Array.from(checkedBoxes).map(cb => cb.dataset.cartId);

		    if (cartIds.length === 0) {
		        alert("삭제할 항목을 선택해주세요.");
		        return;
		    }

		    fetch("/shop/cart/delete", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json"
		        },
		        body: JSON.stringify(cartIds)
		    })
		    .then(response => {
		        if (response.ok) {
		            location.reload();
		        } else {
		            alert("삭제에 실패했습니다.");
		        }
		    });
		});
		document.getElementById("bt_order").addEventListener("click", function () {
		    const checkedBoxes = document.querySelectorAll(".item-checkbox:checked");
		    const cartIds = Array.from(checkedBoxes).map(cb => cb.dataset.cartId);

		    if (cartIds.length === 0) {
		        alert("주문할 상품을 선택해주세요.");
		        return;
		    }

		    fetch("/shop/product/order", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json"
		        },
		        body: JSON.stringify(cartIds)
		    })
		    .then(res => res.json())
		    .then(data => {
		        if (data.url) {
		            location.href = data.url;
		        } else {
		            alert("이동할 URL이 없습니다.");
		        }
		    })
		    .catch(err => {
		        console.error(err);
		        alert("서버 통신 중 에러 발생");
		    });
		});
		</script>

</body>
</html>