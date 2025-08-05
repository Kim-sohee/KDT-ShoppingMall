package shoppingmall.model.order;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Status;
import shoppingmall.exception.OrderSummaryDeleteException;
import shoppingmall.exception.OrderSummaryNotFoundException;
import shoppingmall.exception.OrderSummaryRegistException;
import shoppingmall.exception.OrderSummaryTotalRecoredException;

@Repository
public class MybatisOrderSummaryDAO implements OrderSummaryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public OrderSummary select(int summery_id) throws OrderSummaryNotFoundException {
		try {
			OrderSummary orderSummary = sqlSessionTemplate.selectOne("OrderSummary.select", summery_id);
			return orderSummary;
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException(e);
		}
	}
	
	@Override
	public List<OrderSummary> selectByMember(Member member) {
		try {
			return sqlSessionTemplate.selectList("OrderSummary.selectByMember", member);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
	}
	
	@Override
	public List<OrderSummary> selectForPoints(Member member, Timestamp startDate, Timestamp endDate) throws OrderSummaryNotFoundException {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
	    paramMap.put("member_id", member.getMember_id());
	    
		try {
			return sqlSessionTemplate.selectList("OrderSummary.selectForPoints", paramMap);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
	}
	
	@Override
	public List<OrderSummary> selectOrderByMember(Member member, Timestamp startDate, Timestamp endDate) throws OrderSummaryNotFoundException {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
	    paramMap.put("member_id", member.getMember_id());
		
		try {
			return sqlSessionTemplate.selectList("OrderSummary.selectOrders", paramMap);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
	}
	
	@Override
	public List<OrderSummary> selectReturnByMember(Member member, Timestamp startDate, Timestamp endDate) throws OrderSummaryNotFoundException {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
	    paramMap.put("member_id", member.getMember_id());
		
		try {
			return sqlSessionTemplate.selectList("OrderSummary.selectProblematic", paramMap);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
	}
	
	@Override
	public OrderSummary selectByStatusList(int order_summary_id, Member member, List<Integer> statusList) {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("order_summary_id", order_summary_id);
	    paramMap.put("member_id", member.getMember_id());
	    paramMap.put("statusList", statusList);
	    
		try {
			return sqlSessionTemplate.selectOne("OrderSummary.selectByStatusList", paramMap);
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException("주문 요약 조회에 실패하였습니다.");
		}
	}
	
	@Override
	public List<OrderSummary> selectByOrder(Map<String, Object> map) throws OrderSummaryNotFoundException {
		List<OrderSummary> list = null;
		try {
			list = sqlSessionTemplate.selectList("OrderSummary.selectByOrder", map);			
			if (list == null) {
				list = new ArrayList<>();
			}
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException(e);
		}
		return list;
	}
	
	@Override
	public List<OrderSummary> selectByInquiry(Map<String, Object> map) {
		List<OrderSummary> list = null;
		try {
			list = sqlSessionTemplate.selectList("OrderSummary.selectByInquiry", map);			
			if (list == null) {
				list = new ArrayList<>();
			}
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException(e);
		}
		return list;
	}
	
	@Override
	public List<OrderSummary> selectByReturn(Map<String, Object> map) {
		List<OrderSummary> list = null;
		try {
			list = sqlSessionTemplate.selectList("OrderSummary.selectByReturn", map);			
			if (list == null) {
				list = new ArrayList<>();
			}
		} catch (Exception e) {
			throw new OrderSummaryNotFoundException(e);
		}
		return list;
	}

	@Override
	public void Insert(OrderSummary ordersummary) throws OrderSummaryRegistException {
		try {
			sqlSessionTemplate.insert("OrderSummary.insert",ordersummary);
		} catch (Exception e) {
			throw new OrderSummaryRegistException("주문 요약 추가에 실패하였습니다.");
		}
		
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

	@Override
	public int totalRecord(Status status) throws OrderSummaryTotalRecoredException {
		try {
			int result = sqlSessionTemplate.selectOne("OrderSummary.totalRecord", status);
			return result;
		} catch (Exception e) {
			throw new OrderSummaryTotalRecoredException(e);
		}
	}
	
	@Override
	public int newOrderCount() {
		return sqlSessionTemplate.selectOne("OrderSummary.newOrderCount");
	}
	
}
