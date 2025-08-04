package shoppingmall.model.order;

import shoppingmall.domain.Delivery;

public interface DeliveryDAO {
	public void insert(Delivery delivery);
	public void update(Delivery delivery);
	public void delete(int delivery_id);
	public void deleteByMemberId(int delivery_id);
}
