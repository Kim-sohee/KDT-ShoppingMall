package shoppingmall.model.order;

import java.sql.Timestamp;
import java.util.List;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Status;

public interface OrderSummaryService {
	public OrderSummary select(int summeryId);
	public List<OrderSummary> selectByMember(Member member);
	public List<OrderSummary> selectByPageAndMember(String page, Member member, Timestamp startDate, Timestamp endDate);
	public List<OrderSummary> selectByOrder(int pageSize, int currentPage);
	public List<OrderSummary> selectByInquiry(int pageSize, int currentPage);
	public List<OrderSummary> selectByReturn(int pageSize, int currentPage);
	public OrderSummary selectByStatusList(int order_summary_id, Member member, List<Integer> statusList);
	public List<Integer> getStatusListByType(String statusType);
	public List<Status> selectStatusAll();


	public void insert(OrderSummary orderSummary);
	
	public int totalRecord(Status status);
	public int newOrderCount();
}
