package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.Cart;

public interface CartService {
	public void insert(Cart cart);
	public List<Cart> selectByMember(int product_id);
} 
