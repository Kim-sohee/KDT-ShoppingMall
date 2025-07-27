<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Page</title>
<link rel="stylesheet" href="/static/shop/styles/footer.css">
<style type="text/css">
/* 전체 레이아웃 중앙 정렬 */
#wrapper_detail{
  width: 1200px;
  margin: 0 auto;
  padding: 40px 0;
  font-family: 'Noto Sans KR', sans-serif;
  background-color: #f5f5f5;
}

/* 상단 상품 이미지 + 상품 정보 영역 */
#upperWrapper {
  display: flex;
  justify-content: space-between;
}

/* 왼쪽 이미지 영역 */
#upper_left_side {
  width: 50%;
  
}


/* 메인 이미지 */
#main_image {
  width: 100%;
  height: 90%;
  display: flex; 
  justify-content: center; 
  align-items: center;     
  text-align: center;
}



#main_image img {
  width: 100%;
  max-width: 90%;
  border-radius: 10px;
  border: 1px solid #ddd;
  margin:auto;
}

/* 갤러리 */
#gallery {
  display: flex;
  gap: 10px;
  margin-top: 12px;
  justify-content: center;
}

#gallery img {
  width: 70px;
  height: 70px;
  border: 1px solid #ddd;
  border-radius: 6px;
  cursor: pointer;

 }
 

/* 오른쪽 상품 정보 영역 */
#upper_right_side {
  width: 45%;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

#product_name {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 4px;
}

#product_brand {
  font-size: 14px;
  color: #888;
}

#star {
  color: #f7c948;
  font-size: 25px;
}
#critic{
	font-size: 15px;
	color: #D70C19;
}
#review_count {
  font-size: 14px;
  color: #999;
  margin-left: 5px;
}

#product_price {
  text-decoration: line-through;
  font-size: 16px;
  color: #999;
}

#product_discount {
  font-size: 24px;
  font-weight: bold;
  color: #d32f2f;
}

#percentage_box #discount {
  font-size: 14px;
  color: white;
  background-color: #d32f2f;
  padding: 4px 8px;
  border-radius: 4px;
  display: inline-block;
  margin-top: 4px;
}

/* 게임 카테고리 설명 */
#game_category_box {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin: 20px 20px;
  border-radius:15px;
  border:1px solid black;
  padding:15px;
  background-color:#ffffff;
  
}

#game_category_box div {
  width: 45%;
  display: flex;
  justify-content: space-between;
  font-size: 14px;
}

/* 게임 설명 */
#game_introduce {
  margin: 15px 15px;
  font-size: 14px;
  line-height: 1.6;
  
}

/* 구매 영역 */
#cart_box {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-top: 20px;
}

/* 수량 조절 */
#ea {
  display: flex;
  align-items: center;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 90px;
  height: 32px;
  overflow: hidden;
  background-color: white;
}

#ea button {
  width: 28px;
  height: 100%;
  border: none;
  background-color: #f0f0f0;
  font-size: 16px;
  cursor: pointer;
}

#ea input {
  width: 34px;
  height: 100%;
  border: none;
  text-align: center;
  font-size: 14px;
  background-color: white;
  pointer-events: none;
}

/* 장바구니, 구매, 찜 버튼 */
#bt_cart, #bt_but, #bt_favorite {
  padding: 6px 16px;
  border-radius: 4px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
  text-align: center;
}

#bt_cart {
  background-color: #ff9800;
  color: white;
}

#bt_but {
  background-color: #d32f2f;
  color: white;
}

#bt_favorite {
  background-color: #f5f5f5;
  border: 1px solid #ccc;
  color: #333;
}

/* 배송 안내 박스 */
#delivery_information_box {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin: 20px 20px;
  border-radius:15px;
  border:1px solid black;
  padding:15px;
  background-color:#ffffff;
}

#delivery_information_box > div {
  display: flex;
  justify-content: space-between;
  margin-bottom: 6px;
}

#predict_deliver_days {
  color: #999;
}

/* LowerWrpper 메뉴 탭 스타일 */
#LowerWrpper {
  margin-top: 50px;
  display: flex;
  justify-content: space-around;
  border-top: 2px solid #d32f2f;
  background: white;
  padding: 10px 0;
  font-weight: bold;
}

#LowerWrpper div {
  cursor: pointer;
  padding: 10px 20px;
  border-bottom: 3px solid transparent;
}

#LowerWrpper div:hover {
  border-bottom: 3px solid #d32f2f;
  color: #d32f2f;
}


#detail_panel{
	display:flex;
	justify-content: center;
	background-color:white;
}


#review_panel{
	background: #fff;
  	padding: 40px;
  	margin-top: 60px;
  	font-family: 'Noto Sans KR', sans-serif;
}

/* 상단 평점 요약 */
#review_summary {
  	display: flex;
  	justify-content: space-between;
 	margin-bottom: 30px;
  	align-items: center;
  	line-height: 30px;
}

.score_main {
  	width: 200px;
  	text-align: center;
}

.score_main .score_num {
  	font-size: 48px;
  	font-weight: bold;
  	color: #0037ff;
}

.score_main .score_star {
  font-size: 24px;
  color: #f7c948;
}

.score_main .score_count {
  font-size: 14px;
  color: #666;
}

/* 별점 분포 */
.score_distribution {
  flex-grow: 1;
  padding-left: 50px;
  padding-top: 50px;
  
}

.bar_row {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
  font-size: 14px;
  color: #333;
}

.bar {
  width: 60%;
  height: 10px;
  background: #e0e0e0;
  margin: 0 10px;
  border-radius: 5px;
}

.bar_fill {
  height: 100%;
  background: #ffcc00;
  border-radius: 5px;
}

/* 리뷰 카드 */
#review_list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.review_card {
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 16px;
  background: #f9f9f9;
}

.review_top {
  font-size: 14px;
  margin-bottom: 6px;
  color: #333;
}

.review_top .review_date {
  margin-left: 8px;
  color: #999;
}

.review_top .stars {
  margin-left: 8px;
  color: #f7c948;
  font-weight: bold;
}

.review_text {
  font-size: 14px;
  margin-bottom: 12px;
  color: #222;
}

/* 도움돼요 버튼 */
.btn_helpful {
  border: 1px solid #ccc;
  background: white;
  color: #333;
  padding: 4px 10px;
  border-radius: 6px;
  font-size: 13px;
  cursor: pointer;
}

/* 더보기 버튼 */
.btn_more_container {
  text-align: center;
  margin-top: 24px;
}

#btn_more {
  background: white;
  border: 1px solid #ccc;
  padding: 10px 50px;
  font-size: 15px;
  font-weight: bold;
  border-radius: 8px;
  cursor: pointer;
}
/* 초기에는 static 위치 → JS로 fixed로 바꿔줌 */
#sticky_tab {
  display: flex;
  justify-content: space-around;
  background-color: white;
  padding: 12px 0;
  font-weight: bold;
  border-top: 2px solid #d32f2f;
  border-bottom: 1px solid #ddd;
  position: static;
  z-index: 100;
}

#sticky_tab div {
  cursor: pointer;
  padding: 10px 20px;
  border-bottom: 3px solid transparent;
  transition: 0.2s;
}

#sticky_tab div:hover {
  border-bottom: 3px solid #d32f2f;
  color: #d32f2f;
}

.fixed {
  position: fixed !important;
  top: 0;
  left: 0;
  width: 100%;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  background-color: white;

  display: flex;
  justify-content: center; /* 가운데 정렬 */
}

.fixed > div {
  width: 1200px; /* 기존 내용 영역 */
  display: flex;
  justify-content: space-around;
}


#question_section {
  background: #fff;
  padding: 40px;
  font-family: 'Noto Sans KR', sans-serif;
  margin-top: 60px;
}

#question_section h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

#question_section p {
  font-size: 14px;
  color: #666;
  margin-bottom: 20px;
}

.qna_buttons {
  display: flex;
  gap: 12px;
  margin-bottom: 20px;
  width:50%;
}

.qna_buttons button {
  padding: 10px 20px;
  border: 1px solid #333;
  background: white;
  font-weight: bold;
  cursor: pointer;
  border-radius: 6px;
}

.qna_filter {
  display: flex;
  align-items: center;
  gap: 20px;
  margin-bottom: 20px;
}

.qna_filter select {
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-radius: 6px;
}

.qna_list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.qna_item {
  border-top: 1px solid #ccc;
  padding-top: 12px;
}

.qna_question {
  font-size: 16px;
  margin-bottom: 8px;
}

.qna_meta {
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 13px;
  color: #666;
}

.qna_view {
  padding: 4px 10px;
  border: 1px solid #aaa;
  background: white;
  border-radius: 4px;
  cursor: pointer;
  font-size: 13px;
}

.lock {
  margin-right: 6px;
}
#deliver_section {
  background: #fff;
  padding: 40px;
  font-family: 'Noto Sans KR', sans-serif;
  margin-top: 60px;
}

#deliver_section h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

#deliver_section p {
  font-size: 14px;
  color: #666;
  margin-bottom: 20px;
}

.policy_row {
  border-top: 1px solid #ccc;
  padding: 16px 0;
}

.policy_row strong {
  display: block;
  font-size: 16px;
  margin-bottom: 6px;
}

.policy_row span {
  font-size: 14px;
  color: #333;
  line-height: 1.6;
}

.deny_list {
  margin-top: 6px;
  padding-left: 20px;
  font-size: 14px;
  color: #444;
}

.deny_list li {
  margin-bottom: 4px;
  list-style-type: disc;
}

</style>
</head>

<body>

	<%@ include file = "../inc/header.jsp" %>
	<%@ include file = "../inc/nav.jsp" %>
	
	
	<!-- 전체 페이지가 중앙에 올 수 있도록 함. -->	
	<div id = "wrapper_detail">
		<!-- Upper Wrapper Start  => 상품 이미지 + 가격 소개 -->
		<div id = "upperWrapper">
			<!-- 이미지 표시 영역 -->
				<div id = "upper_left_side">
					<!-- 대표 이미지 영역  -->
					<div id = "main_image">
						<img  alt="메인 페이지" src="/img/detail/main_image.png">
					</div>
					<!-- 이미지 갤러리 영역 -->	
					<div id = "gallery">
						<img alt="메인 이미지" src="/img/detail/main_image.png">
						<img alt="소개 이미지 1" src="/img/detail/image1.png">
						<img alt="소개 이미지 2" src="/img/detail/iamge2.png">
						<img alt="소개 이미지 3" src="/img/detail/iamge3.png">
					</div>
				</div>
				
			<!-- 상품 상세 표시 내역 -->
				<div id = "upper_right_side">
						<!-- 상품명 -->
						<label id = "product_name"> 스플랜더 포켓몬 </label>
						<!-- 브랜드 -->
						<label id = "product_brand">(주) 포켓몬 마스터</label>
						<!-- 별점/리뷰/평점 -->
						<div id= "review_box">
						<!-- 별점 -->
							<label id ="star">*****</label>
							<!-- 평점-->
							<label id = "critic">4.8</label>
							<!-- 별점 옆 총 리뷰 수 -->
							<label id = "review_count">(27)</label>
						</div>
						<!-- 할인 전 가격 -->
						<label id  ="product_price">65,000원</label>
						<!-- 할인 후 가격 -->
						<label id = "product_discount">45,500원</label>
						<!-- 할인 퍼센트 -->
						<div id ="percentage_box">
							<label id = "discount">30% 할인</label>
						</div>
						
						<!-- 게임 카테고리 설명 박스 -->
						<div id = "game_category_box">
							<!-- 인원 수 -->
							<div id = "palyer_box">
								<label id = "player">플레이어</label>
								<label id = "game_player">2~4명</label>
							</div>
							<!-- 플레이 시간 -->
							<div id = "palytime_box">
								<label id = "playtime">플레이 시간</label>
								<label id = "game_playtime">3시간 ~ 4시간</label>
							</div>
							<!-- 연령 -->
							<div id = "playe_age_box">
								<label id = "playage">연령</label>
								<label id = "game_playage"> 만 10세+</label>
							</div>
							<!-- 난이도 -->
							<div id = "game_level_box">
								<label id = "level">난이도</label>
								<label id = "game_level">초급, 중급</label>
							</div>
						</div>
						
						<!-- 게임에 관한 간단한 소개 -->
						<div id= "game_introduce">
							<p>게임의 설명을 물으신다면 대답해주는게 인지상정 세계의 파괴를 막기 위해, 세계의 평화를 지키기 위해
							사랑과 진실 어둠을 뿌리고 다니는 포켓몬의 감초, 귀염둥이 악당! 난 피그마! 난 ERD! 난 집에 가고싶다옹!</p>
						</div>
						
						<!-- 구매 수량/장바구니 담기/ 구매 버튼/찜 버튼 -->
						<div id = "cart_box">
							<!-- 구매 수량 선택 -->
							<div id ="ea">
  								<button onclick="decrease()">-</button>
  								<input type="text" id="quantity" value="1" readonly>
  								<button onclick="increase()">+</button>
							</div>
							<!-- 장바구니 담기 버튼 -->
							<div id = "bt_cart" >장바구니 담기</div>
							<!-- 구매 버튼 -->
							<div id = "bt_but" >구매하기</div>
							<!--  찜 버튼 -->
							<div id = "bt_favorite" >찜</div>
						</div>
						
						<!-- 배송 안내 박스 -->
						<div id = "delivery_information_box">
							<!-- 배송 -->
							<div id = "deliver">
								<label>배송</label>
								<label>무료 배송(도서 산간 3,000원 ~ 5,000원)</label>
							</div>
							<!-- 예상 배송일 -->
							<div id = "predict_deliver">
								<label id = "predict_deliver_date">예상 배송일</label>
								<label id = "predict_deliver_days">1~2d일(영업일 기준)</label>
							</div>
						</div>
				 </div>
		</div>
		<!-- Upper Wrapper End -->
		
		<!-- Lower Wrapper Start => 각 메뉴바를 누르면 그 위치로 스크롤이 이동할 수 있게함 -->
		<div id="LowerWrpper">
			<!-- 하단 패널 -->
		  	<!--상세 정보 패널 이동-->
		  	<div id = "detail_information">상세정보</div>
		  	<!-- 리뷰 패널 이동 -->
		  	<div id = "review_information">리뷰(25)</div>
		  	<!-- Q&A패널 이동 -->
		  	<div id = "question_information">Q&A(5)</div>
		  	<!-- 배송/교환/상품 패널 이동 -->	
		  	<div id = "deliver_information">배송/교환/반품</div>
		</div>
			
		<!-- 제품에 대한 상세 정보 이미지 출력  -->
		<div id = "detail_panel">
			<img alt="상세 정보" src="/img/detail/detail_information.jpg">
		</div>
		
		<!-- 제품 리뷰에 대한 패널 출력 -->
		<!-- 리뷰 전체 wrapper -->
		<div id="review_panel">
			<!-- 상단 평점 요약 영역 -->
		  	<div id="review_summary">
		    	<div class="score_main">
		      	<div class="score_num">4.8</div>
		      	<div class="score_star">★★★★★</div>
		      	<div class="score_count">25개의 리뷰</div>
		    </div>
		
		    <!-- 별점 분포 그래프 -->
		    <div class="score_distribution">
		    	<div class="bar_row"><span>5점</span><div class="bar"><div class="bar_fill" style="width:90%"></div></div><span>18</span></div>
		      	<div class="bar_row"><span>4점</span><div class="bar"><div class="bar_fill" style="width:20%"></div></div><span>4</span></div>
		      	<div class="bar_row"><span>3점</span><div class="bar"><div class="bar_fill" style="width:15%"></div></div><span>2</span></div>
		      	<div class="bar_row"><span>2점</span><div class="bar"><div class="bar_fill" style="width:5%"></div></div><span>1</span></div>
		      	<div class="bar_row"><span>1점</span><div class="bar"><div class="bar_fill" style="width:0%"></div></div><span>0</span></div>
		    </div>
		  </div>
		
		  <!-- 리뷰 카드 리스트 -->
		  <div id="review_list">
		  	<div class="review_card">
		      	<div class="review_top">
		        	<strong>보드게임러버</strong> <span class="review_date">2025.07.15</span> <span class="stars">★★★★★</span>
		      	</div>
		    <div class="review_text">선물로 사줬는데 포켓몬이 귀여워서 너무 좋아했습니다. 크기가 딱 알맞고 두껍지 않아서 만족스러웠습니다! ...</div>
		      	<button class="btn_helpful">도움돼요 (12)</button>
		    </div>
		
		    <div class="review_card">
		      	<div class="review_top">
		        	<strong>홍길동9921</strong> <span class="review_date">2025.07.05</span> <span class="stars">★★★★★</span>
		      	</div>
		      	<div class="review_text">기존 스플렌더와는 다른 점이 포켓몬 테마로 진화하는 요소가 가미되어 게임에 재미를 더해주는 것 같습니다. ...</div>
		      	<button class="btn_helpful">도움돼요 (8)</button>
		    </div>
		
		    <div class="review_card">
		      	<div class="review_top">
		        	<strong>HOLYMOLY</strong> <span class="review_date">2025.07.03</span> <span class="stars">★★★★☆</span>
		      	</div>
		      	<div class="review_text">피카츄 사랑해 피카츄 사랑해 피카츄 사랑해 피카츄 사랑해 피카츄 사랑해 ...</div>
		      	<button class="btn_helpful">도움돼요 (1)</button>
		    </div>
		
		    <div class="review_card">
		      	<div class="review_top">
		        	<strong>errenkl229</strong> <span class="review_date">2025.06.23</span> <span class="stars">★★★☆☆</span>
		      </div>
		      <div class="review_text">박스가 손상된 상태로 왔어요ㅠㅠ</div>
		      	<button class="btn_helpful">도움돼요 (7)</button>
		    </div>
		  </div>
		
		  <!-- 더보기 버튼 -->
		  <div class="btn_more_container">
		    <button id="btn_more">더보기</button>
		  </div>
		</div>
		
		
		<!-- Q&A에 대한 패널출력  -->
		<!-- Q&A 에 대한 패널 출력 -->
		<div id="question_section">
		  <h2>Q&A (3)</h2>
		  <p>구매하시려는 상품에 대해 궁금한 점이 있으신 경우 문의해주세요.</p>
		
		  <div class="qna_buttons">
		    <button id="qna_write">상품 Q&A 작성하기</button>
		    <button id="qna_mylist">나의 Q&A 조회</button>
		  </div>
		
		  <div class="qna_filter">
		    <label><input type="checkbox"> 비밀글 제외</label>
		    <select>
		      <option>답변상태</option>
		      <option>답변완료</option>
		      <option>미답변</option>
		    </select>
		  </div>
		
		  <div class="qna_list">
		    <!-- 질문 1 -->
		    <div class="qna_item">
		      <div class="qna_question">토큰 추가 구매 가능한가요?</div>
		      <div class="qna_meta">
		        <span>답변완료</span>
		        <span>hees******</span>
		        <span>2025.05.29</span>
		        <button class="qna_view">보기</button>
		      </div>
		    </div>
		
		    <!-- 질문 2 -->
		    <div class="qna_item">
		      <div class="qna_question"><span class="lock">🔒</span> 비밀글입니다.</div>
		      <div class="qna_meta">
		        <span>답변완료</span>
		        <span>meey******</span>
		        <span>2025.04.13</span>
		      </div>
		    </div>
		
		    <!-- 질문 3 -->
		    <div class="qna_item">
		      <div class="qna_question"><span class="lock">🔒</span> 비밀글입니다.</div>
		      <div class="qna_meta">
		        <span>답변완료</span>
		        <span>lyew******</span>
		        <span>2025.04.01</span>
		      </div>
		    </div>
		  </div>
		  
		  <!-- 배송/교환/반품 섹션 -->
			<div id="deliver_section">
			  <h2>배송/교환/반품 정보</h2>
			  <p>신세계 보드게임즈 배송/반품/교환 안내입니다.</p>
			
			  <div class="policy_row">
			    <strong>판매자 지정 택배사</strong>
			    <span>자체 배송사</span>
			  </div>
			
			  <div class="policy_row">
			    <strong>반품 배송비</strong>
			    <span>편도 3,000원</span>
			  </div>
			
			  <div class="policy_row">
			    <strong>보내실 곳</strong>
			    <span>서울 강남구 삼성로 534 SAC아트홀 6층 (우편번호: 06166)</span>
			  </div>
			
			  <div class="policy_row">
			    <strong>반품/교환 사유에 따른 요청 가능기간</strong>
			    <span>
			      구매자 단순 변심은 상품 수령 후 7일 이내 (구매자 반품 배송비 부담)<br>
			      표시/광고와 상이, 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내 (판매자 반품 배송비 부담) 둘 중 하나 경과 시 반품/교환 불가
			    </span>
			  </div>
			
			  <div class="policy_row">
			    <strong>반품/교환 불가능 사유</strong>
			    <ul class="deny_list">
			      <li>반품 요청기간이 지난 경우</li>
			      <li>구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</li>
			      <li>포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우</li>
			      <li>구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
			      <li>시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
			      <li>고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우</li>
			      <li>복제가 가능한 상품 등의 포장을 훼손한 경우</li>
			    </ul>
			  </div>
			</div>
</div>
	</div>
	<%@ include file = "../inc/footer.jsp" %>
	<script>
	document.addEventListener("DOMContentLoaded", function () {
		  // 탭 → 대상 섹션 ID 매핑
		  const tabMap = {
		    detail_information: "detail_panel",
		    review_information: "review_panel",
		    question_information: "question_section",       
		    deliver_information: "deliver_section"          
		  };

		  // 각 탭에 스크롤 이동 이벤트 바인딩
		  Object.keys(tabMap).forEach(tabId => {
		    const tab = document.getElementById(tabId);
		    const target = document.getElementById(tabMap[tabId]);

		    if (tab && target) {
		      tab.addEventListener("click", function () {
		        target.scrollIntoView({ behavior: "smooth" });
		        
		      });
		    } else {
		      // 연결된 섹션이 없으면 알림 처리 (선택 사항)
		      tab?.addEventListener("click", function () {
		        alert("해당 섹션은 아직 연결되지 않았습니다.");
		      });
		    }
		    
		    const gallery = document.querySelectorAll("#gallery img"); // 갤러리 이미지들
		    const mainImage = document.querySelector("#main_image img"); // 메인 이미지

		    gallery.forEach(img => {
		      img.addEventListener("click", function () {
		        const newSrc = this.getAttribute("src"); // 클릭된 이미지의 src 가져오기
		        mainImage.setAttribute("src", newSrc);   // 메인 이미지의 src를 교체
		      });
		    });
		  });
		  
		  

		  // 상단 탭 고정 처리
		  const stickyTab = document.getElementById('LowerWrpper');
		  const stickyOffset = stickyTab?.offsetTop || 0;

		  window.addEventListener('scroll', function () {
		    if (!stickyTab) return;

		    if (window.scrollY >= stickyOffset) {
		      stickyTab.classList.add('fixed');
		    } else {
		      stickyTab.classList.remove('fixed');
		    }
		  });
		});
	</script>
</body>

</html>