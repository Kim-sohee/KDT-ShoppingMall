package shoppingmall.model.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.OrderDetail;
import shoppingmall.exception.OrderDetailNotFoundException;
import shoppingmall.exception.OrderDetailRegistException;

@Repository
public class MybatisOrderDetailDAO implements OrderDetailDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<OrderDetail> selectAll() throws OrderDetailNotFoundException {
		try {
			return sqlSessionTemplate.selectList("OrderDetail.select");
		} catch (Exception e) {
			throw new OrderDetailNotFoundException("주문 상세 내역을 찾을 수 없습니다.");
		}
	}
	
	@Override
	public List<Integer> selectTopSnapshotIds() throws OrderDetailNotFoundException {
		try {
			return sqlSessionTemplate.selectList("OrderDetail.selectTopSnapshotIds");
		} catch (Exception e) {
			throw new OrderDetailNotFoundException("주문 상세 내역을 찾을 수 없습니다.");
		}
	}

	@Override
	public void insert(OrderDetail orderDetail) throws OrderDetailRegistException {
		try {
			sqlSessionTemplate.insert("OrderDetail.insert",orderDetail);
		} catch (Exception e) {
			throw new OrderDetailRegistException("주문 상세 등록에 실패하였습니다.");
		}
	}

}
