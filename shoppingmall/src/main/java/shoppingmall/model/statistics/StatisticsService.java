package shoppingmall.model.statistics;

import java.util.List;

import shoppingmall.domain.Statistics;

public interface StatisticsService {
	public List<Statistics> getStatisticsByThemeFromPastYear();
	public List<Statistics> getStatisticsBySalesFromPastYear();
	public int totalSaleAmount();
}
