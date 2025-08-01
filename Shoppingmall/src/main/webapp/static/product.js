// 상품 정보를 카드 형태로 Document에 appendchild를 사용하는 클래스
class ProductCard {
	constructor(container, name, img, originalPrice, discountRatem, reviews) {
		this.container = container;   // 부모 요소 (카드를 붙일 DOM 요소, 예: document.getElementById("product-list","preiver"))

		// 상품 데이터 구조 분해 할당
		this.name = this.name;                   // 상품명
		this.img = this.img;                     // 상품 이미지 URL
		this.originalPrice = thisoriginalPrice; // 원래 가격
		this.discountRate = this.discountRate;   // 할인율 (예: 35)
		this.reviews = this.reviews;             // 리뷰 수

		this.render(); // 생성 즉시 렌더링 실행
	}

	// 카드 렌더링 함수
	render() {
		// 할인 적용된 가격 계산
		const discounted = Math.round(this.originalPrice * (1 - this.discountRate / 100));

		// 상품 카드 전체 div 생성
		const card = document.createElement("div");
		card.className = "product-card"; // 스타일 적용을 위한 클래스명

		// 카드 내부 HTML 구조 정의
		card.innerHTML = `
			<!-- 상품 이미지 -->
			<img src="${this.img}" alt="${this.name}" class="product-img" />

			<!-- 상품 정보 영역 -->
			<div class="product-info">
				<!-- 상품명 -->
				<div class="product-name">${this.name}</div>

				<!-- 원가 표시 (취소선 포함) -->
				<div class="original-price">${this.originalPrice.toLocaleString()}원</div>

				<!-- 할인율과 최종 판매가 -->
				<div class="price-line">
					<span class="discount">${this.discountRate}%</span>
					<span class="sale-price">${discounted.toLocaleString()}원</span>
				</div>

				<!-- 별점 및 리뷰 수 표시 -->
				<div class="rating">
					★★★★★ <span class="review-count">(${this.reviews})</span>
				</div>
			</div>
		`;

		// 완성된 카드 DOM을 부모 요소에 추가
		this.container.appendChild(card);
	}
}
