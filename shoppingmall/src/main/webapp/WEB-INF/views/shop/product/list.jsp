<%@page import="java.util.Map"%>
<%@page import="org.apache.jasper.runtime.PageContextImpl"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="shoppingmall.domain.AgeRange"%>
<%@page import="shoppingmall.domain.Difficulty"%>
<%@page import="shoppingmall.domain.PlayerRange"%>
<%@page import="shoppingmall.domain.Theme"%>
<%@page import="shoppingmall.util.Paging"%>
<%@page import="shoppingmall.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="shoppingmall.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//상품의 필터를 걸 카테고리 항목 가져오기
	//List<Theme> themeList = (List)request.getAttribute("themeList");	//게임종류
	List<PlayerRange> playerRangeList = (List)request.getAttribute("playerRangeList");	//인원수
	List<Difficulty> difficultyList = (List)request.getAttribute("difficultyList");		//난이도
	List<AgeRange> ageRangeList = (List)request.getAttribute("ageRangeList");		//연령대
	
	//상품 리스트 모두 가져오기
	List<Product> productList = (List)request.getAttribute("productList"); 
	Paging paging = (Paging)request.getAttribute("paging");	//페이징처리
	
	//상품에 대한 별점과 리뷰수 가져오기
	Map<Integer, Double> avgRatingMap = (Map<Integer, Double>) request.getAttribute("avgRatingMap");
	Map<Integer, Integer> reviewCountMap = (Map<Integer, Integer>) request.getAttribute("reviewCountMap");

%>
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
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../../shop/inc/header.jsp"%>
	<%@ include file="../../shop/inc/nav.jsp"%>
	<main class="main-content">
        <div class="container">
            <div class="breadcrumb">
                <a href="/shop/main">홈</a>
                <span>></span>
                <span>상품리스트</span>
            </div>

            <div class="products-header">
                <h1>보드게임 리스트</h1>
                <div class="products-count">총 <span><%=productList.size() %></span>개의 상품</div>
            </div>

            <div class="products-layout">
            	<!-- 좌측 필터링(카테고리) 체크항목 시작  -->
                <aside class="filters-sidebar">
                    <div class="filter-section">
                        <h3>카테고리</h3>
                        <ul class="filter-list">
                            <li><label><input type="checkbox" name="themeCheck" value="" onclick="checkOnlyOne(this, 'themeCheck', 'theme')" checked> 전체</label></li>
                            
                            <!-- 여기에 for문 시작-->
                            <% for(int i=0; i<themeList.size(); i++){ %>
                            <% Theme theme = themeList.get(i); %>
                            <li><label><input type="checkbox" name="themeCheck" value="<%=theme.getTheme_id() %>"  onclick="checkOnlyOne(this, 'themeCheck', 'theme.theme_id')"><%=theme.getTheme_name() %></label></li>
                            <% } %>
                            <!-- 여기에 for문 끝-->
                            
                        </ul>
                    </div>

                    <div class="filter-section">
                        <h3>플레이어 수</h3>
                        <ul class="filter-list">
                        	<li><label><input type="checkbox" name="playerRangeCheck" value="" onclick="checkOnlyOne(this, 'playerRangeCheck', '')" checked> 전체</label></li>
                        	<!-- 여기에 for문 시작-->
                        	<% for(int i=0; i<playerRangeList.size(); i++){ %>
							<% PlayerRange range = playerRangeList.get(i);%>
							<li><label><input type="checkbox" name="playerRangeCheck" id="player<%=i%>" value="<%=range.getPlayer_range_id() %>"  onclick="checkOnlyOne(this, 'playerRangeCheck', 'playerRange.player_range_id')"><%= range.getPlayer_min() %> ~ <%= range.getPlayer_max() %> 명</label></li>
							<% } %>
                            <!-- 여기에 for문 끝-->
                        </ul>
                    </div>

                    <div class="filter-section">
                        <h3>난이도</h3>
                        <ul class="filter-list">
                        	<li><label><input type="checkbox" name="difficultyCheck" value="" onclick="checkOnlyOne(this, 'difficultyCheck', '')" checked> 전체</label></li>
                        	<!-- 여기에 for문 시작-->
                        	<% for(int i=0; i<difficultyList.size(); i++){ %>
                        	<% Difficulty difficulty = difficultyList.get(i); %>
                            <li><label><input type="checkbox" name="difficultyCheck" value="<%=difficulty.getDifficulty_id() %>" onclick="checkOnlyOne(this, 'difficultyCheck', 'difficulty.difficulty_id')"> <%=difficulty.getGame_level() %></label></li>
                            <% } %>
                            <!-- 여기에 for문 끝-->
                        </ul>
                    </div>
                    
                    <div class="filter-section">
                        <h3>연령대</h3>
                        <ul class="filter-list">
                        	<li><label><input type="checkbox" name="ageRangeCheck" value="" onclick="checkOnlyOne(this, 'ageRangeCheck', '')" checked> 전체</label></li>
                        	<!-- 여기에 for문 시작-->
                        	<% for(int i=0; i<ageRangeList.size(); i++){ %>
                        	<% AgeRange ageRange = ageRangeList.get(i); %>
                            <li><label><input type="checkbox" name="ageRangeCheck" value="<%=ageRange.getAge_range_id() %>" onclick="checkOnlyOne(this, 'ageRangeCheck', 'ageRange.age_range_id')"> <%=ageRange.getAge_min() %>세 이상</label></li>
                            <% } %>
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
                    
					<!-- 상품 출력 영역 시작 -->	
					<div class="products-grid" id="products-container">
						<!-- 상품 카드 영역 -->
						<% int curPos = paging.getCurPos();
						   int num = paging.getNum(); %>
						
						<% for(int i=0; i<paging.getPageSize(); i++){
						     if (curPos >= productList.size()) break;
						     Product product = productList.get(curPos++);
						     
						     //별점을 위한 처리
						     int productId = product.getProduct_id();
							 double avgRating = avgRatingMap.containsKey(productId) ? avgRatingMap.get(productId) : 0.0;
							 int reviewCount = reviewCountMap.containsKey(productId) ? reviewCountMap.get(productId) : 0;
							 int stars = (int)Math.round(avgRating);

						%>
						<div class="product-card">
						  <div class="product-image">
						    <img src="<%=product.getImage()%>" alt="상품이미지">
						    <div class="product-overlay">
						      <button class="btn btn-wishlist">♡</button>
						      <button class="btn btn-cart">장바구니</button>
						      <button class="btn btn-detail" data-id="<%=productId%>">상세보기</button>
						    </div>
						    <!--<div class="product-badges">
	                                  <span class="badge new">NEW</span>
	                              </div>-->
						  </div>
						  <div class="product-info">
						    <h3><a href="/shop/product/detail?product_id=<%=productId%>"><%=product.getProduct_name()%></a></h3>
						    <p class="product-price">
						      <span class="original-price"><%=PriceFormat.productPriceFormat(product.getPrice())%></span>
						      <span class="sale-price"><%=PriceFormat.productPriceFormat(product.getSalePrice())%>원</span>
						    </p>
						    <div class="rating"><span class="stars" id="critic">
						    	<% for (int s = 0; s < stars; s++) { %>★<% } %>
    							<% for (int s = stars; s < 5; s++) { %>☆<% } %>
						    </span><span class="review-count">(<%=reviewCount %>)</span></div>
						  </div>
						</div>
						<% } %>
					</div>
					
					<!-- 페이징 영역 -->
					<div class="pagination">
					  <% if(paging.getFirstPage()-1 > 0){ %>
					    <a href="#" class="page-btn prev" data-page="<%=paging.getFirstPage()-1%>">이전</a>
					  <% } else { %>
					    <a href="#" class="page-btn prev disabled">이전</a>
					  <% } %>
					
					  <% for(int i=paging.getFirstPage(); i<=paging.getLastPage(); i++){
					       if(i > paging.getTotalPage()) break;
					  %>
					    <a href="#" class="page-btn <%=paging.getCurrentPage() == i ? "active" : "" %>" data-page="<%=i%>"><%=i%></a>
					  <% } %>
					
					  <% if(paging.getLastPage() < paging.getTotalPage()) { %>
					    <a href="#" class="page-btn next" data-page="<%=paging.getLastPage()+1%>">다음</a>
					  <% } else { %>
					    <a href="#" class="page-btn next disabled">다음</a>
					  <% } %>
					</div>

					<!-- 상품 출력 영역 끝 -->
                </div>
            </div>
        </div>
    </main>
    <%@ include file="../inc/footer.jsp"%>
    <script type="text/javascript">
    function checkOnlyOne(element, groupName, paramName) {
        // 같은 그룹 내 체크박스만 초기화
        const checkboxes = document.getElementsByName(groupName);
        checkboxes.forEach((cb) => {
            cb.checked = false;
        });
        element.checked = true;

        // 모든 필터 파라미터 수집
        const allFilterParams = {};

        // 필터링할 그룹들
        const filterGroups = [
            { name: 'themeCheck', paramName: 'theme.theme_id' },
            { name: 'playerRangeCheck', paramName: 'playerRange.player_range_id' },
            { name: 'difficultyCheck', paramName: 'difficulty.difficulty_id' },
            { name: 'ageRangeCheck', paramName: 'ageRange.age_range_id' }
        ];

        filterGroups.forEach(group => {
            const groupCheckboxes = document.getElementsByName(group.name);
            groupCheckboxes.forEach(cb => {
                if (cb.checked && cb.value != '') {
                    allFilterParams[group.paramName] = cb.value;
                }
            });
        });

        // 페이징 초기화
        allFilterParams["currentPage"] = 1;

        //비동기 처리
        $.ajax({
            type: 'GET',
            url: '/shop/product/list',
            data: allFilterParams,
            success: function (result, state, xhr) {
                $('#products-container').html($(result).find('#products-container').html());
                $('.pagination').html($(result).find('.pagination').html());
                var productCount = $(result).find('.products-count span').text();
                $('.products-count span').text(productCount);
            },
            error: function (xhr, status, error) {
                console.error('필터링 실패:', error);
            }
        });
    }

    $(document).ready(function () {
        $(".btn.btn-detail").on("click", function () {
            const productId = $(this).data("id");
            window.location.href = "/shop/product/detail?product_id=" + productId;
        });
    });
    </script>
</body>
</html>