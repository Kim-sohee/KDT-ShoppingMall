package shoppingmall.model.order;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.ProductSnapshot;


@Repository
public class MybatisProductSnapshotDAO implements ProductSnapshotDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(ProductSnapshot productSnapshot) {
		sqlSessionTemplate.insert("ProductSnapshot.insert",productSnapshot);
		
	}
		
}
