<%@page import="shoppingmall.domain.OrderSummary"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>SinseBoardGame | 메인</title>
	
	<%@ include file="./inc/head_link.jsp" %>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/static/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Main Sidebar Container -->
	<%@ include file="./inc/left_bar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">대시보드</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-4 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3 id="new-order-val">0</h3>

                <p>새로운 주문</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="/admin/order/history/listpage" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-4 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3 id="wati-reply-qna">0건</h3>

                <p>답변대기 문의</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="/admin/cs/qna/listpage" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-4 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3 id="total-member-count">0</h3>

                <p>가입자 수</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="/admin/member/listpage" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
        </div>
        <!-- /.row -->
        <div class="col-lg-12 card card-outline"> 
        	<div class="card-body h5"> 누적 매출 금액  :  <span id="sale-ammount" class="h2 font-weight-bold">1000원</span></div>
         </div>
        <!-- Main row -->
        <div class="row">
						<!-- Left col -->
						<section class="col-lg-6 connectedSortable">
							<div class="card card-info">
								<div class="card-header">
									<h3 class="card-title">지난1년 테마별 판매 실적</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool" data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool" data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div class="chart">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="lineChart-theme" style="min-height: 250px; height: 250px; max-height: 400px; max-width: 100%; display: block; width: 390px;" width="780" height="500" class="chartjs-render-monitor"></canvas>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
						</section>
						<!-- /.Left col -->
							<section class="col-lg-6 connectedSortable">
							<div class="card card-danger">
								<div class="card-header">
									<h3 class="card-title">지난1년 월별 매출</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool" data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool" data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<div class="chart">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="lineChart-sales" style="min-height: 250px; height: 250px; max-height: 400px; max-width: 100%; display: block; width: 390px;" width="780" height="500" class="chartjs-render-monitor"></canvas>
									</div>
								</div>
								<!-- /.card-body -->
							</div>
							</section>
					</div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<%@ include file="./inc/footer.jsp" %>

  <!-- Control Sidebar -->
	<%//@ include file="./inc/right_bar.jsp" %>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
	<%@ include file="./inc/footer_link.jsp" %>
	<!-- AdminLTE for demo purposes -->
	<script src="/static/admin/dist/js/demo.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="/static/admin/dist/js/pages/dashboard.js"></script>
	
	<script>
	  $.widget.bridge('uibutton', $.ui.button)
	  
	  	function setChart(id,data){
	      	const labels = [];
	      	const dataSets = [];
	      	// 고정 색상 20개 배열
	      	const fixedColors = [
	      		'#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF',
	      		'#FF9F40', '#FF6384', '#C9CBCF', '#4BC0C0', '#FF6384',
	      		'#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40',
	      		'#E7E9ED', '#71B37C', '#8E5EA2', '#3E95CD', '#C45850'
	      	];
			for(let i = 0; i < data.length; i++) {
				const row = data[i];
				if(i == 0) {
					const labelArr = JSON.parse(row.metadata);
					console.log(labelArr);
					labels.push(...labelArr);
					console.log(labels);
				}				    
				const rowObj = {};
				rowObj.label = row.label;
				rowObj.data = JSON.parse(row.data);
				rowObj.fill = false;
				rowObj.tension = 0.1;
				// 순서대로 고정 색상 적용
				const colorIndex = i % fixedColors.length;
				rowObj.borderColor = fixedColors[colorIndex];
				rowObj.backgroundColor = fixedColors[colorIndex] + '20'; // 투명도 추가
				dataSets.push(rowObj);
			}
			let areaChartData = {
		                   labels: labels,
		                   datasets: dataSets,
		                 };
				
			var lineChartCanvas = $(id).get(0).getContext('2d')
	    	        var lineChartData = areaChartData	    	     
	    	        var lineChart = new Chart(lineChartCanvas, {
	    	            type : 'line',
	    	            data : lineChartData,
	    	        })
	  	}
				    	
        $(()=>{
            $.ajax({
				url: "/admin/statistics/theme/pastyear",
				type: "get",
				success: (result, status, xhr) => {
					const statisticsData = JSON.parse(result.data);
					console.log(statisticsData);
					setChart('#lineChart-theme',statisticsData);
				},
				error: (xhr, status, error) =>{

				}
            })
            
             $.ajax({
				url: "/admin/statistics/sales/pastyear",
				type: "get",
				success: (result, status, xhr) => {
					const statisticsData = JSON.parse(result.data);
					console.log(statisticsData);
					setChart('#lineChart-sales',statisticsData);
				},
				error: (xhr, status, error) =>{

				}
            })
            
            $.ajax({
				url: "/admin/statistics/sales/totalamount",
				type: "get",
				success: (result, status, xhr) => {
					$('#sale-ammount').text(result.data + "원");					
				},
				error: (xhr, status, error) =>{

				}
            })
            
             $.ajax({
				url: "/admin/order/history/neworders",
				type: "get",
				success: (result, status, xhr) => {
					$('#new-order-val').html(result.data + `<sup style="font-size: 20px">건</sup>`);					
				},
				error: (xhr, status, error) =>{

				}
            })
            $.ajax({
				url: "/admin/member/total",
				type: "get",
				success: (result, status, xhr) => {
					$('#total-member-count').html(result.data + `<sup style="font-size: 20px">명</sup>`);					
				},
				error: (xhr, status, error) =>{

				}
            })
             $.ajax({
				url: "/admin/cs/qna/waitreply",
				type: "get",
				success: (result, status, xhr) => {
					$('#wati-reply-qna').html(result.data + `<sup style="font-size: 20px">건</sup>`);					
				},
				error: (xhr, status, error) =>{

				}
            })
        })
    </script>
</body>
</html>














