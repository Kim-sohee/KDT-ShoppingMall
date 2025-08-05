<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 로그인</title>
    <link rel="stylesheet" href="/static/shop/styles/footer.css">
    <style>
        body {
            margin: 0;
            font-family: '맑은 고딕', sans-serif;
            background-color: #fff;
        }
        .container {
            display: flex;
            height: 100vh;
        }
         .left {
		    flex: 1;
		    background-image: url('/img/login/banner_image.png'); /* 이미지 경로 주의 */
		    background-size: cover;       /* 가득 채움 (잘릴 수 있음) */
		    background-position: center;  /* 가운데 정렬 */
		    background-repeat: no-repeat;
		}
        .right {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 80px;
        }
        .right-title {
            font-size: 1.6rem;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }
        .insert-info {
		    border: 1px solid black;
		    padding: 1rem 2rem;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		    margin-bottom: 4rem;
		}
        .insert-info form {
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    width: 100%;
		}
        .insert-info-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }
        .insert-info input {
            width: 60%;
            padding: 12px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            font-size: 16px;
            align-self: center;
        }
        .insert-info button {
            width: 40%;
            padding: 0.5rem 2.5rem;
            background-color: #d71920;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
	<!-- header -->
	<%@ include file="./inc/header.jsp"%>
	<!-- navigation -->
	<%@ include file="./inc/nav.jsp"%>
    <div class="container">
        <div class="left">
        </div>
        <div class="right">
            <!-- 이메일 요청 입력 시작 -->
			<div class="right-title">
				<span>ID 찾기</span>
			</div>
				
			<div class="insert-info">
				<div class="insert-info-title">
					<span>본인 정보를 확인해주세요.</span>
				</div>
            <form id="form-id">
            	<input type="hidden" 	name="type" 					value="id">
				<input type="text" 		name="member_name" 	placeholder="성명 입력">
				<input type="text" 		name="phone" 					placeholder="휴대전화 입력">
				<button class="bt_find" type="button" id="bt_id">확인</button>
            </form>
			</div>
            <!-- 이메일 요청 입력 끝 -->
            
            <!-- 비밀번호 요청 입력 시작 -->
			<div class="right-title">
				<span>비밀번호 찾기</span>
			</div>
			
			<div class="insert-info">
				<div class="insert-info-title">
					<span>본인 정보를 확인해주세요.</span>
				</div>
				<form id="form-password">
            		<input type="hidden" 	name="type" 					value="password">
					<input type="text" 		name="member_name" 	placeholder="성명 입력">
					<input type="text" 		name="id" 							placeholder="ID 입력">
					<button class="bt_find" type="button" id="bt_password">확인</button>
				</form>
			</div>
            <!-- 비밀번호 요청 입력 끝 -->
            
        </div>
    </div>
	<%@include file = "./inc/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function requestEmail(){
		$.ajax({
			url:"/shop/member/find",
			type:"post",
			data: {
				type:						$("#form-id").find("input[name='type']").val(),
				member_name: 	$("#form-id").find("input[name='member_name']").val(),
				phone: 					$("#form-id").find("input[name='phone']").val()
			},
			success:function(result, status, xhr){
				if(result.success){
					console.log(result);
					alert("회원가입 하신 이메일로 정보가 전송되었습니다.");
					location.href="/shop/member/findForm";
				} else {
					console.log(result);
					alert(result.message || "정보를 찾을 수 없습니다.");
				}
			},
			error:function(xhr, status, error){
				console.log(xhr.responseText);
				alert("서버 오류가 발생하였습니다." + (xhr.responseJSON?.message || error));
			}
		});
	}
	
	function requestPassword(){
		$.ajax({
			url:"/shop/member/find",
			type:"post",
			data: {
				type: 						$("#form-password").find("input[name='type']").val(),
				member_name: 	$("#form-password").find("input[name='member_name']").val(),
				id: 							$("#form-password").find("input[name='id']").val()
			},
			success:function(result, status, xhr){
				if(result.success){
					console.log(result);
					alert("회원가입 하신 이메일로 정보가 전송되었습니다.");
					location.href="/shop/member/loginform";
				} else {
					alert(result.message || "정보를 찾을 수 없습니다.");
				}
			},
			error:function(xhr, status, error){
				console.log(xhr.responseText);
				alert("서버 오류가 발생하였습니다." + (xhr.responseJSON?.message || error));
			}
		});
	}
	
	$(()=>{
		$("#bt_id").click(function(e){
			e.preventDefault();
			
			if($("#form-id").find("input[name='member_name']").val().trim() === "") {
				  alert("이름을 입력해주세요.");
				  return;
			}
			if($("#form-id").find("input[name='phone']").val().trim() === "") {
				  alert("연락처를 입력해주세요.");
				  return;
			}
			requestEmail();
		});
		
		$("#bt_password").click(function(e){
			e.preventDefault();
			
			if($("#form-password").find("input[name='member_name']").val().trim() === "") {
				  alert("이름을 입력해주세요.");
				  return;
			}
			if($("#form-password").find("input[name='id']").val().trim() === "") {
				  alert("id를 입력해주세요.");
				  return;
			}
			requestPassword();
		});
	});
</script>
</html>
