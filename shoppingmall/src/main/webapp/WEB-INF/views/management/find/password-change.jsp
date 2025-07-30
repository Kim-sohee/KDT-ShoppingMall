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
	flex-direction:column;
	width: 1000px;
	height: 90vh;
	margin: auto;
	align-items: center;
	justify-content: center;
}

.form-wrapper {
	width:50%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.form-wrapper form {
	display:flex;
	flex-direction:column;
	width:100%;
	gap:20px;
}

#input-wrapper {
	display: flex;
	flex-direction:column;
	width: 100%;
	gap:30px;
}
</style>
<body>
	<!--  헤더 시작 -->
	<%@ include file="../inc/header.jsp"%>
	<!-- 헤더 끝 -->
	<main>
		<div id="container">
			<h1>비밀번호 찾기</h1>
			<div class="form-wrapper">
				<form id="change-password-form">
					<div id="input-wrapper">
						<input type="text" class="form-control" id="input-new-passowrd"	placeholder="새비밀번호를 입력해주세요."> 
						<input type="text" class="form-control" id="input-new-password-confirm"	placeholder="새비밀번호를 한번더 입력해주세요."> 
					</div>
					<button class="btn btn-primary w-100">확인</button>
				</form>
			</div>
		</div>
	</main>
</body>

<%@ include file="../inc/footer_link.jsp"%>
<script>
$(()=>{
	    $('#reservationdate').datetimepicker({
	        format: 'YYYY-MM-DD'
	    });
	    
	    $('button').click(()=>{
			$("#change-password-form").attr({
				action: "<%= contextPath%>/admin/change/password",
				method: "POST"
			});
			$("#change-password-form").submit();
	    })
});
</script>
</html>