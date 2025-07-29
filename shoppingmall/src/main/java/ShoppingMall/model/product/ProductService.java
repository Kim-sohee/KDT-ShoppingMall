package ShoppingMall.model.product;

import java.util.List;

import ShoppingMall.domain.Product;

public interface ProductService {
	public List selectAll();
	public Product select(int product_id);
}
