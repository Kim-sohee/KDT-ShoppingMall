package shoppingmall.model.order;

import java.sql.Timestamp;
import java.util.List;

import shoppingmall.domain.Delivery;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Status;

public interface OrderSummaryDAO {
	public List<OrderSummary> selectByMember(Member member);
	public List<OrderSummary> selectOrderByMember(Member member, Timestamp startDate, Timestamp endDate);
	public List<OrderSummary> selectReturnByMember(Member member, Timestamp startDate, Timestamp endDate);
	public void delete(int order_summary_id);
	public void deleteByMemberId(int member_id);
	
	public OrderSummary selectByStatusList(int order_summary_id, Member member, List<Integer> statusList);
	
	
	//결제 후 OrderSummary 데이터 생성
	public void Insert(OrderSummary ordersummary);
	
}
