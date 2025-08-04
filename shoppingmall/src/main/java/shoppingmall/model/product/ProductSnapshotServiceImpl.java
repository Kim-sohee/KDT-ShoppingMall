package shoppingmall.model.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.ProductSnapshot;
import shoppingmall.model.order.ProductSnapshotDAO;

@Service
public class ProductSnapshotServiceImpl implements ProductSnapshotService {

	@Autowired
	private ProductSnapshotDAO productSnapshotDAO;
	
	@Override
	public void insert(ProductSnapshot productSnapshot) {
		productSnapshotDAO.insert(productSnapshot);
	}

}
