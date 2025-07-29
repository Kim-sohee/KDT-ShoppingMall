<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>보드게임</title>
  	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="/static/shop/styles/main.css">
  	<link rel="stylesheet" href="/static/shop/styles/order.css">
  	<link rel="stylesheet" href="/static/shop/styles/footer.css">
</head>
<body>
	<%@ include file="../../shop/inc/header.jsp"%>
	<%@ include file="../../shop/inc/nav.jsp"%>
	<main class="main-content">
        <div class="container">
            <div class="breadcrumb">
                <a href="index.html">홈</a>
                <span>></span>
                <span>주문/결제</span>
            </div>
			<!-- 주문 및 결제 페이지 제목 시작 -->
            <div class="order-header">
                <h1>주문/결제</h1>
                <div class="order-steps">
                    <div class="step">
                        <span class="step-number">1</span>
                        <span class="step-text">장바구니</span>
                    </div>
                    <div class="step active">
                        <span class="step-number">2</span>
                        <span class="step-text">주문/결제</span>
                    </div>
                    <div class="step">
                        <span class="step-number">3</span>
                        <span class="step-text">주문완료</span>
                    </div>
                </div>
            </div>
			<!-- 주문 및 결제 페이지 제목 끝 -->
			
			<!-- 주문 및 결제 컨텐츠 영역 시작 -->
			<div class="order-layout">
				<div class="order-items-wrapper">
	            	<div class="order-items">
	            		<!-- 배송지 등록 시작 -->
						<div class="order-delivery">
							<label>배송지</label>
							<div class="delivery-info">
								<h3>홍길동 님</h3>
                                <p class="delivery-info-tel">010-1234-1234</p>
                                <div class="delivery-info-adress">
                                    <span class="adress-value">서울 강남구 삼성로 534 SAC아트홀 6층(삼성동)</span>
                                    <span class="adress-port">(우편번호: 12345)</span>
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
					</div>
					<!-- 배송지 등록 끝 -->
					
					<!-- 주문 상품 리스트 시작 -->
					<div class="order-items">
	                    <div class="order-item-list">
	                    	<label>주문 상품</label>
	                    
	                    	<!-- for문 시작 -->
	                        <div class="order-item">
	                            <!-- 상품 이미지 -->
	                            <div class="item-image">
	                                <img src="../../img/noimage.png" alt="아그리콜라">
	                            </div>
	                            <!-- 상품 정보 -->
	                            <div class="item-info">
	                                <h3><a href="product-detail.html">아그리콜라</a></h3>
	                                <p class="item-brand">에이스</p>
	                                <div class="item-options">
	                                    <span class="option-label">옵션:</span>
	                                    <span class="option-value">기본판</span>
	                                </div>
	                            </div>
	                            <!-- 상품 수량 -->
	                            <div class="item-quantity">
                                    <span class="quantity-value"> 1개</span>
	                            </div>
	                            <!-- 상품 가격 -->
	                            <div class="item-price">
	                                <div class="price">45,000원</div>
	                            </div>
	                        </div>
							<!-- for문 끝 -->
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
                    <div class="summary-order">
                        <h3>주문 요약</h3>
                        
                        <div class="summary-item">
                            <span>상품 금액</span>
                            <span>157,000원</span>
                        </div>
                        
                        <div class="summary-item">
                            <span>할인 금액</span>
                            <span class="discount">-10,000원</span>
                        </div>
                        
                        <div class="summary-item">
                            <span>배송비</span>
                            <span class="shipping-free">무료배송</span>
                        </div>
                        
                        <div class="summary-divider"></div>
                        
                        <div class="summary-total">
                            <span>총 결제 금액</span>
                            <span class="total-amount">147,000원</span>
                        </div>
                        
                        <div class="summary-savings">
                            <span>총 절약 금액</span>
                            <span class="savings-amount">10,000원</span>
                        </div>
                        
                        <button class="btn btn-primary btn-checkout">결제하기</button>
                        
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
	                            <span>배송 방법</span>
	                            <span>택배 배송</span>
	                        </div>
	                        <div class="delivery-item">
	                            <span>배송 예정일</span>
	                            <span>1-2일 (영업일 기준)</span>
	                        </div>
	                        <div class="delivery-item">
	                            <span>배송비</span>
	                            <span>무료배송</span>
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