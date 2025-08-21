package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.OrderDetail;

public interface OrderDetailDAO {
	
	public List<OrderDetail> selectAll();
	public void insert(OrderDetail orderDetail);
	public void deleteByOrderSummaryId(int orderSummary_id);
	public List<Integer> selectTopSnapshotIds();

}
