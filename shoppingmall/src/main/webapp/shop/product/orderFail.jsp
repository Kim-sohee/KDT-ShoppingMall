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
  	<link rel="stylesheet" href="/static/shop/styles/order_fail.css">
  	<link rel="stylesheet" href="/static/shop/styles/footer.css">
</head>
<body>
	<%@ include file="../../secure/inc/header.jsp"%>
	<%@ include file="../../secure/inc/nav.jsp"%>
	<main class="main-content">
        <div class="container">
            <div class="breadcrumb">
                <a href="index.html">홈</a>
                <span>></span>
                <span>주문/결제</span>
            </div>
			<!-- 주문 실패 페이지 제목 시작 -->
            <div class="order-fail-header">
                <h1>주문실패</h1>
                <div class="order-fail-steps">
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
			<!-- 주문 실패 페이지 제목 끝 -->
			
			<!-- 주문 실패 컨텐츠 영역 시작 -->
			<div class="order-fail-layout">
				<div class="order-fail-items-wrapper">
	            	<div class="order-fail-items">
            			<!-- 주문 실패 안내 시작 -->
	            		<div class="order-fail-msg">
							<img src="../../img/order_fail.png" alt="경고이미지"/>
							<h2>주문이 정상적으로 완료되지 않았습니다.</h2>
							<p>이용에 불편을 드려 죄송합니다.</p>
						</div>
						<!-- 주문 실패 안내 끝 -->
					
						<!-- 주문 실패 디테일 안내 시작 -->
	                    <div class="order-fail-detail-msg">
	                    	<label>오류 번호: 500</label>
	                    	<p>재시도를 하신 후에도 계속해서 같은 오류가 발생한다면,<br>
	                    	고객센터(02-1234-1234)로 문의하여 주시기 바랍니다.</p>
	                	</div>
	            		<!-- 주문 완료 상품 리스트 끝 -->
	            		
	            		<!-- 버튼 시작 -->
	            		<div class="goto-cart">
	            			<a href="./cart.jsp" class="btn btn-cart">장바구니로 이동</a>
	            		</div>
	            		<div class="goto-home">
	                        <a href="../index.jsp" class="btn btn-home">홈으로</a>
	                    </div>
	                    <!-- 버튼 끝 -->
	            	</div>
            	</div>
        	</div>
        	<!-- 주문 완료 페이지 영역 끝 -->
        </div>
    </main>
    <%@ include file="../inc/footer.jsp"%>
</body>
</html>