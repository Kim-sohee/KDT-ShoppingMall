<%@page import="shoppingmall.domain.Theme"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% List<Theme> themeList = (List)request.getAttribute("themeList");%>
<style>
/* 기본적으로 body에 여백 제거 (페이지 전체 레이아웃을 꽉 차게 하기 위함) */
body {
	margin: 0;
	padding: 0;
}

/* 상단 네비게이션 바 스타일 */
#nav {
	width: 100%;
	height: 70px;
	display: flex; 
	
	/* header 와의 구분  */
	border-top: 3px solid #ccc;
}

/* 각각의 네비게이션 항목 박스 */
.nav-items {
	width: 111px;
	height: 100%;
	display: flex; 
	align-items: center;
	cursor: pointer; 
	line-height: 70px;
}

/* 호버 시 배경색 살짝 변경 */
.nav-items:hover {
	background-color: #ddd;
}

/* 네비게이션 항목 내부 라벨 */
.items-label {
	width: 100%;
	height: 50px;
	text-align: center;
	font-weight: bold;
	line-height:50px;
}
</style>

<body>
	<!-- 상단 내비게이션 바 전체 -->
	<div class="nav-box" id="nav">
		<!-- 각 항목은 게임 카테고리를 의미 -->
		<div class="nav-items">
			<div class="items-label">
				<a href="/shop/product/list" >전체 게임</a></div>
		</div>
		<% for(Theme theme: themeList){ %>
			<div class="nav-items">
				<div class="items-label">
				<a href="/shop/product/list?theme.theme_id=<%=theme.getTheme_id() %>" ><%=theme.getTheme_name() %> 게임</a></div>
			</div>
		<% } %>
	</div>
</body>
