<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 
	pageParam은 각 페이지 별 .jsp 최상단에 init.jsp로 받아옵니다.
	따라서, init.jsp 이후에 sidebar.jsp가 작동하므로 문제되지 않습니다.
-->

<section class="sidebar">
	<div class="sidebar-container">
		<div class="sidebar-content">
			<div class="sidebar-content-container">
				<div class="sidebar-card">
					<h3>쇼핑</h3>
					<div class="sidebar-card-item">
						<a href="?page=order" class="<%= "order".equals(pageParam) ? "active" : "" %>">주문 / 배송 조회</a>
					</div>
					<div class="sidebar-card-item">
						<a href="?page=return" class="<%= "return".equals(pageParam) ? "active" : "" %>">취소 / 반품 / 교환 조회</a>
					</div>
				</div>
				<div class="sidebar-card">
					<h3>혜택</h3>
					<div class="sidebar-card-item">
						<a href="?page=point" class="<%= "point".equals(pageParam) ? "active" : "" %>">포인트</a>
					</div>
				</div>
				<div class="sidebar-card">
					<h3>활동</h3>
					<div class="sidebar-card-item">
						<a href="?page=review" class="<%= "review".equals(pageParam) ? "active" : "" %>">상품 후기</a>
					</div>
					<div class="sidebar-card-item">
						<a href="?page=qna" class="<%= "qna".equals(pageParam) ? "active" : "" %>">문의 내역</a>
					</div>
				</div>
				<div class="sidebar-card">
					<h3>나의 정보</h3>
					<div class="sidebar-card-item">
						<a href="?page=edit-mypage" class="<%= "edit-mypage".equals(pageParam) ? "active" : "" %>">회원정보 수정</a>
					</div>
					<div class="sidebar-card-item">
						<a href="?page=delivery-payment" class="<%= "delivery-payment".equals(pageParam) ? "active" : "" %>">배송지 / 환불계좌 관리</a>
					</div>
					<div class="sidebar-card-item">
						<a href="?page=cancel" class="<%= "cancel".equals(pageParam) ? "active" : "" %>">회원 탈퇴</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>