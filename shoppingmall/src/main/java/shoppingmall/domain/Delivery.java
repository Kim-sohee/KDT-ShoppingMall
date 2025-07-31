package shoppingmall.domain;

import javax.persistence.OneToOne;

import lombok.Data;

@Data
public class Delivery {
	private int delivery_id;
	private String address;
	private String address_alias;
	private String receiver_name;
	private String receiver_phone;
	@OneToOne
	private Member member;
}
