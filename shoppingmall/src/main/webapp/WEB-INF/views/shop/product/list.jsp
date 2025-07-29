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
  	<link rel="stylesheet" href="/static/shop/styles/product.css">
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
                <span>전략게임</span>
            </div>

            <div class="products-header">
                <h1>전략게임</h1>
                <div class="products-count">총 <span>247</span>개의 상품</div>
            </div>

            <div class="products-layout">
            	<!-- 좌측 필터링(카테고리) 체크항목 시작  -->
                <aside class="filters-sidebar">
                    <div class="filter-section">
                        <h3>카테고리</h3>
                        <ul class="filter-list">
                            <li><label><input type="checkbox" checked> 전체</label></li>
                            
                            <!-- 여기에 for문 시작-->
                            <li><label><input type="checkbox"> 전략게임 (247)</label></li>
                            <!-- 여기에 for문 끝-->
                            
                        </ul>
                    </div>

                    <div class="filter-section">
                        <h3>플레이어 수</h3>
                        <ul class="filter-list">
                        	<!-- 여기에 for문 시작-->
                            <li><label><input type="checkbox"> 1명</label></li>
                            <!-- 여기에 for문 끝-->
                        </ul>
                    </div>

                    <div class="filter-section">
                        <h3>플레이 시간</h3>
                        <ul class="filter-list">
                        	<!-- 여기에 for문 시작-->
                            <li><label><input type="checkbox"> 30분 이하</label></li>
                            <!-- 여기에 for문 끝-->
                        </ul>
                    </div>

                    <div class="filter-section">
                        <h3>난이도</h3>
                        <ul class="filter-list">
                        	<!-- 여기에 for문 시작-->
                            <li><label><input type="checkbox"> 코스모스</label></li>
                            <!-- 여기에 for문 끝-->
                        </ul>
                    </div>
                    
                    <div class="filter-section">
                        <h3>연령대</h3>
                        <ul class="filter-list">
                        	<!-- 여기에 for문 시작-->
                            <li><label><input type="checkbox"> 3~8세</label></li>
                            <!-- 여기에 for문 끝-->
                        </ul>
                    </div>
                </aside>
				<!-- 좌측 필터링(카테고리) 체크항목 끝 -->
				
				<!-- 상품 리스트 메인 시작 -->
                <div class="products-main">
                	<!-- 상단 필터링 툴바 시작 -->
                    <div class="products-toolbar">
                        <div class="sort-options">
                            <select class="sort-select">
                                <option value="latest">최신순</option>
                                <option value="popular">인기순</option>
                                <option value="price-low">가격 낮은 순</option>
                                <option value="price-high">가격 높은 순</option>
                                <option value="rating">평점 높은 순</option>
                            </select>
                        </div>
                    </div>
                    <!-- 상단 필터링 툴바 끝 -->

					<!-- 상품 항목 카드 형식으로 보이기 시작 -->
                    <div class="products-grid" id="products-container">
                    	<!-- 상품 카드 시작 -->
                    	<!-- 여기에 for문 시작-->
                        <div class="product-card">
                            <div class="product-image">
                                <img src="images/agricola.jpg" alt="아그리콜라">
                                <div class="product-overlay">
                                    <button class="btn btn-wishlist">♡</button>
                                    <button class="btn btn-cart">장바구니</button>
                                    <button class="btn btn-detail">상세보기</button>
                                </div>
                                <!--<div class="product-badges">
                                    <span class="badge new">NEW</span>
                                </div>-->
                            </div>
                            <!-- 상품 정보 시작 -->
                            <div class="product-info">
                                <h3><a href="product-detail.html">아그리콜라</a></h3>
                                <p class="product-price">
                                    <span class="original-price">50,000원</span>
                                    <span class="sale-price">45,000원</span>
                                </p>
                                <div class="rating">
                                    <span class="stars">★★★★★</span>
                                    <span class="review-count">(127)</span>
                                </div>
                            </div>
                            <!-- 여기에 for문 끝-->
                            <!-- 상품 정보 끝 -->
                        </div>
                        <!-- 상품 카드 끝 -->
                    </div>

					
					<!-- 페이징 처리 시작 -->
                    <div class="pagination">
                        <button class="page-btn prev" disabled>이전</button>
                        <!-- 여기에 for문 시작-->
                        <button class="page-btn active">1</button>
                        <button class="page-btn">2</button>
                        <button class="page-btn">3</button>
                        <button class="page-btn">4</button>
                        <button class="page-btn">5</button>
                        <span class="page-dots">...</span>
                        <button class="page-btn">25</button>
                        <!-- 여기에 for문 끝-->
                        <button class="page-btn next">다음</button>
                    </div>
                    <!-- 페이징 처리 끝 -->
                </div>
            </div>
        </div>
    </main>
    <%@ include file="../inc/footer.jsp"%>
</body>
</html>