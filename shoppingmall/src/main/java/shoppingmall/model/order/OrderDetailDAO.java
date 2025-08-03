package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.OrderDetail;

public interface OrderDetailDAO {
	
	public List<OrderDetail> selectAll();
	
}
