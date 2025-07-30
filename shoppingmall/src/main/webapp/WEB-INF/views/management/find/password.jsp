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
				<form action="<%= contextPath %>/admin/find/password" method="post">
					<div id="input-wrapper">
						<input type="text" class="form-control" id="input-id"	placeholder="아이디를 입력해주세요."> 
						<input type="text" class="form-control" id="input-name"	placeholder="이름을 입력해주세요."> 
						<div class="input-group date" id="reservationdate" data-target-input="nearest">
                        <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate" placeholder="생년월일을 입력해주세요.">
                        <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                    <input type="email" class="form-control" id="input-id"	placeholder="이메일을 입력해주세요."> 
                   <div class="d-flex flex-row justify-content-between">
                   <input type="text" class="form-control w-75" id="input-id"	placeholder="인증번호를 입력해주세요.">
                   <button type="submit" class="btn btn-dark flex-shrink-1">인증번호 요청</button>
                   
                   </div>
					</div>
					<button type="submit" class="btn btn-primary w-100">확인</button>
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
});
</script>
</html>