<%@page import="shoppingmall.domain.Qna"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../inc/init.jsp" %>
<%
    Qna qna = (Qna)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보드게임</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap">
<link rel="stylesheet" href="/static/shop/styles/mypage.css">
<link rel="stylesheet" href="/static/shop/styles/footer.css">
<link rel="stylesheet" href="/static/shop/styles/date.css">
</head>
<style>
.answer-box {
	margin-top: 40px;
}

.answer-box h3 {
	text-align: left;
	font-size: 1.3rem;
	margin-bottom: 1rem;
}

.answer-content {
	padding: 20px 0;
	border-radius: 10px;
	margin: 0 auto;
	width: 100%;
	text-align: center;
	font-size: 1rem;
}

.answered {
	background-color: #fff5f5; 
	border: 1px solid #ffb3b3; 
	color: #d70c19; 
}

.waiting {
	background-color: #fff7f7; 
	border: 1px solid #e6b3b3;
	color: #a94442;
}

.button-area {
	text-align: right;
	margin-top: 30px;
}

.btn-back {
	display: inline-block;
	background-color: #d70c19; 
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s;
}

.btn-back:hover {
	background-color: #ff6b6b; 
}
</style>
<body>
	<!-- header 시작 -->
	<%@ include file="../inc/header.jsp"%>
	<!-- header 끝 -->

	<!-- navigation 시작 -->
	<%@ include file="../inc/nav.jsp"%>
	<!-- navigation 끝 -->

	<!-- 마이페이지 본문 시작 -->
	<main class="main-content">
		<div class="mypage-header">
			<h1>마이페이지</h1>
		</div>
		
		<div class="container">
			<!-- 마이페이지 사이드바 시작 -->
			<%@include file="../inc/sidebar.jsp" %>
			<!-- 마이페이지 사이드바 끝 -->
			
			<!-- 페이지 우측 aside 시작 -->
			<section class="aside-container">
				
				<!-- 문의 상세 영역 -->
				<section class="detail-content">
					<div class="detail-content-name">
						<h2>문의 상세 내역</h2>
					</div>
				
					<div class="mypage-table">
						<div class="col-12">
							<table class="my-hover-table">
								<tr>
									<th>제목</th>
									<td><%= qna.getTitle() %></td>
								</tr>
								<tr>
									<th>내용</th>
									<td style="white-space: pre-wrap;"><%= qna.getContent() %></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td><%= qna.getMember().getMember_name() %></td>
								</tr>
							</table>
				
							<div class="answer-box">
								<h3>관리자 답변</h3>
				
								<%
								if (qna.getComment() != null) {
								%>
									<div class="answer-content answered">
										<p><%= qna.getComment() %></p>
									</div>
								<%
								} else {
								%>
									<div class="answer-content waiting">
										<p>답변을 기다리고 있습니다.</p>
									</div>
								<%
								}
								%>
							</div>
				
							<div class="button-area">
								<a class="btn-back" href="/shop/mypage/list?page=qna">목록으로 돌아가기</a>
							</div>
						</div>
					</div>
				</section>
				<!-- 문의 상세 영역 끝 -->
			</section>
			<!-- 페이지 우측 aside 끝 -->
		</div>
	</main>
	<!-- 마이페이지 본문 끝 -->

	<!-- footer 시작 -->
	<%@ include file="../inc/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>