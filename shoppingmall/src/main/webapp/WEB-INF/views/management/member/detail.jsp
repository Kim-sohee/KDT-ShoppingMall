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
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- 회원정보 시작 -->
						<div class="card card-outline w-100">
							<div class="card-header">
								<h3>회원정보</h3>
							</div>
							<div class="card-body">
								<div class="d-flex flex-column">
									<div class="d-flex flex-row align-items-center">
										<p class="mb-0 mr-3 flex-1">이름</p>
										<div class="form-control flex-12" disabled>홍길동</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">SNS</p>
										<div class="form-control flex-12" disabled>홍길동</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">아이디</p>
										<div class="form-control flex-12" disabled>홍길동</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">이메일</p>
										<div class="form-control flex-12" disabled>홍길동</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">연락처</p>
										<div class="form-control flex-12" disabled>홍길동</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">포인트</p>
										<div class="form-control flex-12" disabled>홍길동</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">가입일</p>
										<div class="form-control flex-12" disabled>홍길동</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 회원정보 끝 -->
						<!-- 배송지 목록 시작 -->
						<div class="card card-outline w-100">
							<div class="card-header">
								<h3>배송지 목록</h3>
							</div>
							<div class="card-body">
								<div class="d-flex flex-column">
									<div class="d-flex flex-row align-items-center">
										<p class="mb-0 mr-3 flex-1">별칭 :</p>
										<div class="font-weight-bold flex-12">우리집</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-2">
										<p class="mb-0 mr-3 flex-1">수취인 :</p>
										<div class="flex-12">홍길동</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-2">
										<p class="mb-0 mr-3 flex-1">연락처 :</p>
										<div class="flex-12">010-1234-1234</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-2">
										<p class="mb-0 mr-3 flex-1">배송주소 :</p>
										<div class="flex-12">서울시 강남구 ~~동 1921-12 401호</div>
									</div>
								</div>
								<hr>

							</div>
						</div>
						<!-- 배송지 목록 끝 -->
						<!-- 주문, 문의, 반품 내역 시작 -->
						<div class="card card-outline w-100">
							<div class="card-body">
								<ul class="nav nav-tabs">
									<li class="nav-item"><summary class="nav-link active font-weight-bold">주문 내역</summary></li>
									<li class="nav-item"><summary class="nav-link">문의 내역</summary></li>
									<li class="nav-item"><summary class="nav-link">반품 내역</summary></li>
								</ul>
								<!-- 테이블 시작 -->
								<div id="table-wrapper" class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12">
											<table id="history-table" class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info">
											</table>
										</div>
									</div>
								</div>
								<!-- 테이블 끝 -->
							</div>
						</div>
						<!-- 주문, 문의, 반품 내역 끝 -->
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
    function createOrderHistoryTable(json) {
      // 헤더 정보 배열
      const headers = [
        { text: '대표 이미지', width: '120px', class: 'sorting sorting_asc', ariaSort: 'ascending' },
        { text: '상품명', class: 'sorting' },
        { text: '가격', class: 'sorting' },
        { text: '할인율', class: 'sorting' },
        { text: '재고', class: 'sorting' },
        { text: '카테고리', class: 'sorting' },
        { text: '연령', class: 'sorting' },
        { text: '등록일자', class: 'sorting' },
        { text: '비고', class: 'sorting' }
      ];

      // 테이블 헤드와 행 생성
      const $thead = $('<thead>');
      const $headerRow = $('<tr>');

      // 각 헤더 생성
      headers.forEach(header => {
        const thOptions = {
          class: header.class,
          tabindex: '0',
          'aria-controls': 'example2',
          rowspan: '1',
          colspan: '1',
          'aria-label': `${header.text}: activate to sort column ascending`,
          text: header.text
        };

        if (header.width) thOptions.width = header.width;
        if (header.ariaSort) thOptions['aria-sort'] = header.ariaSort;

        const $th = $('<th>', thOptions);
        $headerRow.append($th);
      });

      if (json) {

      } else {

      }

      $thead.append($headerRow);
      $("#history-table").html($thead);
    }

    function getOrderHistory() {
      $.ajax({
        url: "/admin/order/histoy/list",
        type: "get",
        success: (result, status, xhr) => {
          createOrderHistoryTable(result);
        },
        error: (xhr, status, error) => {
          createOrderHistoryTable();
        },
      })
    }
    function getInquiryHistory() {
      $.ajax({
        url: "/admin/order/inquiry/list",
        type: "get",
        success: (result, status, xhr) => { },
        error: (xhr, status, error) => { },
      })
    }
    function getReturnHistory() {
      $.ajax({
        url: "/admin/order/return/list",
        type: "get",
        success: (result, status, xhr) => { },
        error: (xhr, status, error) => { },
      })
    }
    //Date picker
    $("#reservationdate").datetimepicker({
      format: "YYYY-MM-DD",
      defaultDate: moment(),
    });

    $(document).ready(function () {
      // 페이지 로드 시 기본으로 주문내역 표시
      getOrderHistory();
      // summary 클릭 이벤트
      $('.nav-tabs .nav-link').on('click', function (e) {
        e.preventDefault(); // 기본 동작 방지

        // 클릭된 summary의 인덱스 가져오기
        var index = $('.nav-tabs .nav-link').index(this);
        switch (index) {
          case 0: getOrderHistory();
            break;
          case 1: getInquiryHistory();
            break;
          default: getReturnHistory();
            break;
        }
        // 모든 summary에서 active, font-weight-bold 클래스 제거
        $('.nav-tabs .nav-link').removeClass('active font-weight-bold');

        // 클릭된 summary에만 클래스 추가
        $(this).addClass('active font-weight-bold');
      });
    });
  </script>

</body>
</html>














