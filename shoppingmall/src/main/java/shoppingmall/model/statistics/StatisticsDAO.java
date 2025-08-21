package shoppingmall.model.statistics;

import java.util.List;

import shoppingmall.domain.Statistics;

public interface StatisticsDAO {
	
	public List<Statistics> selectStatisticsByThemeFromPastYear();
	public List<Statistics> selectStatisticsBySalesFromPastYear();
	public int totalSaleAmount();
}
