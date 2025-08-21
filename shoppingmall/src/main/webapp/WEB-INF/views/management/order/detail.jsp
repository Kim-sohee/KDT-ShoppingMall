<%@page import="shoppingmall.domain.Status"%>
<%@page import="java.util.List"%>
<%@page import="shoppingmall.domain.OrderDetail"%>
<%@page import="shoppingmall.domain.OrderSummary"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%! public String getButtonClassName(int stsatusId) {
	String buttonClass = "btn-primary";
    switch(stsatusId) {
      case 1: buttonClass = "btn-secondary"; break;
      case 2: buttonClass = "btn-light"; break;
      case 3: buttonClass = "btn-dark"; break;
      case 4: buttonClass = "btn-info"; break;
      case 5: buttonClass = "btn-success"; break;
      case 6: buttonClass = "btn-danger"; break;
      default: buttonClass = "btn-warning"; break;
    }
    return buttonClass;
}	 %>
<%  OrderSummary orderSummary = (OrderSummary) request.getAttribute("orderSummary"); %>
<% 	List<Status> statusList = (List<Status>) request.getAttribute("statusList"); %>
<%  int totalPrice = 0; %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SinseBoardGame | 주문상세</title>
<%@ include file="../inc/head_link.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<%@ include file="../inc/preloader.jsp"%>

		<!-- Main Sidebar Container -->
		<%@ include file="../inc/left_bar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<div class="p-3">
				<!-- 주문내역 상품 카드 시작 -->
				<div class="d-flex flex-column">
					<div class="card card-outline">
						<div class="cart-body">
						<div class="h5 mt-4 ml-4">주문 상태 변경 </div>
								<div class="btn-group p-4">
								
									<button id="current-status" data-status="<%= orderSummary.getStatus().getStatus_id() %>" type="button" class="btn <%= getButtonClassName(orderSummary.getStatus().getStatus_id())%> dropdown-toggle" style="width: 220px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= orderSummary.getStatus().getStatus_name() %></button>
									<div class="dropdown-menu pr-2 pl-2" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
										<% for(int i = 0; i < statusList.size(); i++) {
											Status status = statusList.get(i);
											%>
										<button type="button" class="btn <%= getButtonClassName(status.getStatus_id()) %>" style="width: 200px;" onclick="onClickStatus('<%= status.getStatus_name()%>',<%= status.getStatus_id()%>)"><%= status.getStatus_name()%></button>
										<div class="dropdown-divider"></div>
										<% } %>
									</div>
								</div>
						</div>
					</div>
					<div class="card card-outline">
						<div class="card-header">
							<p class="h2">주문 상품</p>
						</div>
						<div class="card-body">
						<% for(int i = 0; i < orderSummary.getOrderDetailList().size(); i++) { 
								OrderDetail orderDetail = orderSummary.getOrderDetailList().get(i);
								totalPrice += (int)((orderDetail.getProductSnapshot().getPrice() - (orderDetail.getProductSnapshot().getPrice() * (orderDetail.getProductSnapshot().getDiscount_rate()/(float)100))) * orderDetail.getQuantity_real());
						%>
						
							<!-- 상품 아이템 시작-->
							<div class="d-flex">
								<img src="./상품이미지.png" alt="" />
								<div class="d-flex flex-column ml-3 justify-content-between">
									<p class="h3"><%= orderDetail.getProductSnapshot().getProduct_name() %></p>
									<p class="font-weight-bold text-lg" style="color: brown"><%= orderDetail.getProductSnapshot().getDiscount_rate() %>%</p>
									<p class="font-weight-bold">
										수량 : <span><%= orderDetail.getQuantity_real() %></span>개
									</p>
									<p style="color: lightslategray"><%= orderSummary.getOrdered_at() %> 주문</p>
									<% if(orderDetail.getProductSnapshot().getDiscount_rate() > 0) { %>
										<p class="h5"style="color: lightslategray"><del><%= orderDetail.getProductSnapshot().getPrice() %>원</del></p>
									<% } %>
									<p class="h4"><%= (int)((orderDetail.getProductSnapshot().getPrice() - (orderDetail.getProductSnapshot().getPrice() * (orderDetail.getProductSnapshot().getDiscount_rate()/(float)100)))) %>원</p>
								</div>
							</div>
							<!-- 상품 아이템 끝 -->
							<hr />
							<% } %>
							<div>
							<p>포인트 사용 : <span class="h4 font-weight-bold"><%= orderSummary.getPoint_used() %>p</span></p>
							</div>
							<hr />
							<div class = "h3">결제 금액 : <%=totalPrice - orderSummary.getPoint_used() %>원</div>
						</div>
					</div>
				</div>
				<!-- 주문내역 상품 카드 끝 -->
				<!-- 배송 정보 시작-->
				<div class="card card-outline">
					<div class="card-header">
						<p class="h2">배송정보</p>
					</div>
					<div class="card-body">
						<div class="d-flex flex-column">
							<div class="d-flex flex-column">
								<p class="h4">수령자</p>
								<input type="text" class="form-control" id="exampleInputEmail1" value="<%= orderSummary.getDelivery().getReceiver_name() %>" readonly />
							</div>
							<div class="d-flex flex-column">
								<p class="h4 mt-3">연락처</p>
								<input type="text" class="form-control" id="exampleInputEmail1" value="<%= orderSummary.getDelivery().getReceiver_phone() %>" readonly />
							</div>
							<div class="d-flex flex-column">
								<p class="h4 mt-3">배송지</p>
								<input type="text" class="form-control" id="exampleInputEmail1" value="<%= orderSummary.getDelivery().getAddress()%>" readonly />
							</div>
						</div>
					</div>
				</div>
				<!-- 배송정보 끝 -->

				<!-- 배송 추적 내역 시작 -->
				<div class="card card-outline">
					<div class="card-header">
						<p class="h2">배송 추적</p>
					</div>
					<div class="card-body">
						<div class="timeline">
							<!-- timeline time label -->
							<div class="time-label">
								<span class="bg-blue">2025. 06. 11 </span>
							</div>
							<!-- /.timeline-label -->
							<!-- timeline item -->
							<div>
								<i class="fas bg-green"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<span class="text-primary font-weight-bold">택배사</span> 배송 완료
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<span class="text-primary font-weight-bold">택배사</span> 배송 출발
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<span class="text-primary font-weight-bold">택배사</span> 입고
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<span class="text-primary font-weight-bold">구로 hub</span> 출고
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<a href="#">구로 hub</a> 입고
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline time label -->
							<div class="time-label">
								<span class="bg-green">2025. 06. 10 </span>
							</div>
							<!-- /.timeline-label -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<a href="#">택배사</a> 출고
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<a href="#">택배사</a> 입고
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<a href="#">판매자</a> 택배사 상품 전달
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<!-- timeline item -->
							<div>
								<i class="fas"></i>
								<div class="timeline-item">
									<span class="time"><i class="fas fa-clock"></i> 2025-06-10 20:20:10</span>
									<h3 class="timeline-header no-border">
										<a href="#">판매자</a> 상품 준비
									</h3>
								</div>
							</div>
							<!-- END timeline item -->
							<div>
								<i class="fas bg-blue"></i>
							</div>
						</div>
					</div>
				</div>
				<!-- 배송 추적 내역 끝 -->
			</div>
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
		function onClickStatus(statusName, statusId){
			if(confirm( '주문 상태를 "' + statusName +'"으로 변경하시겠습니까?')) {
				if(<%= orderSummary.getStatus().getStatus_id()%> == statusId) {
					alert('같은 상태로 설정 할 수 없습니다.');
				} else {
			    	changeOrderStatus(statusName, statusId);
				}
			}
		}
	  	
		function changeOrderStatus(statusName, statusId) {	
		       
			$.ajax({
				url:"/admin/order/status/update",
				type:"post",
				data: {
					"order_summery_id": <%= orderSummary.getOrder_summary_id()%>,
					"status_id": statusId
				},
				success: (result, status, xhr)=>{
					if(result.result){
						alert('주문상태 변경에 성공하였습니다.');
						$('#current-status').removeClass("<%= getButtonClassName(orderSummary.getStatus().getStatus_id())%>");
						$('#current-status').addClass(getButtonClassName(statusId));
						$('#current-status').text(statusName);	 
					} else {
						alert('주문상태 변경에 실패하였습니다.')
					}
				},
				error: (xhr, status, error)=>{
					alert('주문상태 변경에 실패하였습니다.')
				}
			})

		}
		
		function getButtonClassName(statusId){
			let buttonClass = 'btn-primary';
	          switch(statusId) {
	            case 1: buttonClass = 'btn-secondary'; break;
	            case 2: buttonClass = 'btn-light'; break;
	            case 3: buttonClass = 'btn-dark'; break;
	            case 4: buttonClass = 'btn-info'; break;
	            case 5: buttonClass = 'btn-success'; break;
	            case 6: buttonClass = 'btn-danger'; break;
	            default: buttonClass = 'btn-warning'; break;
	          }	
	          return buttonClass;
		}
	</script>

</body>
</html>














