<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../inc/head_link.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#container {
	display: flex;
	flex-direction: column;
	width: 1000px;
	height: 90vh;
	margin: auto;
	align-items: center;
	justify-content: center;
}

.card {
	display:flex;
	width: 600px;
	height: 300px;
	text-align: center;
	background-color: white;
	justify-content: center;
}

#result-wrapper {
	display:flex;
	align-self:center;
	flex-direction:row;
	justify-content: center;
	align-items: baseline;
}
</style>
<body>
	<!--  헤더 시작 -->
	<%@ include file="../inc/header.jsp"%>
	<!-- 헤더 끝 -->
	<main>
		<div id="container">
			<div class="card card-default">
				<div id="result-wrapper">
					<p>홍길동님의 아이디는</p>
					<p class="text-primary h3"> aaaaaaaaaaa </p>
					<p>입니다.</p>
				</div>
			</div>
		</div>
	</main>
</body>
<%@ include file="../inc/footer_link.jsp"%>
</html>