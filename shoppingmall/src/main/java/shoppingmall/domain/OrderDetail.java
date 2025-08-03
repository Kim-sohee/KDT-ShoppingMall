package shoppingmall.domain;

import lombok.Data;

@Data
public class OrderDetail {
	private int order_detail_id;
	private int quantity_real;
	private OrderSummary orderSummary;
	private ProductSnapshot productSnapshot;
}
