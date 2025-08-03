package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.Cart;

public interface CartDAO {
	public void insert(Cart cart);
	
	//고객에게 해당하는 장바구니 목록 불러오기
	public List<Cart> selectByMemeber(int product_id);
	
	public void deleteCartItem(int cartId);
	public Cart select(int cart_id);
	public void updateQuantity(Cart cart);
	public void deleteSelectedItems(List cartIds);
	public List<Cart> getCartItemsByIds(List<Integer> ids);
	
	public void deleteByMemberId(int member_id);
}
