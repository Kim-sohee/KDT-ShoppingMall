package shoppingmall.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

@Data
public class OrderDetail {
	private int order_detail_id;
	private int quantity_real;
	@JsonBackReference("order-details")
	private OrderSummary orderSummary;
	private ProductSnapshot productSnapshot;
}
