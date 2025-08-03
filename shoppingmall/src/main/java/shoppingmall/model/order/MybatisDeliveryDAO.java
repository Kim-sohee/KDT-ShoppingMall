package shoppingmall.model.order;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Delivery;
import shoppingmall.exception.DeliveryDeleteException;
import shoppingmall.exception.DeliveryRegistException;
import shoppingmall.exception.DeliveryUpdateException;

@Repository
public class MybatisDeliveryDAO implements DeliveryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(Delivery delivery) throws DeliveryRegistException {
		try {
			sqlSessionTemplate.insert("Delivery.insert", delivery);
		} catch (Exception e) {
			throw new DeliveryRegistException("배송지 등록 실패");
		}
	}
	
	@Override
	public void update(Delivery delivery) throws DeliveryUpdateException {
		try {
			sqlSessionTemplate.update("Delivery.update", delivery);
		} catch (Exception e) {
			throw new DeliveryUpdateException("배송지 수정 실패");
		}
	}
	
	@Override
	public void delete(int delivery_id) throws DeliveryDeleteException {
		try {
			sqlSessionTemplate.delete("Delivery.delete", delivery_id);
		} catch (Exception e) {
			throw new DeliveryDeleteException("배송지 삭제 실패");
		}	
	}
	
	@Override
	public void deleteByMemberId(int member_id) throws DeliveryDeleteException {
		try {
			sqlSessionTemplate.delete("Delivery.deleteByMemberId", member_id);
		} catch (Exception e) {
			throw new DeliveryDeleteException("배송지 삭제 실패");
		}
	}
	
}
