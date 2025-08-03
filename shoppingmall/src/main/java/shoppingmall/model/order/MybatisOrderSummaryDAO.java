package shoppingmall.model.order;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Delivery;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Status;
import shoppingmall.exception.OrderSummaryNotFoundException;

@Repository
public class MybatisOrderSummaryDAO implements OrderSummaryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<OrderSummary> selectByMemberAndDate(Member member, Timestamp startDate, Timestamp endDate) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
	    paramMap.put("member_id", member.getMember_id());
		
		List<OrderSummary> orderSummaryList = sqlSessionTemplate.selectList("OrderSummary.selectOrders", paramMap);
		if(orderSummaryList == null) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
		
		return orderSummaryList;
	}
	
	@Override
	public List<OrderSummary> selectReturnByMember(Member member, Timestamp startDate, Timestamp endDate) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
	    paramMap.put("member_id", member.getMember_id());
		List<OrderSummary> orderSummaryList = sqlSessionTemplate.selectList("OrderSummary.selectProblematic", paramMap);
		if(orderSummaryList == null) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
		
		return orderSummaryList;
	}
	
	@Override
	public OrderSummary selectByStatusList(int order_summary_id, Member member, List<Integer> statusList) {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("order_summary_id", order_summary_id);
	    paramMap.put("member_id", member.getMember_id());
	    paramMap.put("statusList", statusList);
	    
		OrderSummary orderSummary = sqlSessionTemplate.selectOne("OrderSummary.selectByStatusList", paramMap);
		
		if(orderSummary == null) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
		
		return orderSummary;
	}

	@Override
	public void Insert(OrderSummary ordersummary) {
		sqlSessionTemplate.insert("OrderSummary.insert",ordersummary);
		
	}
	
}
