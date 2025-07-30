<%@ page contentType="text/html; charset=UTF-8"%>
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
								<li class="breadcrumb-item active">상품등록</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<section class="content">
				<div class="d-flex flex-row justify-content-end p-4">
					<button class="btn btn-primary">등록하기</button>
				</div>
				<div class="row p-4">
					<div class="card w-100">
						<div class="card-body">
							<div class="d-flex flex-column">
								<div class="d-flex flex-row">
									<div class="d-flex flex-column">
										<div>
											<div id="mainImageContainer" class="image-container main-image-container" style="position: relative; display: inline-block">
												<div class="add-image-btn" onclick="document.getElementById('mainImageInput').click()" style="width: 100%; height: 100%;">
													<i class="fa fa-plus"></i>
													<p>메인 이미지</p>
												</div>
											</div>
										</div>
										<div class="d-flex flex-row mt-2">
											<div id="subImage1" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
												<div class="add-image-btn" onclick="document.getElementById('subImageInput1').click()">
													<i class="fa fa-plus"></i>
												</div>
											</div>
											<div id="subImage2" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
												<div class="add-image-btn" onclick="document.getElementById('subImageInput2').click()">
													<i class="fa fa-plus"></i>
												</div>
											</div>
											<div id="subImage3" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
												<div class="add-image-btn" onclick="document.getElementById('subImageInput3').click()">
													<i class="fa fa-plus"></i>
												</div>
											</div>
											<div id="subImage4" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
												<div class="add-image-btn" onclick="document.getElementById('subImageInput4').click()">
													<i class="fa fa-plus"></i>
												</div>
											</div>
											<div id="subImage5" class="image-container ml-1 sub-image-container" style="position: relative; display: inline-block">
												<div class="add-image-btn" onclick="document.getElementById('subImageInput5').click()">
													<i class="fa fa-plus"></i>
												</div>
											</div>
											<input type="file" id="mainImageInput" style="display: none" accept="image/*" onchange="addMainImage(this)" /> <input type="file" id="subImageInput1" style="display: none" accept="image/*" onchange="addSubImage(this, 'subImage1')" /> <input type="file" id="subImageInput2" style="display: none" accept="image/*" onchange="addSubImage(this, 'subImage2')" /> <input type="file" id="subImageInput3" style="display: none" accept="image/*" onchange="addSubImage(this, 'subImage3')" /> <input type="file" id="subImageInput4" style="display: none" accept="image/*" onchange="addSubImage(this, 'subImage4')" /> <input type="file" id="subImageInput5" style="display: none" accept="image/*" onchange="addSubImage(this, 'subImage5')" />
										</div>
									</div>
									<div class="d-flex flex-column flex-grow-1">
										<div class="d-flex flex-row align-items-center">
											<p class="w-25 mb-0 text-right mr-3">상품명 :</p>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="상품명" />
										</div>
										<div class="d-flex flex-row align-items-center mt-2">
											<p class="w-25 mb-0 text-right mr-3">가격 :</p>
											<input type="number" class="form-control" id="exampleInputEmail1" placeholder="가격" />
										</div>
										<div class="d-flex flex-row align-items-center mt-2">
											<p class="w-25 mb-0 text-right mr-3">할인율 :</p>
											<input type="number" class="form-control" id="exampleInputEmail1" placeholder="할인율" />
										</div>
										<div class="d-flex flex-row align-items-center mt-2">
											<p class="w-25 mb-0 text-right mr-3">카테고리 :</p>
											<select class="custom-select">
												<option>option 1</option>
												<option>option 2</option>
												<option>option 3</option>
												<option>option 4</option>
												<option>option 5</option>
											</select>
										</div>
										<div class="d-flex flex-row align-items-center mt-2">
											<p class="w-25 mb-0 text-right mr-3">플레이시간 :</p>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="플레이시간" />
										</div>
										<div class="d-flex flex-row align-items-center mt-2">
											<p class="w-25 mb-0 text-right mr-3">난이도 :</p>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="난이도" />
										</div>
										<div class="d-flex flex-row align-items-center mt-2">
											<p class="w-25 mb-0 text-right mr-3">연령대 :</p>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="연령대" />
										</div>
										<div class="d-flex flex-row align-items-center mt-2">
											<p class="w-25 mb-0 text-right mr-3">인원수 :</p>
											<div class="d-flex align-items-center w-100">
												<div class="form-group d-flex align-items-center mb-0 mr-4">
													<label class="mb-0 mr-2">최소:</label> <input type="number" class="form-control" style="width: 80px" min="0" placeholder="최소" /> <span class="ml-1">명</span>
												</div>

												<span class="mx-2 text-muted">~</span>

												<div class="form-group d-flex align-items-center mb-0">
													<label class="mb-0 mr-2">최대:</label> <input type="number" class="form-control" style="width: 80px" min="0" placeholder="최대" /> <span class="ml-1">명</span>
												</div>
											</div>
										</div>
										<div class="d-flex flex-column ml-4 mt-4">
											<p class="mb-0 text-left h5 mb-3">상품소개</p>
											<div class="card">
												<div class="card-body">
													<textarea class="form-control" rows="8" placeholder="내용을 입력해주세요"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
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

		<!-- Control Sidebar -->
		<%//@ include file="../inc/right_bar.jsp" %>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<%@ include file="../inc/footer_link.jsp"%>
	<script src="/static/admin/custom/ProductImg.js"></script>
	<script>
    //Date picker
    $("#reservationdate").datetimepicker({
      format: "YYYY-MM-DD",
      defaultDate: moment(),
    });

    $("#summernote").summernote({
      placeholder: "내용을 입력해주세요",
      height: 500,
    });

    function addMainImage(input) {
      const container = document.getElementById("mainImageContainer");
      const file = input.files[0];

      if (file && file.type.startsWith("image/")) {
        const reader = new FileReader();

        reader.onload = function (e) {
          container.innerHTML = `
              <img src="${e.target.result}" alt="메인 이미지" style="width: 100%; height: 100%; object-fit: cover;">
              <button type="button" class="btn btn-block btn-light btn-sm image-delete-btn" onclick="deleteMainImage(this)">
                <i class="fa fa-times"></i>
              </button>
            `;
        };

        reader.readAsDataURL(file);
      }

      input.value = "";
    }

    function addSubImage(input, containerId) {
      const container = document.getElementById(containerId);
      const file = input.files[0];

      if (file && file.type.startsWith("image/")) {
        const reader = new FileReader();

        reader.onload = function (e) {
          container.innerHTML = `
              <img src="${e.target.result}" alt="서브 이미지" width="100%" height="100%" style="object-fit: cover;">
              <button type="button" class="btn btn-block btn-light btn-sm image-delete-btn" onclick="deleteSubImage(this, '${containerId}')">
                <i class="fa fa-times"></i>
              </button>
            `;
        };

        reader.readAsDataURL(file);
      }

      input.value = "";
    }

    function deleteMainImage(button) {
      if (confirm("메인 이미지를 삭제하시겠습니까?")) {
        button.parentElement.innerHTML = `
            <div
              class="add-image-btn"
              onclick="document.getElementById('mainImageInput').click()"
              style="width: 100%; height: 100%;"
            >
              <i class="fa fa-plus"></i>
              <p>메인 이미지</p>
            </div>
          `;
      }
    }

    function deleteSubImage(button, containerId) {
      if (confirm("이미지를 삭제하시겠습니까?")) {
        const inputId = containerId.replace('subImage', 'subImageInput');
        button.parentElement.innerHTML = `
            <div
              class="add-image-btn"
              onclick="document.getElementById('${inputId}').click()"
            >
              <i class="fa fa-plus"></i>
            </div>
          `;
      }
    }

  </script>

</body>
</html>














