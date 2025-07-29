<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./inc/head_link.jsp"%>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<style>
#container {
	width: 1000px;
	height: 100%;
	margin: auto;
}

#logo {
	display: block;
	width: 50%;
	height: auto;
	margin: auto;
	content-align: center;
	width: 50%;
}

.form-wrapper form, #input-group, #find-group {
	display: flex;
	flex-direction: column;
	gap: 20px;
	align-items: center;
}

#find-group {
	display: flex;
	flex-direction: row;
	justify-content: center;
	gap: 30px;
}

hr {
	margin-top: 1rem;
	margin-bottom: 1rem;
	border: 0;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
}
</style>
<body class="sidebar-mini" style="height: auto;">
	<div class="wrapper">
		<!--  헤더 시작 -->
		<%@ include file="./inc/header.jsp"%>
		<!-- 헤더 끝 -->
		<!-- 메인 시작 -->
		<main>
			<div id="container">
				<img id="logo" alt="로고" src="/shoppingmall/img/sinsegae_games.png">
				<div class="form-wrapper">
					<form id="login-form">
						<div id="input-group" class="w-50">
							<input type="email" class="form-control" id="input-id" name="id" placeholder="아이디를 입력해주세요.">
							<input type="password" class="form-control" id="input-password" name="password" placeholder="비밀번호를 입력해주세요.">
						</div>
						<button id="btn-login" type="button" class="btn btn-primary w-50">로그인</button>
					</form>
					<br>
					<div id="find-group">
						<a href="<%= contextPath %>/admin/find/idpage">아이디 찾기</a> <a href="<%= contextPath %>/admin/find/passwordpage">패스워드 찾기</a>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
<%@ include file="./inc/footer_link.jsp"%>
<script>
var Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
  });

$("#btn-login").click(()=>{
	const formData = new FormData(document.getElementById('login-form'));
	$.ajax({
		url: "/shoppingmall/admin/login",
		type: "post",
		processData: false,
	    contentType: false,
		data:formData,
		success: (result, status, xhr) => {
			console.log(result);
			if(result.result) {
				location.replace("/shoppingmall/admin/order/history/list");
			} 
		},
		error: (xhr, status, error) => {
			console.log(error);
		}
	})
});
</script>
</html>
