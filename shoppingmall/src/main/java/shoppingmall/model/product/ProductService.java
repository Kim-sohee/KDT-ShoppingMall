package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Product;

public interface ProductService {
	public List selectAll();
	public Product select(int product_id);
	public List selectProductByFilter(Product product);
	public List selectProductSearchName(String product_name);
}
