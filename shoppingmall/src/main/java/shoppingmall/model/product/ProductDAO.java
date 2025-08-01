package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Product;

public interface ProductDAO {
	public List selectAll();	//모두 조회
	public Product select(int product_id);	//한 건 조회
	public List selectProductByFilter(Product product);	//필터링 한 상품 모두 조회
	public List selectProductSearchName(String product_name);	//이름으로 검색한 상품 모두 조회
}
