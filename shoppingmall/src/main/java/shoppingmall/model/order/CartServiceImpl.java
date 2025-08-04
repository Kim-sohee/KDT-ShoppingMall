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
	@Override
	public void deleteCartItem(int cartId) {
	   cartDAO.deleteCartItem(cartId);
	}

	@Override
    public void updateQuantity(int cart_id, int quantity, int member_id) {
        Cart cart = cartDAO.select(cart_id);
        if (cart != null && cart.getMember().getMember_id() == member_id) {
            cart.setQuantity(quantity);
            cartDAO.updateQuantity(cart); // DAO에서 실제 update 실행
        }
    }

	@Override
	public void deleteSelectedItems(List cartIds) {
		cartDAO.deleteSelectedItems(cartIds);
	}

	@Override
	public List<Cart> getCartItemsByIds(List<Integer> ids) {
		List<Cart> result = cartDAO.getCartItemsByIds(ids);
		return result;
	}

	@Override
	public void deleteByMemberId(int member_id) {
		cartDAO.deleteByMemberId(member_id);
	}
	

	
}
