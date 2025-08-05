package shoppingmall.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.ToString;

@Data
public class Review {
	private int review_id;
	private String content;
	private String reviewed_at;
	private int rating;
	@ToString.Exclude
	@JsonBackReference("product-reviews")
	private Product product;
	@JsonBackReference("member-reviews")
	private Member member;
}
