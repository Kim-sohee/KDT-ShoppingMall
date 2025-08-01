package shoppingmall.domain;

import lombok.Data;

@Data
public class Cart {
	private int cart_id;
	private int quantity;
	private Product product;
	private Member member;
}
