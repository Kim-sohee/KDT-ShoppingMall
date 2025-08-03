package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.OrderDetail;

public interface OrderDetailService {
	
	public List<OrderDetail> selectAll();
	public void insert(OrderDetail orderDetail);
}
