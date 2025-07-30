<%@page import="shoppingmall.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% Member loginMember = (Member)session.getAttribute("member");%>
<style>
body{
	margin: 0;
	padding: 0;
}
/* 검색 창 전체의 색상 및 크기 */
#wrapper {
	width: 100%;
	height: 135px;
	background-color: white;
	display: flex;
	align-items: center;
	gap: 20px;
	padding: 10px 20px;
	
}

/* 로고 박스*/
#logo_image {
	width: 150px;
	height:130px;
	
}

/* 쇼핑몰 상호 박스 위치 조정 */
#shoppingMallName_box {
	width: 180px;
	height: 90px;
	display: flex;
	align-items: center;
}

/* 쇼핑몰 상호 */
#shoppingMallName {
	font-size: 45px;
	font-weight: bold;
	color: red;
}

/* 검색창 */
.search-box {
	margin-left: 100px;
	margin-right: 50px;
	position: relative;
	width: 740px;
	height: 50px;
}

.search-text {
	width: 100%;
	height: 100%;
	border-radius: 30px;
	background-color: #e0e0e0;
	border: none;
	padding: 0 100px 0 20px; /* 오른쪽 버튼 자리 확보 */
	box-sizing: border-box;
	font-size: 16px;
}

/* 검색 버튼 */
.search-btn {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	height: 36px;
	padding: 0 20px;
	border: none;
	border-radius: 20px;
	background-color: red;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

/* 로그인/장바구니/마이페이지 라벨 */
.login, .cart, .mypage {
	margin-left: 10px;
	cursor: pointer;
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- whole wrapper start -->
	<div id="wrapper">
		<!-- logo -->
		<img alt="logo_image" id = "logo_image" src="/img/sinsegae_games.png">
		<!-- 쇼핑몰 이름 라벨 --> 
		<div id="shoppingMallName_box">
			<label id="shoppingMallName">보드 게임 </label>
		</div>

		<!-- 검색 창 구현 class-name : search-form -->
		<form class="search-box" action="" method="GET">
			<!-- 검색어 입력창 -->
			<input class="search-text" id="search-text" type="text" name="" placeholder="검색어를 입력해주세요.">
			
			<!--  필요시 type을 버튼으로 교체 가능합니다. -->
			<button class="search-btn" type="submit">검색</button>
		</form>
		
		<!-- 로그인 / 장바구니 / 마이페이지 -->
		<%if (loginMember == null){ %>
		<label class="login"><a href="/shop/member/loginform">로그인</a></label>
		<%} else{%>
		<label class="login"><a href="/shop/member/logout">로그아웃</a></label>
		<%} %>
		<label class="cart" id="cart">장바구니</label>
		<label class="mypage" id="mypage">마이페이지</label>
	</div>
</body>
