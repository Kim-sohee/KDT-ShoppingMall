<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    box-shadow: 0 4px 10px rgba(0,0,0,0.05);

    /* 세로 정렬을 위한 설정 */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;

    text-align: center;
}

/* 이미지 */
.popular_category_items img {
    width: 100px;
    height: 100px;
    object-fit: contain;
    margin-bottom: 10px;
}

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




</style>
<body>
	<!-- 메인 페이지 구현  -->

	<!-- header -->
	<%@ include file="../inc/header.jsp"%>
	<!-- navigation -->
	<%@ include file="../inc/nav.jsp"%>

	<!-- 메인 페이지 -->
	<div class="container" id="container">
		<!-- 배너 -->
		<div class="banner" id="banner"></div>
		<!-- 인기 카테고리 -->
		<div class="popular_category" id="popular_category">
			<!-- 인기 카테고리 추천 div의 텍스트  -->
			<div class="popular_category_label" id="popular_category_id">
				<label id="recommend_category">인기 카테고리 추천</label>
			</div>
			<div class="popular_card">
				<!-- 인기 카테고리 추천 *카드 형식으로*  -->
				<div class="popular_category_items" id="category_1">
					<img alt="전략게임" src=""> <label
						class="popular_category_items_label"
						id="popular_category_items_label_1"> 전략 게임 </label> <label
						class="popular_category_items_detail"
						id="popular_category_items_detail_1">한 수 앞을 내다보는 치열한 두뇌 전쟁</label>
					<button class="popular_category_items_button"
						id="popular_category_items_button_1">보러 가기</button>
				</div>
				<div class="popular_category_items" id="category_2">
					<img alt="전략게임" src=""> <label
						class="popular_category_items_label"
						id="popular_category_items_label_2"> 가족 게임 </label> <label
						class="popular_category_items_detail"
						id="popular_category_items_detail_2">남녀노소 함께 웃고 즐기는 따뜻한 시간</label>
					<button class="popular_category_items_button"
						id="popular_category_items_button_2">보러 가기</button>
				</div>
				<div class="popular_category_items" id="category_3">
					<img alt="전략게임" src=""> <label
						class="popular_category_items_label"
						id="popular_category_items_label_3"> 파티 게임 </label> <label
						class="popular_category_items_detail"
						id="popular_category_items_detail_3">모두가 웃고 떠드는 파티 필수템</label>
					<button class="popular_category_items_button"
						id="popular_category_items_button_3">보러 가기</button>
				</div>
				<div class="popular_category_items" id="category_4">
					<img alt="전략게임" src=""> <label
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
		<div class="best_seller" id="best_seller">
			<div class ="best_seller_div">œœ</div>
		
		</div>
		<!-- 뉴스 레터 -->
		<div class="news_letter" id="news_letter"></div>
	</div>
</body>
</html>