package shoppingmall.model.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.OrderDetail;
import shoppingmall.domain.Product;
import shoppingmall.exception.OrderDetailNotFoundException;
import shoppingmall.model.product.ProductDAO;
import shoppingmall.model.product.ProductSnapshotDAO;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Autowired
	private ProductSnapshotDAO productSnapshotDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<OrderDetail> selectAll() throws OrderDetailNotFoundException {
		return orderDetailDAO.selectAll();
	}
	
	@Override
	public List<Product> getTopSellingProducts() {
		List<Integer> topSnapshotIds = orderDetailDAO.selectTopSnapshotIds();
		List<String> productNames = new ArrayList<>();
		
		for(int id: topSnapshotIds) {
			String name = productSnapshotDAO.selectProductNameBySnapshotId(id);
			if(!productNames.contains(name)) {
				productNames.add(name);
			}
		}
		if(productNames.isEmpty()) return new ArrayList<>();
		
		return productDAO.selectTopProductByNames(productNames);
	}
}
