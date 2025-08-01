package shoppingmall.model.product;

import shoppingmall.domain.ProductImage;

public interface ProductImageDAO {
	public void insert(ProductImage productImage);
	public void deletByProductId(int product_id);
}
