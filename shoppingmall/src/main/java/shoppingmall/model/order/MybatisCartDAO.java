package shoppingmall.model.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Cart;
import shoppingmall.exception.CartException;

@Repository
public class MybatisCartDAO implements CartDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(Cart cart) throws CartException{
		int result = sqlSessionTemplate.insert("Cart.insert",cart);
		if(result< 1) {
			throw new CartException("cart 입력 실패");
		}
	}

	@Override
	public List<Cart> selectByMemeber(int product_id)throws CartException {
		List<Cart> result = sqlSessionTemplate.selectList("Cart.selectByMember", product_id);
		if(result.size() < 1) {
			throw new CartException("cart 내부가 비어있습니다.");
		}
		return result;
	}
	
	@Override
	public void deleteCartItem(int cartId) {
	    sqlSessionTemplate.selectOne("Cart.delete",cartId);
	   
	}
	@Override
	    public Cart select(int cart_id) {
	        return sqlSessionTemplate.selectOne("Cart.selectById", cart_id);
	}
	
	@Override
	public void updateQuantity(Cart cart) {
		sqlSessionTemplate.update("Cart.updateQuantity", cart);
	}
	
	@Override
	public void deleteSelectedItems(List cartIds) {
		sqlSessionTemplate.delete("Cart.deleteSelectedItems", cartIds);
	}
	
	@Override
	public List<Cart> getCartItemsByIds(List<Integer> ids) {
		List<Cart> result = sqlSessionTemplate.selectList("Cart.selectByIds",ids);
		return result;
	}
	
	@Override
	public void deleteByMemberId(int member_id) throws CartException {
		try {
	        sqlSessionTemplate.delete("Cart.deleteByMemberId", member_id);
	    } catch (Exception e) {
	        throw new CartException("장바구니 삭제 중 오류 발생", e);
	    }
		
	}
	
}
