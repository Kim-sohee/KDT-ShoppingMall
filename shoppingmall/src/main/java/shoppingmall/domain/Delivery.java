package shoppingmall.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

@Data
public class Delivery {
	private int delivery_id;
	private String address;
	private String address_alias;
	private String receiver_name;
	private String receiver_phone;
	@JsonBackReference("member-deliveries")
	private Member member;
}
