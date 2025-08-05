<%@page import="shoppingmall.domain.Delivery"%>
<%@page import="shoppingmall.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% Member member = (Member) request.getAttribute("member"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SinseBoardGame | 회원상세</title>
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
							<h1 class="m-0">회원상세</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item">회원관리</li>
								<li class="breadcrumb-item active">회원상세</li>
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
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getMember_name())%></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">SNS</p>
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getSns_provider())%></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">아이디</p>
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getId())%></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">이메일</p>
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getEmail())%></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">연락처</p>
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getPhone())%></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">포인트</p>
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getPoint_remained())%>p</div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">가입일</p>
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getJoined_at())%></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-1">
										<p class="mb-0 mr-3 flex-1">주소</p>
										<div class="form-control flex-12" disabled><%= String.valueOf(member.getDefault_address())%></div>
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
							<% for(int i = 0; i < member.getDeliveryList().size(); i++) {
								Delivery delivery = member.getDeliveryList().get(i);%>
								<div class="d-flex flex-column">
									<div class="d-flex flex-row align-items-center">
										<p class="mb-0 mr-3 flex-1">별칭 :</p>
										<div class="font-weight-bold flex-12"><%= String.valueOf(delivery.getAddress_alias()) %></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-2">
										<p class="mb-0 mr-3 flex-1">수취인 :</p>
										<div class="flex-12"><%= String.valueOf(delivery.getReceiver_name()) %></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-2">
										<p class="mb-0 mr-3 flex-1">연락처 :</p>
										<div class="flex-12"><%= String.valueOf(delivery.getReceiver_phone()) %></div>
									</div>
									<div class="d-flex flex-row align-items-center mt-2">
										<p class="mb-0 mr-3 flex-1">배송주소 :</p>
										<div class="flex-12"><%= String.valueOf(delivery.getAddress()) %></div>
									</div>
								</div>
								<hr>
							<% } %>
							</div>
						</div>
						<!-- 배송지 목록 끝 -->
						<!-- 주문, 문의, 반품 내역 시작 -->
						<div class="card card-outline w-100">
							<div class="card-body">
								<ul class="nav nav-tabs">
									<li class="nav-item"><summary class="nav-link active font-weight-bold">주문 내역</summary></li>
									<li class="nav-item"><summary class="nav-link">문의 내역</summary></li>
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
        { text: '주문번호', width: '120px', class: 'sorting sorting_asc', ariaSort: 'ascending' },
        { text: '구매일자', class: 'sorting' },
        { text: '총 결제금액', class: 'sorting' },
        { text: '결제수단', class: 'sorting' },
        { text: '회원', class: 'sorting' },
        { text: '상태', class: 'sorting' },
        { text: '비고', class: 'sorting' },
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

      const $tbody = $('<tbody>');
      
      if (json) {
        for(let i = 0; i < json.length; i++) {
          const order = json[i];
          const $bodyRow = $('<tr class="odd">');
          
          $bodyRow.append($('<td class="dtr-control sorting_1 text-right" tabindex="0">').text(order.order_summary_id));
          $bodyRow.append($('<td class="text-right">').text(order.ordered_at));
          $bodyRow.append($('<td class="text-right">').text(order.total_price + '원'));
          $bodyRow.append($('<td class="text-right">').text(order.payment_type));
          $bodyRow.append($('<td class="text-right">').text(order.member.member_name));
          
          let buttonClass = 'btn-primary';
          switch(order.status.status_id) {
            case 1: buttonClass = 'btn-secondary'; break;
            case 2: buttonClass = 'btn btn-light'; break;
            case 3: buttonClass = 'btn-dark'; break;
            case 4: buttonClass = 'btn btn-info'; break;
            case 5: buttonClass = 'btn-success'; break;
            case 6: buttonClass = 'btn-danger'; break;
            default: buttonClass = 'btn-warning'; break;
          }
          
          const $statusCell = $('<td class="text-right">');
          $statusCell.append($('<button type="button" class="btn btn-block ' + buttonClass + ' btn-sm">').text(order.status.status_name));
          $bodyRow.append($statusCell);
          
          const $actionCell = $('<td class="text-right">');
          const $detailLink = $('<a href="/admin/order/history/detail?order_summery_id=' + order.order_summary_id + '">');
          $detailLink.append($('<button type="button" class="btn btn-block btn-primary btn-sm">').text('상세보기'));
          $actionCell.append($detailLink);
          $bodyRow.append($actionCell);
          
          $tbody.append($bodyRow);
        }
      }

      $thead.append($headerRow);
      const $table = $('<table>').append($thead).append($tbody);
      $("#history-table").html($table.html());
    }

    function getOrderHistory() {
      $.ajax({
        url: "/admin/order/history/list?member_id=<%= member.getMember_id()%>",
        type: "get",
        success: (result, status, xhr) => {
			/* console.log(result); */
			const json = JSON.parse(result);
          	createOrderHistoryTable(json);
        },
        error: (xhr, status, error) => {
            console.log(error);
          	createOrderHistoryTable();
        },
      })
    }
    function createQnaHistoryTable(json) {
      // 헤더 정보 배열
      const headers = [
        { text: '답변상태', width: '120px', class: 'sorting sorting_asc', ariaSort: 'ascending' },
        { text: '제목', class: 'sorting' },
        { text: '작성자', class: 'sorting' },
        { text: '상품명', class: 'sorting' },
        { text: '비고', class: 'sorting' },
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

      const $tbody = $('<tbody>');
      
      if (json) {
        for(let i = 0; i < json.length; i++) {
          const qna = json[i];
          const $bodyRow = $('<tr class="odd">');
          
          let statusText = '답변대기';
          if (qna.is_commented == 1) {
            statusText = '답변완료';
          }
          
          $bodyRow.append($('<td class="dtr-control sorting_1 text-right align-middle" tabindex="0">').text(statusText));
          $bodyRow.append($('<td class="text-right align-middle">').text(qna.content));
          $bodyRow.append($('<td class="text-right align-middle">').text(qna.member.member_name));
          $bodyRow.append($('<td class="text-right align-middle">').text(qna.product.product_name));
          
          const $actionCell = $('<td class="text-right align-middle">');
          const $detailLink = $('<a href="/admin/cs/qna/detail?qna_id=' + qna.qna_id + '">');
          $detailLink.append($('<button type="button" class="btn btn-block btn-primary btn-sm">').text('상세보기'));
          $actionCell.append($detailLink);
          $bodyRow.append($actionCell);
          
          $tbody.append($bodyRow);
        }
      }

      $thead.append($headerRow);
      const $table = $('<table>').append($thead).append($tbody);
      $("#history-table").html($table.html());
    }

    function getQnAHistory() {
      $.ajax({
        url: "/admin/cs/qna/list?member_id=<%= member.getMember_id()%>",
        type: "get",
        success: (result, status, xhr) => {
          const json = JSON.parse(result);
          createQnaHistoryTable(json);
        },
        error: (xhr, status, error) => {
          console.log(error);
          createQnaHistoryTable();
        },
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
          default : getQnAHistory();
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














