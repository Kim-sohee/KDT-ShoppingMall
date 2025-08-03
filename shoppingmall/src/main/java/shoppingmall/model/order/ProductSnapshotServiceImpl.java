package shoppingmall.model.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.ProductSnapshot;

@Service
public class ProductSnapshotServiceImpl implements ProductSnapshotService {

	@Autowired
	private ProductSnapshotDAO productSnapshotDAO;
	
	@Override
	public void insert(ProductSnapshot productSnapshot) {
		productSnapshotDAO.insert(productSnapshot);
	}

}
