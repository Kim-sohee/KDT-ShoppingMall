package shoppingmall.model.statistics;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Statistics;

@Repository
public class MybatisStatisticsDAO implements StatisticsDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Statistics> selectStatisticsByThemeFromPastYear() {
		return sqlSessionTemplate.selectList("Statistics.selectOrderByThemeFromPastYear");
	}

	@Override
	public List<Statistics> selectStatisticsBySalesFromPastYear() {
		return sqlSessionTemplate.selectList("Statistics.selectOrderBySalesFromPastYear");
	}

	@Override
	public int totalSaleAmount() {
		return sqlSessionTemplate.selectOne("Statistics.totalSaleAmount");
	}
	
	
}
