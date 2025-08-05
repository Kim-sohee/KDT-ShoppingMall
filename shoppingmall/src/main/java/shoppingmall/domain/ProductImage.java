package shoppingmall.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.ToString;

@Data
public class ProductImage {
	private int productImageId;
	private String fileName;
	@ToString.Exclude
	@JsonBackReference("product-images")
	private Product product;
}

