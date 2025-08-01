<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 관리</title>
<%@ include file="../inc/head_link.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<%@ include file="../inc/preloader.jsp"%>


		<!-- Main Sidebar Container -->
		<%@ include file="../inc/left_bar.jsp"%>

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
								<li class="breadcrumb-item active">상품관리>상품등록</li>
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
					<div class="row justify-content-end pr-4">
						<a href="<%=contextPath%>/admin/product/registform"><button class="btn btn-primary">상품등록</button></a>
					</div>
					<div class="row p-4">
						<div class="card w-100">
							<div class="card-body">
								<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">전체</a></li>
										<li class="nav-item"><a class="nav-link" href="#">퍼즐</a></li>
										<li class="nav-item"><a class="nav-link" href="#">액션</a></li>
										<li class="nav-item"><a class="nav-link" href="#">가족</a></li>
										<li class="nav-item"><a class="nav-link" href="#">추리</a></li>
									</ul>	 
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
														<th class="sorting sorting_asc" tabindex="0" aria-controls="example2" width="120px" rowspan="1" colspan="1" aria-sort="ascending" aria-label="주문 번호: activate to sort column descending">대표 이미지</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="구매일자: activate to sort column ascending">상품명</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">가격</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">할인율</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">재고</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">카테고리</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">연령</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">등록일자</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">비고</th>
													</tr>
												</thead>
												<!-- 테이블 헤더 끝 -->
												<!-- 테이블 바디 시작 -->
												<tbody>
													<!-- 테이블 아이템 시작 -->
													<tr class="odd">
														<td class="dtr-control sorting_1 text-right align-middle" tabindex="0">
															<img src="./상품이미지.png" alt="상품이미지" width="120px" height="120px" />
														</td>
														<td class="text-right align-middle">
															<p class="font-weight-bold">사보타지</p>
														</td>
														<td class="text-right align-middle">20,000원</td>
														<td class="text-right align-middle">0%</td>
														<td class="text-right align-middle">200개</td>
														<td class="text-right align-middle">퍼즐게임</td>
														<td class="text-right align-middle">12세+</td>
														<td class="text-right align-middle">2025-06-17 20:23:17</td>
														<td class="text-right align-middle">
															<a href="<%=contextPath%>/admin/product/detail"><button type="button" class="btn btn-block btn-primary btn-sm">상세보기</button></a>
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
			format : "YYYY-MM-DD",
			defaultDate : moment(),
		});
	</script>

</body>
</html>














