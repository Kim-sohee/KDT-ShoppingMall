package shoppingmall.model.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService{
	@Autowired
	private DeliveryDAO deliveryDAO;

	@Override
	public void insert(Delivery delivery) {
		deliveryDAO.insert(delivery);
	}
	
	
}
