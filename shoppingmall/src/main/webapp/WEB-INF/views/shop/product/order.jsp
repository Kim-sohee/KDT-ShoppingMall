<%@page import="shoppingmall.domain.ProductImage"%>
<%@page import="shoppingmall.domain.Cart"%>
<%@page import="shoppingmall.domain.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Member member = (Member) request.getAttribute("member");
    if (member == null) {
        response.sendRedirect("/shop/member/loginform");
        return;
    }

    List<Cart> cart_items = (List<Cart>) request.getAttribute("orderItems");

    int totalPrice = 0;
    for (Cart cart : cart_items) {
        if (cart.getProduct() != null) {
            totalPrice += cart.getProduct().getPrice() * cart.getQuantity();
        } else {
            out.println("⚠️ 경고: cart_id=" + cart.getCart_id() + " 의 상품이 존재하지 않습니다.<br>");
        }
    }

    int discount = 10000;
    int deliveryFee = totalPrice >= 50000 ? 0 : 3000;
    int finalAmount = totalPrice - discount + deliveryFee;

    int point = member.getPoint_remained();
    int usedPoint = 0;
    int finalAfterPoint = finalAmount - usedPoint;
    int pointAfter = point - usedPoint;

    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보드게임</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/shop/styles/order.css">
    <link rel="stylesheet" href="/static/shop/styles/footer.css">
</head>
<body>
<%@ include file="../../shop/inc/header.jsp" %>
<%@ include file="../../shop/inc/nav.jsp" %>

<main class="main-content">
    <div class="container">
        <div class="breadcrumb">
            <a href="index.html">홈</a> <span>></span> <span>주문/결제</span>
        </div>

        <div class="order-header">
            <h1>주문/결제</h1>
            <div class="order-steps">
                <div class="step"><span class="step-number">1</span><span class="step-text">장바구니</span></div>
                <div class="step active"><span class="step-number">2</span><span class="step-text">주문/결제</span></div>
                <div class="step"><span class="step-number">3</span><span class="step-text">주문완료</span></div>
            </div>
        </div>

        <div class="order-layout">
            <div class="order-items-wrapper">

                <!-- 배송지 등록 시작 -->
                <div class="order-items">
                    <div class="order-delivery">
                        <label>배송지</label>
                        <div class="delivery-info">
                            <h3><%= member.getMember_name() %>님</h3>
                            <p class="delivery-info-tel"><%= member.getPhone() %></p>
                            <div class="delivery-info-adress">
                                <span class="adress-value"><%= member.getDefault_address() %></span>
                                <span class="adress-port">(우편번호: 입력 필요)</span>
                            </div>
                            <div class="delivery-actions">
                                <button class="btn-delivery-adress" id = "change-delivery-address">배송지 변경</button>
                            </div>
                        </div>
                        <select class="delivery-select">
                            <option selected>추가 요청 사항을 등록해주세요</option>
                            <option>문 앞에 놓아주세요</option>
                            <option>부재 시 경비실에 맡겨주세요</option>
                            <option>배송 전에 연락주세요</option>
                            <option>택배함에 넣어주세요</option>
                            <option>직접입력</option>
                        </select>
                    </div>
                </div>
                <!-- 배송지 등록 끝 -->

                <!-- 주문 상품 리스트 시작 -->
                <div class="order-items">
                    <div class="order-item-list">
                        <label>주문 상품</label>
                        <% for (Cart cart : cart_items) {
                            if (cart.getProduct() == null) continue;

                            String title = cart.getProduct().getProduct_name();
                            int price = cart.getProduct().getPrice();
                            int quantity = cart.getQuantity();
                            List<ProductImage> images = cart.getProduct().getProductImages();
                            String thumbnail = (images != null && !images.isEmpty()) ? images.get(0).getFileName() : null;
                            String imageSrc = (thumbnail != null && !thumbnail.isEmpty())
                                ? contextPath + "/data/p_"+ cart.getProduct().getProduct_id()+"/"+ thumbnail
                                : contextPath + "/static/img/noimage.png";
                        %>
                        <div class="order-item" data-cart-id="<%= cart.getCart_id() %>">
                            <div class="item-image">
                                <img src="<%= imageSrc %>" alt="<%= title %>">
                            </div>
                            <div class="item-info">
                                <h3><a href="<%= contextPath %>/shop/product/detail?product_id=<%= cart.getProduct().getProduct_id() %>"><%= title %></a></h3>
                                <%-- <div class="item-options">
                                    <span class="option-label">테마:</span>
                                    <span class="option-value"><%= cart.getProduct().getTheme() %></span>
                                </div> --%>
                            </div>
                            <div class="item-quantity">
                                <span class="quantity-value"><%= quantity %>개</span>
                            </div>
                            <div class="item-price">
                             
                                <div class="price"><%=String.format("%,d", price * quantity)%>원</div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
                <!-- 주문 상품 리스트 끝 -->

                <!-- 포인트 영역 시작 -->
                <div class="order-items">
                    <div class="order-point">
                        <label>포인트</label>
                        <span class="order-all-point">현재 보유 포인트: <%= point %> pt</span>
                        <div class="order-point-input">
                            <input type="text" placeholder="사용하실 포인트를 입력하세요" id="usedPointInput" name = "uesdPoint">
                            <button type="button" onclick="useAllPoint()">전액사용</button>
                        </div>
                        <div class="order-point-result">
                            <div class="order-point-result-row">
                                <span>포인트 적용 후 결제금액</span>
                                <strong id="finalPrice"><%= finalAfterPoint %>원</strong>
                            </div>
                            <div class="order-point-result-row">
                                <span>사용 후 예상 잔여 포인트</span>
                                <strong id="remainPoint"><%= pointAfter %>pt</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 포인트 영역 끝 -->

                <!-- 결제 방법 선택 영역 시작 -->
                <div class="order-items">
                    <div class="order-payment">
                        <label>결제 방법 선택</label>
                        <div class="payment-methods">
                            <label class="payment-option"><input type="radio" name="payment" value="계좌이체" checked><span>계좌 간편결제</span></label>
                            <label class="payment-option"><input type="radio" name="payment" value="카드"><span>카드 간편결제</span></label>
                            <label class="payment-option"><input type="radio" name="payment" value="가상계좌"><span>일반결제 (가상계좌)</span></label>
                            <label class="payment-option"><input type="radio" name="payment" value="삼성페이"><span>SAMSUNG pay</span></label>
                        </div>
                    </div>
                </div>
                <!-- 결제 방법 선택 영역 끝 -->

            </div>

            <!-- 주문 요약 시작 -->
            <div class="order-summary">
                <div class="summary-order">
                    <h3>주문 요약</h3>
                    <div class="summary-item"><span>상품 금액</span><span><%= String.format("%,d",totalPrice)%>원</span></div>
                    <div class="summary-item"><span>할인 금액</span><span class="discount">-<%=String.format("%,d", discount)%>원</span></div>
                    <div class="summary-item"><span>배송비</span><span class="<%= deliveryFee == 0 ? "shipping-free" : "" %>"><%= deliveryFee == 0 ? "무료배송" : String.format("%,d",deliveryFee) + "원" %></span></div>
                    <div class="summary-divider"></div>
                    <div class="summary-total"><span>총 결제 금액</span><span class="total-amount"><%=String.format("%,d", finalAfterPoint)%>원</span></div>
                    <div class="summary-savings"><span>총 절약 금액</span><span class="savings-amount"><%=String.format("%,d", discount)%>원</span></div>
                    <button class="btn btn-primary btn-checkout" id="payment-button">결제하기</button>

                    <div class="payment-info">
                        <h4>결제 혜택</h4>
                        <ul>
                            <li>카드 무이자 할부 (2-6개월)</li>
                            <li>적립금 2% 적립</li>
                            <li>구매 시 포인트 10% 환급</li>
                        </ul>
                    </div>

                    <div class="delivery-info">
                        <h4>배송 정보</h4>
                        <div class="delivery-item"><span>배송 방법</span><span>택배 배송</span></div>
                        <div class="delivery-item"><span>배송 예정일</span><span>1-2일 (영업일 기준)</span></div>
                        <div class="delivery-item"><span>배송비</span><span><%= deliveryFee == 0 ? "무료배송" : String.format("%,d",deliveryFee) + "원"%></span></div>
                    </div>
                </div>
            </div>
            <!-- 주문 요약 끝 -->
        </div>
    </div>
</main>

<%@ include file="../inc/footer.jsp" %>

<script src="https://js.tosspayments.com/v1/payment"></script>
<script>
    const cartIds = [<%
        for (int i = 0; i < cart_items.size(); i++) {
            out.print(cart_items.get(i).getCart_id());
            if (i < cart_items.size() - 1) out.print(", ");
        }
    %>];
    
   

    // 전액 사용 버튼 클릭 시 포인트 입력창에 자동으로 채우고 반영
    function useAllPoint() {
        const point = <%= point %>;
        document.getElementById('usedPointInput').value = point;
        updatePointInfo(point);
    }

    // 포인트 입력 시 자동 반영
    document.addEventListener("DOMContentLoaded", function () {
        const usedPointInput = document.getElementById('usedPointInput');

        usedPointInput.addEventListener('input', function () {
            const used = parseInt(this.value) || 0;
            updatePointInfo(used);
        });

        document.getElementById("payment-button").addEventListener("click", async function () {
            const used = parseInt(usedPointInput.value) || 0;
            const originalAmount = <%= finalAmount %>;
            const finalAmount = Math.max(originalAmount - used, 0);

            const selectedMethod = document.querySelector('input[name="payment"]:checked')?.value;
            if (!selectedMethod) {
                alert("결제 수단을 선택해주세요.");
                return;
            }

            try {
                const res = await fetch("/shop/product/order", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        cartIds: cartIds,
                        usedPoint: used
                    })
                });

                const text = await res.text();
                let result;
                try {
                    result = JSON.parse(text);
                } catch (err) {
                    console.error("응답 JSON 파싱 실패:", text);
                    alert("서버 응답 오류: JSON이 아님");
                    return;
                }

                if (result.url) {
                    const tossPayments = TossPayments("test_ck_ZLKGPx4M3M9blX0zAYEw3BaWypv1");

                    tossPayments.requestPayment(selectedMethod, {
                        amount: finalAmount,
                        orderId: "ORDER_" + new Date().getTime(),
                        orderName: "보드게임 주문 결제",
                        customerName: "<%= member.getMember_name() %>",
                        successUrl: window.location.origin + "/shop/product/orderSuccess",
                        failUrl: window.location.origin + "/shop/product/orderFail"
                    });
                } else {
                    alert("서버 응답 오류. 다시 시도해주세요.");
                }
            } catch (e) {
                console.error("[결제 오류 발생]", e);
                alert("결제창 열기 실패! 콘솔을 확인해주세요.");
            }
        });
    });

    // 가격 정보 업데이트
    function updatePointInfo(used) {
        const point = <%= point %>;
        const originalAmount = <%= finalAmount %>;
        const remain = Math.max(point - used, 0);
        const final = Math.max(originalAmount - used, 0);

        document.getElementById('remainPoint').innerText = remain + "pt";
        document.getElementById('finalPrice').innerText = final.toLocaleString() + "원";
    }
</script>
</body>
</html>
