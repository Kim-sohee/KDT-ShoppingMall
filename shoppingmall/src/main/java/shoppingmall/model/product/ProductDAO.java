package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Product;

public interface ProductDAO {
	public List selectAll();	//모두 조회
	public Product select(int product_id);	//한 건 조회
	
}
