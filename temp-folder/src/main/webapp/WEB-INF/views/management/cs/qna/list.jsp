<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>
<%@ include file="../../inc/head_link.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="/static/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<%@ include file="../../inc/navbar.jsp"%>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="../../inc/left_bar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">상품 등록</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item ">고객센터</li>
								<li class="breadcrumb-item active">문의</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->


			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">

					<!-- 검색 필터 패널 시작 -->
					<div class="row justify-content-end pt-4 pr-4">
						<div class="d-flex">
							<ul class="pagination">
								<li class="paginate_button page-item active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">15일</a></li>
								<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">1개월</a></li>
								<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0" class="page-link">3개월</a></li>
								<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0" class="page-link">6개월</a></li>
								<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0" class="page-link">12개월</a></li>
							</ul>

							<div class="form-group ml-2">
								<div class="input-group date" id="reservationdate" data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input" data-target="#reservationdate" />
									<div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>
							<div class="input-group ml-2" style="width: 280px">
								<input type="search" class="form-control" placeholder="검색어를 입력해주세요" />
								<div class="input-group-append">
									<button type="submit" class="btn btn-default search-btn">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 검색 필터 패널 끝 -->
					<div class="row p-4">
						<div class="card w-100">
							<div class="card-body">
								<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12 col-md-6"></div>
										<div class="col-sm-12 col-md-6"></div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<table id="example2" class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info">
												<!-- 테이블 헤더 시작 -->
												<thead>
													<tr>
														<th class="sorting sorting_asc" tabindex="0" aria-controls="example2" width="120px" rowspan="1" colspan="1" aria-sort="ascending" aria-label="아이디: activate to sort column descending">답변상태</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="구매일자: activate to sort column ascending">제목</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">작성자</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">비고</th>
													</tr>
												</thead>
												<!-- 테이블 헤더 끝 -->
												<!-- 테이블 바디 시작 -->
												<tbody>
													<!-- 테이블 아이템 시작 -->
													<tr class="odd">
														<td class="dtr-control sorting_1 text-right align-middle" tabindex="0">답변대기</td>
														<td class="text-right align-middle">이 제품 어디 원산지 인가요?</td>
														<td class="text-right align-middle">testuser</td>
														<td class="text-right align-middle">
															<button type="button" class="btn btn-block btn-primary btn-sm">상세보기</button>
														</td>
													</tr>
													<!-- 테이블 아이템 끝 -->
												</tbody>
												<!-- 테이블 바디 끝 -->
											</table>
										</div>
									</div>
									<div class="row justify-content-between">
										<div class="col-sm-12 col-md-auto">
											<div class="dataTables_info" id="example2_info" role="status" aria-live="polite">총 57 페이지</div>
										</div>
										<div class="col-sm-12 col-md-auto">
											<div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
												<ul class="pagination">
													<li class="paginate_button page-item previous disabled" id="example2_previous"><a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
													<li class="paginate_button page-item active"><a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
													<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
													<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
													<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
													<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
													<li class="paginate_button page-item"><a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0" class="page-link">6</a></li>
													<li class="paginate_button page-item next" id="example2_next"><a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="../../inc/footer.jsp"%>

		<!-- Control Sidebar -->
		<%//@ include file="../inc/right_bar.jsp" %>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<%@ include file="../../inc/footer_link.jsp"%>
	<script src="/static/admin/custom/ProductImg.js"></script>
	<script>
	function printCategory(obj, list){
		let tag="<option value='0'>카테고리 선택</option>";
		
		for(let i=0;i<list.length;i++){
			if(obj=="#topcategory"){
				tag+="<option value='"+list[i].topcategory_id+"'>"+list[i].top_name+"</option>";
			}else if(obj=="#subcategory"){
				tag+="<option value='"+list[i].subcategory_id+"'>"+list[i].sub_name+"</option>";
			}else if(obj=="#color"){
				tag+="<option value='"+list[i].color_id+"'>"+list[i].color_name+"</option>";
			}else if(obj=="#size"){
				tag+="<option value='"+list[i].size_id+"'>"+list[i].size_name+"</option>";
			}
		}
		
		$(obj).html(tag);  // innerHTML=태그 동일
	}
	
	//비동기 방식으로 서버에 요청을 시도하여, 데이터 가져오기 
	function getTopCategory(){
		$.ajax({
			url:"/admin/admin/topcategory/list",
			type:"get",
			success:function(result, status, xhr){ //200번대의 성공 응답 시, 이 함수 실행
				console.log("서버로부터 받은 결과는 ", result);
				//화면에 출력하기 
				printCategory("#topcategory",result);
			},
			error:function(xhr, status, err){
			}
		});
	}
	
	function getSubCategory(topcategory_id){
		$.ajax({
			url :"/admin/admin/subcategory/list?topcategory_id="+topcategory_id,
			type:"get",
			success:function(result, status, xhr){
				console.log(result);
				printCategory("#subcategory",result);
			}
		});
	}
	
	function getColorList(){
		$.ajax({
			url:"/admin/admin/color/list",
			type:"get",
			success:function(result, status, xhr){
				printCategory("#color", result);
			}
		});
	}
	
	function getSizeList(){
		$.ajax({
			url:"/admin/admin/size/list",
			type:"get",
			success:function(result, status, xhr){
				printCategory("#size", result);
			}
		});
	}

	//크롬브라우저에서 지원하는 e.target.files 유사 배열은 읽기전용 이라서, 
	//개발자가 쓰기 가 안되므로, 배열을 하나 선언하여,담아서 처리
	//주의) 아래의 배열은, 개발자가 정의한 배열일 뿐이지, form태그가 전송할 컴포넌트는 아니므로, 
	//submit 시, selectedFile에 들어있는 파일을 전송할 수는 없다!!!
	//해결책? form태그에 인식을 시켜야 한다.. (javascript로 프로그래밍적 formData 객체를 사용해야 함)
	let selectedFile=[];
	
	function regist(){
		const formData = new FormData(document.getElementById("form1"));
		for(let i = 0; i < selectedFile.length; i++) {
			formData.append("photo", selectedFile[i]);			
		}
		$.ajax({
			url: "/admin/admin/product/regist",
			type: "post",
			data: formData,
			processData:false,
			contentType:false,
			success: (result, status, xhr)=>{
				console.log(result);
			},
			error: (xhr, status, error) => {
				console.log(error);
			}
		});
	}
	   
	$(()=>{
	   $('#summernote').summernote({
		height:200,
		placeholder:"상품 상세 설명을 채우세요"
	   });
	   getTopCategory(); //상위 카테고리 가져오기 
	   getColorList(); //색상 목록 가져오기 
	   getSizeList(); //사이즈 목록 가져오기 
	   

	   
	   //상위 카테고리의 값을 변경시, 하위 카테고리 가져오기 
	   $("#topcategory").change(function(){
			getSubCategory($(this).val());
		});
	   
	   
	   //파일 컴포넌트의 값 변경 시 이벤트 연결 
	   $("#photo").change(function(e){
			console.log(e);
			//e.target.files 안에는 브라우저가 읽어들인, 파일의 정보가 배열유사 객체인 FileList에 담겨져 있다.
			
			let files=e.target.files;//배열 유사 객체 얻기
			
			// 기존 배열 초기화 후 새로 선택된 파일들만 추가
			selectedFile = [];
			
			//첨부된 파일 수 만큼 반복
			for(let i=0;i<files.length;i++){
				selectedFile.push(files[i]); //배열에 파일 추가
				
				//파일을 읽기위한 스트림 객체 생성 
				const reader = new FileReader();
				
				reader.onload=function(e){ //파일을 스트림으로 읽어들인 정보가 e에 들어있음 
					console.log("읽은 결과 ", e);		
					
					//개발자 정의 클래스 인스턴스 생성 container, src, width, height 
					let productImg = new ProductImg(document.getElementById("preview"), files[i]  ,e.target.result, 100,100);
				}				
				reader.readAsDataURL(files[i]); //지정한 파일을 읽기
			}
	   });
	   
	   //등록버튼 이벤트 연결 
	   $("#bt_regist").click(()=>{		
			regist();
	   });
	   $("#bt_list").click(()=>{		
		   location.href = "/admin/admin/product/list";
	   });
	   
	   
	});
	</script>

</body>
</html>














