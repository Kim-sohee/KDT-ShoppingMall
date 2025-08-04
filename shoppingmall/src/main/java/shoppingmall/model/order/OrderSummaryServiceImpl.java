package shoppingmall.model.order;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Status;
import shoppingmall.exception.OrderSummaryNotFoundException;
import shoppingmall.exception.StatusNotFoundException;

@Service
public class OrderSummaryServiceImpl implements OrderSummaryService {
	
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	
	@Autowired
	private StatusDAO statusDAO;
	
	@Override
	public List<OrderSummary> selectByMember(Member member) {
		return orderSummaryDAO.selectByMember(member);
	}
	
	@Override
	public List<OrderSummary> selectByPageAndMember(String page, Member member, Timestamp startDate, Timestamp endDate) throws OrderSummaryNotFoundException {
	    if ("order".equals(page)) {
	        return orderSummaryDAO.selectOrderByMember(member, startDate, endDate);
	    } else if ("return".equals(page)) {
	        return orderSummaryDAO.selectReturnByMember(member, startDate, endDate);
	    } else {
	        return Collections.emptyList();
	    }
	}
	
	@Override
	public OrderSummary selectByStatusList(int order_summary_id, Member member, List<Integer> statusList) throws OrderSummaryNotFoundException {
		return orderSummaryDAO.selectByStatusList(order_summary_id, member, statusList);
	}
	
	@Override
	public List<Integer> getStatusListByType(String statusType) {
		switch (statusType) {
			case "returns": return Collections.singletonList(6);
	        case "exchanges": return Collections.singletonList(7);
	        case "problematic": return Arrays.asList(6, 7);
	        case "delivery":
	        default: return Arrays.asList(1, 2, 3, 4, 5);
	    }
	}
	
	@Override
	public List<Status> selectStatusAll() throws StatusNotFoundException {
		return statusDAO.selectAll();
	}

	@Override
	public void insert(OrderSummary orderSummary) {
		orderSummaryDAO.Insert(orderSummary);
		
	}
	
}
