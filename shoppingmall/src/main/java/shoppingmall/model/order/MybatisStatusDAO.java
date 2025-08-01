package shoppingmall.model.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Status;
import shoppingmall.exception.StatusNotFoundException;

@Repository
public class MybatisStatusDAO implements StatusDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Status> selectAll() throws StatusNotFoundException {
		List<Status> statusList = sqlSessionTemplate.selectList("Status.selectAll");
		if(statusList == null) {
			throw new StatusNotFoundException("주문 상태를 확인할 수 없습니다.");
		}
		return statusList;
	}
}
