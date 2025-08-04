package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.OrderDetail;
import shoppingmall.domain.Product;

public interface OrderDetailService {
	
	public List<OrderDetail> selectAll();
	public void insert(OrderDetail orderDetail);
	public List<Product> getTopSellingProducts();

}
