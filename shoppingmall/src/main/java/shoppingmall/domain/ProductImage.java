package shoppingmall.domain;

import lombok.Data;
import lombok.ToString;

@Data
public class ProductImage {
	private int productImageId;
	private String fileName;
	@ToString.Exclude
	private Product product;
}

