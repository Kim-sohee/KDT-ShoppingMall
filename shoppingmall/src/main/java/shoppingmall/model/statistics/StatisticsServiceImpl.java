package shoppingmall.model.statistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Statistics;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private StatisticsDAO statisticsDAO;
	
	@Override
	public List<Statistics> getStatisticsByThemeFromPastYear() {
		return statisticsDAO.selectStatisticsByThemeFromPastYear();
	}

	@Override
	public List<Statistics> getStatisticsBySalesFromPastYear() {
		return statisticsDAO.selectStatisticsBySalesFromPastYear();
	}

	@Override
	public int totalSaleAmount() {
		return statisticsDAO.totalSaleAmount();
	}

}
