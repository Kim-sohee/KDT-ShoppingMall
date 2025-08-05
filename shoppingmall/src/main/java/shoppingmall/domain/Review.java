package shoppingmall.domain;

import lombok.Data;
import lombok.ToString;

@Data
public class Review {
	private int review_id;
	private String content;
	private String reviewed_at;
	private int rating;
	@ToString.Exclude
	private Product product;
	private Member member;
}
