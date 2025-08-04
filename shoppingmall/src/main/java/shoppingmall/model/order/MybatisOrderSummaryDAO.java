package shoppingmall.model.order;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.exception.OrderSummaryDeleteException;
import shoppingmall.exception.OrderSummaryNotFoundException;

@Repository
public class MybatisOrderSummaryDAO implements OrderSummaryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<OrderSummary> selectByMember(Member member) {
		List<OrderSummary> orderSummaryList;
		try {
			orderSummaryList = sqlSessionTemplate.selectList("OrderSummary.selectByMember", member);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
		
		return orderSummaryList;
	}
	
	@Override
	public List<OrderSummary> selectForPoints(Member member, Timestamp startDate, Timestamp endDate) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
	    paramMap.put("member_id", member.getMember_id());
	    
	    List<OrderSummary> orderSummaryList;
		try {
			orderSummaryList = sqlSessionTemplate.selectList("OrderSummary.selectForPoints", paramMap);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
		
	    return orderSummaryList;
	}
	
	@Override
	public List<OrderSummary> selectOrderByMember(Member member, Timestamp startDate, Timestamp endDate) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
	    paramMap.put("member_id", member.getMember_id());
		
		List<OrderSummary> orderSummaryList;
		try {
			orderSummaryList = sqlSessionTemplate.selectList("OrderSummary.selectOrders", paramMap);
		} catch (Exception e) {
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
		
	    List<OrderSummary> orderSummaryList;
		try {
			orderSummaryList = sqlSessionTemplate.selectList("OrderSummary.selectProblematic", paramMap);
		} catch (Exception e) {
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
	    
		OrderSummary orderSummary;
		try {
			orderSummary = sqlSessionTemplate.selectOne("OrderSummary.selectByStatusList", paramMap);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
		
		return orderSummary;
	}
	
	@Override
	public void delete(int order_summary_id) throws OrderSummaryDeleteException {
		try {
			sqlSessionTemplate.delete("OrderSummary.delete", order_summary_id);
		} catch (Exception e) {
			throw new OrderSummaryDeleteException("주문 요약 삭제에 실패하였습니다.");
		}
	}
	
	@Override
	public void deleteByMemberId(int member_id) throws OrderSummaryDeleteException {
		try {
			sqlSessionTemplate.delete("OrderSummary.deleteByMemberId", member_id);
		} catch (Exception e) {
			throw new OrderSummaryDeleteException("주문 요약 삭제에 실패하였습니다.");
		}
	}
	
}
