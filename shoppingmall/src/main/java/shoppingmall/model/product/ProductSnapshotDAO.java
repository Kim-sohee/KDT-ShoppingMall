package shoppingmall.model.product;

import shoppingmall.domain.ProductSnapshot;

public interface ProductSnapshotDAO {
	public String selectProductNameBySnapshotId(int id);
	public void insert(ProductSnapshot productSnapshot);
}
