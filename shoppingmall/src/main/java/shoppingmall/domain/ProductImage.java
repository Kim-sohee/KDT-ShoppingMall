package shoppingmall.domain;

import lombok.Data;

@Data
public class ProductImage {
	private int productImageId;
	private String fileName;
	private Product product;
}

