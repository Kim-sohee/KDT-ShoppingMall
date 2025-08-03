package shoppingmall.model.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.OrderDetail;
import shoppingmall.exception.OrderDetailNotFoundException;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	public List<OrderDetail> selectAll() throws OrderDetailNotFoundException {
		return orderDetailDAO.selectAll();
	}
}
