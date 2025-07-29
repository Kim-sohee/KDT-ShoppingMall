package shoppingmall.domain;

import javax.persistence.OneToOne;

import lombok.Data;

@Data
public class Returns {
	private int return_id;
	private String courier; //택배사
	private int delivery_fee; //반송비용
	private String return_address;
	@OneToOne
	private OrderSummary orderSummary;
}
