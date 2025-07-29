package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Product;

public interface ProductService {
	public List selectAll();
	public Product select(int product_id);
}
