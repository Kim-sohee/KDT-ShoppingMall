<%@page import="shoppingmall.domain.Product"%>
<%@page import="shoppingmall.domain.Qna"%>
<%@page import="shoppingmall.domain.Delivery"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% Qna qna = (Qna) request.getAttribute("qna"); %>
<% Product product = qna.getProduct();%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 관리</title>
<%@ include file="../../inc/head_link.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<%@ include file="../../inc/preloader.jsp"%>


		<!-- Main Sidebar Container -->
		<%@ include file="../../inc/left_bar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">QnA</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item">QnA</li>
								<li class="breadcrumb-item active">상세보기</li>
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
					<div class="column">
						<div class="card card-outline">
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
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">난이도</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">등록일자</th>
														<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">비고</th>
													</tr>
												</thead>
												<!-- 테이블 헤더 끝 -->
												<!-- 테이블 바디 시작 -->
												<tbody>
													<!-- 테이블 아이템 시작 -->
													<% if(product != null) { %>
													<% String imageUrl = "";
													if(product != null && !product.getProductImages().isEmpty()){
														imageUrl = "/data/p_"+product.getProduct_id()+"/"+product.getProductImages().get(0).getFileName();
													} %>
													<tr class="odd">
														<td class="dtr-control sorting_1 text-right align-middle" tabindex="0">
															<img src="<%= imageUrl%>" alt="상품이미지" width="120px" height="120px" />
														</td>
														<td class="text-right align-middle">
															<p class="font-weight-bold"><%= product.getProduct_name() %></p>
														</td>
														<td class="text-right align-middle"><%= product.getPrice() %></td>
														<td class="text-right align-middle"><%= product.getDiscount_rate()%>%</td>
														<td class="text-right align-middle <% if(product.getProduct_quantity() <= 0) { out.print("text-danger");} %>"><%= product.getProduct_quantity()%></td>
														<td class="text-right align-middle"><%= product.getTheme().getTheme_name() %></td>
														<td class="text-right align-middle"><%= product.getAgeRange().getAge_min() %></td>
														<td class="text-right align-middle"><%= product.getDifficulty().getGame_level() %></td>
														<td class="text-right align-middle"><%= product.getRegdate() %></td>
														<td class="text-right align-middle">
															<a href="<%=contextPath%>/admin/product/detail?product_id=<%= product.getProduct_id()%>"><button type="button" class="btn btn-block btn-primary btn-sm">상세보기</button></a>
														</td>
													</tr>
													<% } else { %>
													<tr class="odd">
														<td colspan="10" class="text-center">상품 정보가 없습니다.</td>
													</tr>
													<% } %>
													<!-- 테이블 아이템 끝 -->
												</tbody>
												<!-- 테이블 바디 끝 -->
											</table>
						</div>
						<div class="d-flex flex-column card card-outline">
						 <div class="card-body">
                          <div class="d-flex flex-row justify-content-between ">
                            <div class="h3"><%= String.valueOf(qna.getTitle()) %></div>
                          </div>
                          <div><%= String.valueOf(qna.getMember().getMember_name()) %></div>
                          <hr>
                          <div><%= String.valueOf(qna.getContent()) %></div>
                          </div>
                        </div>
                        <div class="d-flex flex-column card card-outline">
                        <div id="comment-card-body" class="card-body">
								<%
								if(qna.getIs_commented() == 1) {
								%>
								<div class="d-flex flex-row justify-content-between">
									<div class="h5"><%=String.valueOf(qna.getComment_member())%></div>
								</div>
								<hr>
								<div><%=String.valueOf(qna.getComment())%></div>
								<hr>
								<div class="d-flex flex-row">
									<input id="submit-modify" type="button" onclick="onClickModify()" class="btn btn-primary" value="수정" />
									<input id="delete-comment" type="button" onclick="onClickDeleteComment()" class="btn btn-danger ml-2" value="삭제" />
								</div>
								<%
								} else {
								%>
								<div class="d-flex flex-row justify-content-between">
									
								</div>
								<hr>
								<textarea id="comment-area" class="w-100"></textarea>
								<hr>	
								<input id="submit-qna" type="button" onclick="onClickSubmit()" class="btn btn-primary" value="등록" />
								<%
								}
								%>
                          </div>
                        </div>
					</div>
				</div>
			</section>
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
		
		function onClickCancel(){
		    console.log('가');
		    const commentCardBody = $('#comment-card-body');
			commentCardBody.html(`
			        <div class="d-flex flex-row justify-content-between">
				<div class="h5"><%=String.valueOf(qna.getComment_member())%></div>
				</div>
				<hr>
				<div><%=String.valueOf(qna.getComment())%></div>
				<hr>
				<input id="submit-modify" type="button" onclick="onClickModify()" class="btn btn-primary" value="수정" />
			        `)
		}
		
		function onClickModify() {
		    const commentCardBody = $('#comment-card-body');
			commentCardBody.html(`
			    <div class="d-flex flex-row justify-content-between">
			        <div class="h5"><%=String.valueOf(qna.getComment_member())%></div>
				</div>
				<hr>
				<textarea id="comment-area" class="w-100"><%= qna.getComment() %></textarea>
				<hr>	
				<div class="d-flex flex-row">
					<input id="submit-qna" type="button" onclick="onClickSubmit()" class="btn btn-primary" value="등록" />
					<input id="cancel-modify" type="button" onclick="onClickCancel()" class="btn btn-danger ml-2" value="취소" />
				</div>
			`);
		}
		
		function onClickSubmit(){
			const isConfirm = <%= qna.getIs_commented()%> == 1;
			if(isConfirm){
				if(confirm('답변을 수정하시겠습니까?')){
				    postCommnet();
				}
			} else {
			    if(confirm('답변을 등록하시겠습니까?')){
			        postCommnet();
				}
			}
		}
		
		function onClickDeleteComment(){
		    if(confirm('답변을 삭제하시겠습니까?')){
		        deleteCommnet();
		    }
		}
		
		function postCommnet() {
			    $.ajax({
					url:"/admin/cs/qna/update",
					type:"post",
				  	contentType: "application/json",
				  	processData: true,
					data: JSON.stringify({
					      "qna_id": <%=qna.getQna_id()%>,
					      "is_commented": 1,
					      "comment_member": "관리자",
					      "comment": $('#comment-area').val()
					  }),
					success: (result, statues, xhr) => {
						if(result.result) {
							alert('답변등록에 성공하였습니다.');
							location.reload();
						}else {
						    alert('답변 등록에 실패하였습니다.');
						}
					},
					error: (xht, status, error) => {
				  	  alert('답변 등록에 실패하였습니다.');
					}
			    })
			}
		
		function deleteCommnet() {
		    $.ajax({
				url:"/admin/cs/qna/update",
				type:"post",
			  	contentType: "application/json",
			  	processData: true,
				data: JSON.stringify({
				      "qna_id": <%=qna.getQna_id()%>,
				      "is_commented": 0,
				      "comment_member": "",
				      "comment": "",
				  }),
				success: (result, statues, xhr) => {
					if(result.result) {
						alert('답변삭제에 성공하였습니다.');
						location.reload();
					}else {
					    alert('답변 삭제에 실패하였습니다.');
					}
				},
				error: (xht, status, error) => {
			  	  alert('답변 삭제에 실패하였습니다.');
				}
		    })
		}
  	</script>

</body>
</html>














