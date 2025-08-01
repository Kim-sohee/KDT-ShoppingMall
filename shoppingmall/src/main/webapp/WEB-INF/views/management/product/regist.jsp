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
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 관리</title>
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

.add-image-btn {
	width: 100%;
	height: 100%;
	aspect-ratio: 1/1;
	border: 2px dashed #007bff;
	background-color: #f8f9fa;
	border-radius: 8px;
	display: inline-flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

.add-image-btn:hover {
	border-color: #0056b3;
	background-color: #e7f3ff;
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

.image-container {
	position: relative;
	display: inline-block;
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
							<h1>상품등록</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">상품관리</li>
								<li class="breadcrumb-item active">상품등록</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content">
				<div class="d-flex flex-row justify-content-end p-4">
					<button id="btn-submit" class="btn btn-primary">등록하기</button>
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
														<i class="fa fa-plus"></i>
													</div>
												</div>
												<div id="subImage2" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														<i class="fa fa-plus"></i>
													</div>
												</div>
												<div id="subImage3" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														<i class="fa fa-plus"></i>
													</div>
												</div>
												<div id="subImage4" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														<i class="fa fa-plus"></i>
													</div>
												</div>
												<div id="subImage5" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
													<div class="add-image-btn">
														<i class="fa fa-plus"></i>
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
												<input type="text" class="form-control" id="product_name" name="product_name" placeholder="상품명" />
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">가격 :</p>
												<input type="number" class="form-control" id="price" name="price" placeholder="가격" />
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">할인율 :</p>
												<input type="number" class="form-control" id="discount_rate" name="discount_rate" placeholder="할인율" />
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">플레이시간 :</p>
												<input type="number" class="form-control" id="play_time" name="play_time" placeholder="플레이시간" />
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">카테고리 :</p>
												<select id="theme-select" class="custom-select" name="theme.theme_id">
													<option>테마를 선택해주세요.</option>
													<%
													for (int i = 0; i < themes.size(); i++) {
														Theme theme = themes.get(i);
													%>
													<option value="<%=theme.getTheme_id()%>"><%=theme.getTheme_name()%></option>
													<%
													}
													%>
												</select>
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">난이도 :</p>
												<select id="geme-level-select" class="custom-select" name="difficulty.difficulty_id">
													<option>난이도를 선택해주세요.</option>
													<%
													for (int i = 0; i < difficulties.size(); i++) {
														Difficulty difficulty = difficulties.get(i);
													%>
													<option value="<%=difficulty.getDifficulty_id()%>"><%=difficulty.getGame_level()%></option>
													<%
													}
													%>
												</select>
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">연령대 :</p>
												<select id="age-range-select" class="custom-select" name="ageRange.age_range_id">
													<option>연령대를 선택해주세요.</option>
													<%
													for (int i = 0; i < ageRanges.size(); i++) {
														AgeRange ageRange = ageRanges.get(i);
													%>
													<option value="<%=ageRange.getAge_range_id()%>"><%=ageRange.getAge_min()%></option>
													<%
													}
													%>
												</select>
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">인원수 :</p>
												<select id="play-time-select" class="custom-select" name="playerRange.player_range_id">
													<option>플레이 인원수를 선택해주세요.</option>
													<%
													for (int i = 0; i < playerRanges.size(); i++) {
														PlayerRange playerRange = playerRanges.get(i);
													%>
													<option value="<%=playerRange.getPlayer_range_id()%>"><%=playerRange.getPlayer_min()%> ~
														<%=playerRange.getPlayer_max()%>명
													</option>
													<%
													}
													%>
												</select>
											</div>
											<div class="d-flex flex-row align-items-center mt-2">
												<p class="w-25 mb-0 text-right mr-3">재고수량 :</p>
												<input type="number" class="form-control" id="product_quantity" name="product_quantity" placeholder="재고수량" />
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
							<p class="h3">상품 상세</p>
						</div>
						<div class="card-body">
							<textarea id="summernote" name="editordata"></textarea>
						</div>
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
        
        $("#btn-submit").click(()=>{
        	// 폼 데이터를 JSON 객체로 변환
        	const form = document.querySelector('#product-form');
        	const formData = new FormData(form);
        	
        	// Summernote 내용 가져오기 (editordata)
        	const summernoteContent = $('#summernote').summernote('code');
        	
        	// JSON 객체 생성
        	const jsonData = {
        		product_name: formData.get('product_name'),
        		price: parseInt(formData.get('price')) || 0,
        		discount_rate: parseInt(formData.get('discount_rate')) || 0,
        		play_time: parseInt(formData.get('play_time')) || 0,
        		product_quantity: parseInt(formData.get('product_quantity')) || 0,
        		description: summernoteContent,
        		theme: {
        			theme_id: parseInt(formData.get('theme.theme_id')) || null
        		},
        		difficulty: {
        			difficulty_id: parseInt(formData.get('difficulty.difficulty_id')) || null
        		},
        		ageRange: {
        			age_range_id: parseInt(formData.get('ageRange.age_range_id')) || null
        		},
        		playerRange: {
        			player_range_id: parseInt(formData.get('playerRange.player_range_id')) || null
        		}
        	};
        	
        	console.log('JSON Data:', jsonData);
        	
        	// multipart/form-data로 전송 (파일 유무 관계없이)
        	const submitFormData = new FormData();
        	const jsonString = JSON.stringify(jsonData);
        	console.log('JSON String length:', jsonString.length);
        	console.log('JSON String:', jsonString);
        	
        	submitFormData.append('productData', jsonString);
        	
        	// 파일들 추가 (빈 파일이라도 추가)
        	const files = formData.getAll('files');
        	console.log('Files to submit:', files.length);
        	files.forEach((file, index) => {
        		console.log(`File ${index}:`, file.name, file.size);
        		submitFormData.append('files', file);
        	});
        	
        	// FormData 내용 확인
        	console.log('FormData contents:');
        	for (const pair of submitFormData.entries()) {
        		console.log(pair[0], pair[1]);
        	}
        	
        	$.ajax({
        		url: "<%=contextPath%>/admin/product/regist",
        		type: "post",
        		data: submitFormData,
        		processData: false,
        		contentType: false,
        		success:(result, status, xhr)=>{
        			console.log(result);
        			alert('상품이 등록되었습니다.');
        			// 성공 후 폼 초기화 또는 리다이렉트
        			// window.location.href = "<%=contextPath%>/admin/product/list";
        		},
        		error:(xhr, status, error)=>{
        			console.log('Error:', xhr.responseText);
        			alert('등록 중 오류가 발생했습니다.');
        		}
        	});
        })

        // Image upload functionality
        function setupImageUpload(containerId, inputId) {
            const container = document.getElementById(containerId);
            const input = document.getElementById(inputId);
            const addButton = container.querySelector('.add-image-btn');

            // Click event for add button
            addButton.addEventListener('click', function(e) {
                e.preventDefault();
                input.click();
            });

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
				
				        // Create delete button
				        const deleteBtn = document
				                .createElement('button');
				        deleteBtn.className = 'btn btn-danger image-delete-btn';
				        deleteBtn.innerHTML = '<i class="fa fa-times"></i>';
				        deleteBtn.type = 'button';
				
				        // Delete button click event
				        deleteBtn.addEventListener('click', function(e) {
				                            e.preventDefault();
				                            // Remove image and delete button
				                            container
				                                    .removeChild(img);
				                            container
				                                    .removeChild(deleteBtn);
				                            // Show add button again
				                            addButton.style.display = 'flex';
				                            // Clear input
				                            input.value = '';
				                        });
				
				        // Hide add button and add image and delete button
				        addButton.style.display = 'none';
				        container.appendChild(img);
				        container.appendChild(deleteBtn);
				    };
				    reader.readAsDataURL(file);
				}
			});
        }

        // Setup image upload for all containers
        setupImageUpload('mainImageContainer', 'mainImageInput');
        setupImageUpload('subImage1', 'subImageInput1');
        setupImageUpload('subImage2', 'subImageInput2');
        setupImageUpload('subImage3', 'subImageInput3');
        setupImageUpload('subImage4', 'subImageInput4');
        setupImageUpload('subImage5', 'subImageInput5');
        
    </script>

</body>
</html>














