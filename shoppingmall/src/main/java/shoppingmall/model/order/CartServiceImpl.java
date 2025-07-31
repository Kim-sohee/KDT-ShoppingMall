package shoppingmall.model.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Cart;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public void insert(Cart cart) {
		 cartDAO.insert(cart);
	}

	@Override
	public List<Cart> selectByMember(int product_id) {
		List<Cart> result = cartDAO.selectByMemeber(product_id);
		return result;
	}
	
}
