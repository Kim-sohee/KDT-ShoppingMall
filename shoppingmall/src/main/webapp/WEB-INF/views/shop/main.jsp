<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/shop/styles/footer.css">
<link rel="stylesheet" href="/static/shop/styles/footer2.css">
</head>
<style>
/* 여백 제거 */
body {
	margin: 0;
	padding: 0;
}

/* 전체 페이지 크기 설정 height: 1900px  */
#container {
	width: 100%;
	height: 1900px;
}

/* 베너 관련한 스타일 */
#banner {
	width: 100%;
	height: 400px;
	background-color: green;
}
/* 인기 카테고리 범위 */
#popular_category {
	width: 100%;
	height: 600px;
}

#popular_category_id {
	width: 100%;
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#recommend_category {
	font-size: 36px;
	font-weight: bold;
	color: red;
}

/* 카드들을 가로로 나열하고 가운데 정렬 */
.popular_card {
	display: flex;
	justify-content: center;
	gap: 30px;
	flex-wrap: wrap;
	padding: 30px 0;
}

/* 카드 하나 */
.popular_category_items {
	width: 220px;
	height: 320px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	/* 세로 정렬을 위한 설정 */
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	text-align: center;
}

/* 이미지 */

/* 타이틀 */
.popular_category_items_label {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;
}

/* 설명 */
.popular_category_items_detail {
	font-size: 14px;
	color: #555;
	margin-bottom: 10px;
}

/* 버튼 */
.popular_category_items_button {
	background-color: #e60023;
	color: white;
	border: none;
	padding: 10px 16px;
	border-radius: 8px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s;
}

.popular_category_items_button:hover {
	background-color: #cc001f;
}
.best_seller {
    width: 100%;
    padding: 40px 0;
    background-color: #f8f8f8;
}

.best_seller_title {
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    color: #b70000;
    margin-bottom: 20px;
}

.best_seller_card_wrap {
    display: flex;
    justify-content: center;
    gap: 30px;
    flex-wrap: wrap;
}

.best_seller_card {
    width: 220px;
    border: 1px solid #ddd;
    border-radius: 15px;
    padding: 15px;
    background-color: #fff;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.05);
}

.best_seller_card img {
    width: 100%;
    height: auto;
    border-radius: 8px;
}

.product_name {
    font-size: 16px;
    font-weight: bold;
    margin-top: 10px;
}

.product_price {
    font-size: 18px;
    color: red;
    margin: 5px 0;
}

.product_rating {
    font-size: 14px;
    color: #555;
}


</style>
<body>
	<!-- 메인 페이지 구현  -->

	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	<!-- navigation -->
	<%@ include file="./inc/nav.jsp"%>

	<!-- 메인 페이지 -->
	<div class="container" id="container">
		<!-- 배너 -->
		<div class="banner" id="banner">
			<img src="../img/main/banner.png">
		</div>
		<!-- 인기 카테고리 -->
		<div class="popular_category" id="popular_category">
			<!-- 인기 카테고리 추천 div의 텍스트  -->
			<div class="popular_category_label" id="popular_category_id">
				<label id="recommend_category">인기 카테고리 추천</label>
			</div>
			<div class="popular_card">
				<!-- 인기 카테고리 추천 *카드 형식으로*  -->
				<div class="popular_category_items" id="category_1">
					<img alt="전략게임" src="../img/main/strategy.png"> <label
						class="popular_category_items_label"
						id="popular_category_items_label_1"> 전략 게임 </label> <label
						class="popular_category_items_detail"
						id="popular_category_items_detail_1">한 수 앞을 내다보는 치열한 두뇌 전쟁</label>
					<button class="popular_category_items_button"
						id="popular_category_items_button_1">보러 가기</button>
				</div>
				<div class="popular_category_items" id="category_2">
					<img alt="가족게임" src="../img/main/family.png"> <label
						class="popular_category_items_label"
						id="popular_category_items_label_2"> 가족 게임 </label> <label
						class="popular_category_items_detail"
						id="popular_category_items_detail_2">남녀노소 함께 웃고 즐기는 따뜻한 시간</label>
					<button class="popular_category_items_button"
						id="popular_category_items_button_2">보러 가기</button>
				</div>
				<div class="popular_category_items" id="category_3">
					<img alt="파티게임" src="../img/main/party.png"> <label
						class="popular_category_items_label"
						id="popular_category_items_label_3"> 파티 게임 </label> <label
						class="popular_category_items_detail"
						id="popular_category_items_detail_3">모두가 웃고 떠드는 파티 필수템</label>
					<button class="popular_category_items_button"
						id="popular_category_items_button_3">보러 가기</button>
				</div>
				<div class="popular_category_items" id="category_4">
					<img alt="퍼즐게임" src="../img/main/puzzle.png"> <label
						class="popular_category_items_label"
						id="popular_category_items_label_4"> 퍼즐 게임 </label> <label
						class="popular_category_items_detail"
						id="popular_category_items_detail_4">생각할 수록 빠져드는 지적 쾌감의 재미</label>
					<button class="popular_category_items_button"
						id="popular_category_items_button_4">보러 가기</button>
				</div>
			</div>
		</div>
		<!-- 베스트 셀러 -->
		<!-- 베스트 셀러 -->
		<div class="best_seller" id="best_seller">
			<h2 class="best_seller_title">베스트 셀러</h2>
			<div class="best_seller_card_wrap">
				<!-- 카드 1 -->
				<div class="best_seller_card">
					<img src="../img/main/best1.png" alt="식스틴">
					<div class="product_name">식스틴</div>
					<div class="product_price">45,000원</div>
					<div class="product_rating">★★★★★ (271)</div>
				</div>
				<!-- 카드 2 -->
				<div class="best_seller_card">
					<img src="../img/main/best2.png" alt="코드톡">
					<div class="product_name">코드톡</div>
					<div class="product_price">24,000원</div>
					<div class="product_rating">★★★★★ (204)</div>
				</div>
				<!-- 카드 3 -->
				<div class="best_seller_card">
					<img src="../img/main/best3.png" alt="라이징5">
					<div class="product_name">라이징5</div>
					<div class="product_price">37,900원</div>
					<div class="product_rating">★★★★☆ (79)</div>
				</div>
				<!-- 카드 4 -->
				<div class="best_seller_card">
					<img src="../img/main/best4.png" alt="파일업 러시">
					<div class="product_name">파일업 러시</div>
					<div class="product_price">52,000원</div>
					<div class="product_rating">★★★☆☆ (93)</div>
				</div>
			</div>
		</div>

		<!-- 뉴스 레터 -->
		<%@ include file="./inc/footer2.jsp"%>
		<%@ include file="./inc/footer.jsp"%>
	</div>
</body>
</html>