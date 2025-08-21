<%@page import="shoppingmall.domain.ProductImage"%>
<%@page import="shoppingmall.domain.Product"%>
<%@page import="shoppingmall.domain.PlayerRange"%>
<%@page import="shoppingmall.domain.AgeRange"%>
<%@page import="shoppingmall.domain.Difficulty"%>
<%@page import="shoppingmall.domain.Theme"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
List<Theme> themes = (List<Theme>) request.getAttribute("themes");
List<Difficulty> difficulties = (List<Difficulty>) request.getAttribute("difficulties");
List<AgeRange> ageRanges = (List<AgeRange>) request.getAttribute("ageRanges");
List<PlayerRange> playerRanges = (List<PlayerRange>) request.getAttribute("playerRanges");
Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 상세</title>
<%@ include file="../inc/head_link.jsp"%>
<style>
.search-btn {
	height: calc(1.5em + 0.75rem + 2px);
	/* form-control과 같은 높이 */
	border-left: 1;
}

.image-container {
	position: relative;
	display: inline-block;
}

.image-delete-btn {
	position: absolute;
	top: 5%;
	right: 5%;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 10;
}

.sub-image-container {
	width: 100px;
	height: 100px;
}

.main-image-container {
	width: 520px;
	height: 520px;
	overflow: hidden;
}

.main-image-container img {
	width: 100% !important;
	height: 100% !important;
	object-fit: cover !important;
	display: block;
}

.image-delete-btn:hover {
	background-color: #c82333;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<%@ include file="../inc/preloader.jsp"%>


		<!-- Main Sidebar Container -->
		<%@ include file="../inc/left_bar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>상품상세</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item">상품관리</li>
								<li class="breadcrumb-item active">상품상세</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content">
				<div class="d-flex flex-row justify-content-end p-4">
					<a href="<%= contextPath%>/admin/product/modify?product_id=<%= product.getProduct_id()%>"><button id="btn-submit" class="btn btn-primary">수정하기</button></a>
					<button id="btn-remove" class="btn btn-danger ml-3">삭제하기</button>
				</div>
				<div class="row p-4">
					<div class="card w-100">
						<div class="card-body">
							<div class="d-flex flex-column">
								<form id="product-form">
									<div class="d-flex flex-row">
										<div class="d-flex flex-column">
											<div>
												<div id="mainImageContainer" class="image-container main-image-container" style="position: relative; display: inline-block">
											
													<div class="add-image-btn" style="width: 100%; height: 100%;">
														<i class="fa fa-plus"></i>
														<p>메인 이미지</p>
													</div>
												</div>
											</div>
											<div class="d-flex flex-row mt-2">
												<div id="subImage1" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														
													</div>
												</div>
												<div id="subImage2" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														
													</div>
												</div>
												<div id="subImage3" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														
													</div>
												</div>
												<div id="subImage4" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														
													</div>
												</div>
												<div id="subImage5" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														
													</div>
												</div>
												<input type="file" id="mainImageInput" name="files" accept="image/*" style="display: none;">
												<input type="file" id="subImageInput1" name="files" accept="image/*" style="display: none;">
												<input type="file" id="subImageInput2" name="files" accept="image/*" style="display: none;">
												<input type="file" id="subImageInput3" name="files" accept="image/*" style="display: none;">
												<input type="file" id="subImageInput4" name="files" accept="image/*" style="display: none;">
												<input type="file" id="subImageInput5" name="files" accept="image/*" style="display: none;">
											</div>
										</div>
										<div class="d-flex flex-column flex-grow-1">
											<div class="d-flex flex-row align-items-center">
												<p class="w-25 mb-0 text-right mr-3">상품명 :</p>
												<div type="text" class="w-100 font-weight-bold" id="product-name"><%= product.getProduct_name()%></div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">가격 :</p>
												<div type="text" class="w-100 font-weight-bold" id="price"><%= product.getPrice()%>원</div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">할인율 :</p>
												<div type="text" class="w-100 font-weight-bold" id="discount-rate"><%= product.getDiscount_rate()+"%"%></div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">플레이시간 :</p>
												<div type="text" class="w-100 font-weight-bold" id="play-time"><%= product.getPlay_time()%>분</div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">카테고리 :</p>
												<div type="text" class="w-100 font-weight-bold" id="theme-name"><%= product.getTheme().getTheme_name()%></div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">난이도 :</p>
												<div type="text" class="w-100 font-weight-bold" id="game-level"><%= product.getDifficulty().getGame_level()%></div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">연령대 :</p>
												<div type="text" class="w-100 font-weight-bold" id="age-min"><%= product.getAgeRange().getAge_min()%>세</div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">인원수 :</p>
												<div type="text" class="w-100 font-weight-bold" id="player-range"><%= product.getPlayerRange().getPlayer_min() %> ~ <%= product.getPlayerRange().getPlayer_max() %>명</div>
											</div>
											<div class="d-flex flex-row align-items-center mt-5">
												<p class="w-25 mb-0 text-right mr-3">재고수량 :</p>
												<div type="text" class="w-100 font-weight-bold" id="product-quantity"><%= product.getProduct_quantity()%></div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
					<div class="card w-100">
						<div class="card-header">
							<p class="h3">상품설명</p>
						</div>
						<div class="card-body">
							<div><%= product.getDescription() %></div>
						</div>
					</div>
			</section>
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="../inc/footer.jsp"%>
	</div>
	<!-- ./wrapper -->
	<%@ include file="../inc/footer_link.jsp"%>

	<script>
        //Date picker
        $("#reservationdate").datetimepicker({
            format : "YYYY-MM-DD",
            defaultDate : moment(),
        });

        $("#summernote").summernote({
            placeholder : "내용을 입력해주세요",
            height : 1000,
        });
        
        <% if(product.getDescription() != null && !product.getDescription().isEmpty()) { %>
        $("#summernote").summernote('code', '<%= product.getDescription().replace("'", "\\'").replace("\n", "\\n") %>');
        <% } %>

        // Image upload functionality
        function setupImageUpload(containerId, inputId) {
            const container = document.getElementById(containerId);
            const input = document.getElementById(inputId);
            const addButton = container.querySelector('.add-image-btn');

            // File input change event
            input.addEventListener('change',function(e) {
				const file = e.target.files[0];
				if (file) {
				    const reader = new FileReader();
				    reader.onload = function(e) {
				        // Create image element
				        const img = document
				                .createElement('img');
				        img.src = e.target.result;
				        img.style.width = '100%';
				        img.style.height = '100%';
				        img.style.objectFit = 'cover';
				        img.style.display = 'block';
				
				        // Hide add button and add image and delete button
				        addButton.style.display = 'none';
				        container.appendChild(img);
				    };
				    reader.readAsDataURL(file);
				}
			});
        }
        
       async function setFileFromUrl(url, inputElement) {
            try {

                const element = inputElement.jquery ? inputElement[0] : inputElement;
                // URL에서 이미지 fetch
                const response = await fetch(url);
                const blob = await response.blob();
                
                // File 객체 생성
                const fileName = url.split('/').pop() || 'image.jpg';
                const file = new File([blob], fileName, { type: blob.type });
                
                // DataTransfer를 사용해서 파일 설정
                const dataTransfer = new DataTransfer();
                dataTransfer.items.add(file);
                element.files = dataTransfer.files;
                
                // change 이벤트 발생
                element.dispatchEvent(new Event('change', { bubbles: true }));
                
            } catch (error) {
                console.error('파일 설정 실패:', error);
            }
        }

        // Setup image upload for all containers
        setupImageUpload('mainImageContainer', 'mainImageInput');
        setupImageUpload('subImage1', 'subImageInput1');
        setupImageUpload('subImage2', 'subImageInput2');
        setupImageUpload('subImage3', 'subImageInput3');
        setupImageUpload('subImage4', 'subImageInput4');
        setupImageUpload('subImage5', 'subImageInput5');
        
        $('#btn-remove').click(()=>{
			if(confirm('상품을 정말 삭제하시겠습니까?')){
				$.ajax({
					url: "/admin/product/remove",
					type: "post",
					data: {
						"product_id": "<%= product.getProduct_id()%>"
					},
					success: (result, status, xhr) => {
						if(result.result) {
						    alert('상품 삭제에 성공하였습니다.');
						    location.replace('/admin/product/listpage');
						} else {
							alert('상품 삭제에 실패하였습니다. error : ' + result.errorMessage);
						}
					},
					error: (xhr, status, error) => {
						console.log(error);
					    alert('상품 삭제에 실패하였습니다.');
					}
				})
			}
        })
        
        $(()=>{
			$('#theme-select').val('<%=product.getTheme().getTheme_id()%>');
			$('#geme-level-select').val('<%=product.getDifficulty().getDifficulty_id()%>');
			$('#age-range-select').val('<%=product.getAgeRange().getAge_range_id()%>');
			$('#player-select').val('<%=product.getPlayerRange().getPlayer_range_id()%>');
			<%for (int i = 0; i < product.getProductImages().size(); i++) {
					ProductImage productImage = product.getProductImages().get(i);
					String url = contextPath + "/data/" + "p_" + product.getProduct_id() + "/" + productImage.getFileName();
					String inputname = "mainImageInput";
					if (i != 0) {
						inputname = "subImageInput" + i;
					}
			%>
			
				setFileFromUrl('<%=url%>',$('#<%= inputname%>'));
			<%}%>
        });
    </script>

</body>
</html>














