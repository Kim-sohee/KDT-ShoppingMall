package ShoppingMall.domain;

import javax.persistence.ManyToOne;

public class OrderSummary {
	private int order_summary_id;
	private String ordered_at; 		//주문일자, 구매일자
	private int total_price; 		//총 구매금액
	private int final_price;		//최종 결제금액
	private String payment_type;	//결제수단
	private int point_used;		//결제에 사용된 포인트
	
	@ManyToOne
	private Member member;
	private Status status;
	private Delivery delivery;
}
