<%@page import="shoppingmall.domain.OrderDetail"%>
<%@page import="shoppingmall.domain.OrderSummary"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%  OrderSummary orderSummary = (OrderSummary) request.getAttribute("orderSummary"); %>
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














