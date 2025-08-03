package shoppingmall.model.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.OrderDetail;
import shoppingmall.exception.OrderDetailNotFoundException;

@Repository
public class MybatisOrderDetailDAO implements OrderDetailDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<OrderDetail> selectAll() throws OrderDetailNotFoundException {
		List<OrderDetail> orderDetailList = sqlSessionTemplate.selectList("OrderDetail.select");
		if(orderDetailList == null) {
			throw new OrderDetailNotFoundException("주문 상세 내역을 찾을 수 없습니다.");
		}
		return orderDetailList;
	}
	
	@Override
	public List<Integer> selectTopSnapshotIds() {
		return sqlSessionTemplate.selectList("OrderDetail.selectTopSnapshotIds");
	}

}
