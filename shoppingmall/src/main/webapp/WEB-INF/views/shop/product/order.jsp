<%@page import="shoppingmall.domain.Cart"%>
<%@page import="shoppingmall.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 배송관련 , 포인트 얻어오기 용 Member
	Member member = (Member)request.getAttribute("member");
	if (member == null) {
	    response.sendRedirect("/shop/member/loginform"); 
	    return;
	}

	// 장바구니에 담긴 상품 목록
	List<Cart> cart_items = (List<Cart>)request.getAttribute("orderItems");

	// 총 상품 금액 계산
	int totalPrice = 0;
	for (Cart cart : cart_items) {
	    if (cart.getProduct() != null) {
	        totalPrice += cart.getProduct().getPrice() * cart.getQuantity();
	    } else {
	        out.println("⚠️ 경고: cart_id=" + cart.getCart_id() + " 의 상품이 존재하지 않습니다.<br>");
	    }
	}

	// 할인 금액 (예시)
	int discount = 10000;

	// 배송비 (예: 5만원 이상 무료배송)
	int deliveryFee = totalPrice >= 50000 ? 0 : 3000;

	// 최종 결제 금액
	int finalAmount = totalPrice - discount  + deliveryFee;

	// 포인트 계산
	int point = member.getPoint_remained(); // 보유 포인트
	int usedPoint = 0; // 기본값은 0
	int finalAfterPoint = finalAmount - usedPoint;
	int pointAfter = point - usedPoint;

%>

<!-- HTML 시작 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>보드게임</title>
  	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="/static/shop/styles/order.css">
  	<link rel="stylesheet" href="/static/shop/styles/footer.css">
</head>
<body>
	<%@ include file="../../shop/inc/header.jsp"%>
	<%@ include file="../../shop/inc/nav.jsp"%>
	<main class="main-content">
        <div class="container">
            <div class="breadcrumb">
                <a href="index.html">홈</a> <span>></span> <span>주문/결제</span>
            </div>

            <div class="order-header">
                <h1>주문/결제</h1>
                <div class="order-steps">
                    <div class="step"><span class="step-number">1</span><span class="step-text">장바구니</span></div>
                    <div class="step active"><span class="step-number">2</span><span class="step-text">주문/결제</span></div>
                    <div class="step"><span class="step-number">3</span><span class="step-text">주문완료</span></div>
                </div>
            </div>

            <div class="order-layout">
                <div class="order-items-wrapper">
                    <div class="order-items">
                        <!-- 배송지 등록 시작 -->
                        <div class="order-delivery">
                            <label>배송지</label>
                            <div class="delivery-info">
                                <h3><%= member.getMember_name() %>님</h3>
                                <p class="delivery-info-tel"><%= member.getPhone() %></p>
                                <div class="delivery-info-adress">
                                    <span class="adress-value"><%= member.getDefault_address() %></span>
                                    <span class="adress-port">(우편번호: 입력 필요)</span>
                                </div>
                                <div class="delivery-actions">
                                    <button class="btn-delivery-adress">배송지 변경</button>
                                </div>
                            </div>
                            <select class="delivery-select">
                                <option selected>추가 요청 사항을 등록해주세요</option>
                                <option>문 앞에 놓아주세요</option>
                                <option>부재 시 경비실에 맡겨주세요</option>
                                <option>배송 전에 연락주세요</option>
                                <option>택배함에 넣어주세요</option>
                                <option>직접입력</option>
                            </select>
                        </div>
                        <!-- 배송지 등록 끝 -->
                    </div>

                    <!-- 주문 상품 리스트 시작 -->
                    <div class="order-items">
                        <div class="order-item-list">
                            <label>주문 상품</label>
                            <% for (Cart cart : cart_items) {
                                if (cart.getProduct() == null) continue;
                                String title = cart.getProduct().getProduct_name();
                                int price = cart.getProduct().getPrice();
                                String thumbnail = cart.getProduct().getImage();
                                int quantity = cart.getQuantity();
                             
                                String imageSrc = (thumbnail != null && !thumbnail.isEmpty()) ? thumbnail : "/static/img/noimage.png";
                            %>
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="<%= imageSrc %>" alt="<%= title %>">
                                </div>
                                <div class="item-info">
                                    <h3><a href="/shop/product/detail?product_id=<%= cart.getProduct().getProduct_id() %>"><%= title %></a></h3>
                                    <%-- <div class="item-options">
                                        <span class="option-label">테마:</span>
                                        <span class="option-value"><%= theme %></span>
                                    </div> --%>
                                </div>
                                <div class="item-quantity">
                                    <span class="quantity-value"><%= quantity %>개</span>
                                </div>
                                <div class="item-price">
                                    <div class="price"><%= price * quantity %>원</div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <!-- 주문 상품 리스트 끝 -->

                    <!-- 포인트 영역 시작 -->
                    <div class="order-items">
                        <div class="order-point">
                            <label>포인트</label>
                            <span class="order-all-point">현재 보유 포인트: <%= point %> pt</span>
                            <div class="order-point-input">
                                <input type="text" placeholder="사용하실 포인트를 입력하세요" id="usedPointInput">
                                <button type="button" onclick="useAllPoint()">전액사용</button>
                            </div>
                            <div class="order-point-result">
                                <div class="order-point-result-row">
                                    <span>포인트 적용 후 결제금액</span>
                                    <strong id="finalPrice"><%= finalAfterPoint %>원</strong>
                                </div>
                                <div class="order-point-result-row">
                                    <span>사용 후 예상 잔여 포인트</span>
                                    <strong id="remainPoint"><%= pointAfter %>pt</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 포인트 영역 끝 -->

                    <!-- 결제 방법 선택 영역 시작 -->
                    <div class="order-items">
                        <div class="order-payment">
                            <label>결제 방법 선택</label>
                            <div class="payment-methods">
							    <label class="payment-option"><input type="radio" name="payment" value="계좌이체" checked><span>계좌 간편결제</span></label>
							    <label class="payment-option"><input type="radio" name="payment" value="카드"><span>카드 간편결제</span></label>
							    <label class="payment-option"><input type="radio" name="payment" value="가상계좌"><span>일반결제 (가상계좌)</span></label>
							    <label class="payment-option"><input type="radio" name="payment" value="삼성페이"><span>SAMSUNG pay</span></label>
							</div>
<<<<<<< HEAD
                        </div>
                    </div>
                    <!-- 결제 방법 선택 영역 끝 -->
                </div>

                <!-- 주문 요약 시작 -->
                <div class="order-summary">
=======
							<select class="delivery-select">
								<option selected>추가 요청 사항을 등록해주세요</option>
								<option>문 앞에 놓아주세요</option>
								<option>부재 시 경비실에 맡겨주세요</option>
								<option>배송 전에 연락주세요</option>
								<option>택배함에 넣어주세요</option>
								<option>직접입력</option>
							</select>
						</div>
					</div>
					<!-- 배송지 등록 끝 -->
					
					<!-- 주문 상품 리스트 시작 -->
					<div class="order-items">
	                    <div class="order-item-list">
	                    	<label>주문 상품</label>
	                    
	                    	<!-- for문 시작 -->
	                    	<% 
	                    		for (Cart cart : cart_items) {
								String title = cart.getProduct().getProduct_name();
								int price = cart.getProduct().getPrice();
								
								String imageUrl = "";
								if(!cart.getProduct().getProductImages().isEmpty()){
									imageUrl = contextPath+"/data/p_"+cart.getProduct().getProduct_id()+"/"+cart.getProduct().getProductImages().get(0).getFileName();
								}
								String thumbnail = imageUrl;
								int quantity = cart.getQuantity(); 
							%>
	                        <div class="order-item">
	                            <!-- 상품 이미지 -->
	                            <div class="item-image">
	                                <img src="../../img/noimage.png" alt="아그리콜라">
	                            </div>
	                            <!-- 상품 정보 -->
	                            <div class="item-info">
	                                <h3><a href="product-detail.html"><%=title %>></a></h3>
	                                <!-- <p class="item-brand">에이스</p> -->
	                                <div class="item-options">
	                                    <span class="option-label">테마:</span>
	                                    <span class="option-value"><%=cart.getProduct().getTheme() %></span>
	                                </div>
	                            </div>
	                            <!-- 상품 수량 -->
	                            <div class="item-quantity">
                                    <span class="quantity-value"> <%=cart.getQuantity() %>개</span>
	                            </div>
	                            <!-- 상품 가격 -->
	                            <div class="item-price">
	                                <div class="price"><%=cart.getProduct().getPrice() %>></div>
	                            </div>
	                        </div>
							<!-- for문 끝 -->
							<%} %>
	                	</div>
	            	</div>
	            	<!-- 주문 상품 리스트 끝 -->
	            	
	            	<!-- 포인트 영역 시작 -->
	            	<div class="order-items">
	            		<div class="order-point">
	            			<label>포인트</label>
	            			<span class="order-all-point">현재 보유 포인트: 12000 pt</span>
	            			<div class="order-point-input">
	            				<input type="text" placeholder="사용하실 포인트를 입력하세요">
	            				<button type="button">전액사용</button>
	            			</div>
	            			
	            			<div class="order-point-result">
							  <div class="order-point-result-row">
							    <span>포인트 적용 후 결제금액</span>
							    <strong>57,000원</strong>
							  </div>
							  <div class="order-point-result-row">
							    <span>사용 후 예상 잔여 포인트</span>
							    <strong>10,000pt</strong>
							  </div>
							</div>
	            		</div>
	            	</div>
	            	<!-- 포인트 영역 끝 -->
	            	
	            	<!-- 결제 방법 선택 영역 시작 -->
	            	<div class="order-items">
	            		<div class="order-payment">
	            			<label>결제 방법 선택</label>
	            			<div class="payment-methods">
							    <label class="payment-option">
							      <input type="radio" name="payment" value="bank" checked>
							      <span>계좌 간편결제</span>
							    </label>
							    <label class="payment-option">
							      <input type="radio" name="payment" value="card">
							      <span>카드 간편결제</span>
							    </label>
							    <label class="payment-option">
							      <input type="radio" name="payment" value="origincard">
							      <span>일반결제</span>
							    </label>
							    <label class="payment-option">
							      <input type="radio" name="payment" value="samsungpay">
							      <span>SAMSUNG pay</span>
							    </label>
							  </div>
	            		</div>
	            	</div>
	            	<!-- 결제 방법 선택 영역 끝 -->
            	</div>
                   <!-- 주문 요약 시작 -->
                   <div class="order-summary">
>>>>>>> origin/dev
                    <div class="summary-order">
                        <h3>주문 요약</h3>
                        <div class="summary-item"><span>상품 금액</span><span><%= totalPrice %>원</span></div>
                        <div class="summary-item"><span>할인 금액</span><span class="discount">-<%= discount %>원</span></div>
                        <div class="summary-item"><span>배송비</span><span class="<%= deliveryFee == 0 ? "shipping-free" : "" %>"><%= deliveryFee == 0 ? "무료배송" : deliveryFee + "원" %></span></div>
                        <div class="summary-divider"></div>
                        <div class="summary-total"><span>총 결제 금액</span><span class="total-amount"><%= finalAmount %>원</span></div>
                        <div class="summary-savings"><span>총 절약 금액</span><span class="savings-amount"><%= discount %>원</span></div>
                        <button class="btn btn-primary btn-checkout"id = "payment-button">결제하기</button>

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
                            <div class="delivery-item"><span>배송 방법</span><span>택배 배송</span></div>
                            <div class="delivery-item"><span>배송 예정일</span><span>1-2일 (영업일 기준)</span></div>
                            <div class="delivery-item"><span>배송비</span><span><%= deliveryFee == 0 ? "무료배송" : deliveryFee + "원" %></span></div>
                        </div>
                    </div>
                </div>
                <!-- 주문 요약 끝 -->
            </div>
        </div>
    </main>
    <%@ include file="../inc/footer.jsp"%>
	<script src="https://js.tosspayments.com/v1/payment"></script>
    <!-- 포인트 계산용 JS -->
    <script>
        function useAllPoint() {
            const point = <%= point %>;
            document.getElementById('usedPointInput').value = point;
            updatePointInfo(point);
        }

        document.getElementById('usedPointInput').addEventListener('input', function () {
            const used = parseInt(this.value) || 0;
            updatePointInfo(used);
        });

        function updatePointInfo(used) {
            const point = <%= point %>;
            const finalAmount = <%= finalAmount %>;

            const remain = Math.max(point - used, 0);
            const final = Math.max(finalAmount - used, 0);

            document.getElementById('remainPoint').innerText = remain + "pt";
            document.getElementById('finalPrice').innerText = final.toLocaleString() + "원";
        }
        
        const button = document.getElementById("payment-button");

        button.addEventListener("click", function () {
          const selectedMethod = document.querySelector('input[name="payment"]:checked').value;

          const tossPayments = TossPayments("test_ck_ZLKGPx4M3M9blX0zAYEw3BaWypv1");

          tossPayments.requestPayment(selectedMethod, {
            amount: <%= finalAfterPoint %>, // 포인트 적용 후 결제금액
            orderId: "ORDER_" + new Date().getTime(), 
            orderName: "보드게임 주문 결제",
            customerName: "<%= member.getMember_name() %>",
            successUrl: window.location.origin + "/shop/product/orderSuccess",
            failUrl: window.location.origin + "/shop/product/orderFail"
          });
        });
    </script>
</body>
</html>
