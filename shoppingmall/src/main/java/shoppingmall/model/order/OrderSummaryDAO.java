package shoppingmall.model.order;

import java.sql.Timestamp;
import java.util.List;

import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;

public interface OrderSummaryDAO {
	public List<OrderSummary> selectByMemberAndDate(Member member, Timestamp startDate, Timestamp endDate);
	public List<OrderSummary> selectReturnByMember(Member member, Timestamp startDate, Timestamp endDate);
	
	
	public OrderSummary selectByStatusList(int order_summary_id, Member member, List<Integer> statusList);
	
}
