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
  	<link rel="stylesheet" href="/static/shop/styles/order_success.css">
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
			<!-- 주문 완료 페이지 제목 시작 -->
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
			<!-- 주문 완료 페이지 제목 끝 -->
			
			<!-- 주문 완료 컨텐츠 영역 시작 -->
			<div class="order-success-layout">
				<div class="order-success-items-wrapper">
	            	<div class="order-success-items">
            			<!-- 주문 완료 안내 시작 -->
	            		<div class="order-complete-msg">
							<img src="../../img/order_success.png" alt="쇼핑백이미지"/>
							<h2>주문이 완료되었어요</h2>
							<p>UNO 외 1개 상품이 주문되었습니다. <br>
							회원님의 주문번호는 <span class="order-number">12345778989</span> 입니다.</p>
						</div>
						<!-- 주문 완료 안내 끝 -->
					
						<!-- 주문 완료 상품 리스트 시작 -->
	                    <div class="order-success-item-list">
	                    	<label>주문 상품</label>
	                    
	                    	<!-- for문 시작 -->
	                        <div class="order-success-item">
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
	                            	<span class="quantity-title">개수</span>
                                    <span class="quantity-value"> 1개</span>
	                            </div>
	                            <!-- 상품 가격 -->
	                            <div class="item-price">
	                                <div class="price">45,000원</div>
	                            </div>
	                        </div>
							<!-- for문 끝 -->
	                	</div>
	            		<!-- 주문 완료 상품 리스트 끝 -->
	            	
	            		<!-- 배송지 정보 영역 시작 -->
	            		<div class="order-success-delivery">
	            			<label>배송지 정보</label>
	            			<table class="info-table">
	            				<tr>
	            					<th>이름</th>
	            					<td>홍길동</td>
	            				</tr>
	            				<tr>
	            					<th>휴대폰번호</th>
	            					<td>010-1234-1234</td>
	            				</tr>
	            				<tr>
	            					<th>배송지 주소</th>
	            					<td>(12345) 서울특별시 강남구 삼성로 534<br>SAC아트센터 캠퍼스세븐</td>
	            				</tr>
	            			</table>
	            		</div>
	            		<!-- 배송지 정보 영역 끝 -->
	            	
	            		<!-- 결제 정보 영역 시작 -->
	            		<div class="order-success-payment">
	            			<label>결제 정보</label>
	            			<table class="info-table">
	            				<tr>
	            					<th>상품 금액</th>
	            					<td>57,000 원</td>
	            				</tr>
	            				<tr>
	            					<th>할인 금액</th>
	            					<td>2,000 원</td>
	            				</tr>
	            				<tr>
	            					<th>적립 예정 포인트</th>
	            					<td>500 P</td>
	            				</tr>
	            				<tr>
	            					<th>총 결제 금액</th>
	            					<td><strong>55,000 원</strong></td>
	            				</tr>
	            			</table>
	            		</div>
	            		<!-- 결제 방법 선택 영역 끝 -->
	            		<div class="goto-home">
	                        <a href="../index.jsp" class="btn btn-home">홈으로</a>
	                    </div>
	            	</div>
            	</div>
        	</div>
        	<!-- 주문 완료 페이지 영역 끝 -->
        </div>
    </main>
    <%@ include file="../inc/footer.jsp"%>
</body>
</html>