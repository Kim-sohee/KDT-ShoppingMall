package shoppingmall.model.order;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.exception.ReturnsNotFoundException;

@Repository
public class MybatisReturnsDAO implements ReturnsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void deleteByOrderSummaryId(int order_summary_id) throws ReturnsNotFoundException {
		try {
			sqlSessionTemplate.delete("Returns.deleteByOrderSummaryId", order_summary_id);
		} catch (Exception e) {
			throw new ReturnsNotFoundException("반품, 교환 정보를 찾을 수 없습니다.");
		}
	}
}
