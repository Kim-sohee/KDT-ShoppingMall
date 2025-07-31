package shoppingmall.domain;

import lombok.Data;

@Data
public class Review {
	private int review_id;
	private String content;
	private String reviewed_at;
	private int rating;
	private Product product;
	private Member member;
}
