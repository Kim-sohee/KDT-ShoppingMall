package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.Cart;

public interface CartService {
	public void insert(Cart cart);
	public List<Cart> selectByMember(int product_id);
	public void deleteCartItem(int cartId);
	public void updateQuantity(int cart_id, int quantity, int member_id);
	public void deleteSelectedItems(List cartIds);
	public List<Cart> getCartItemsByIds(List<Integer> ids);
	
} 
