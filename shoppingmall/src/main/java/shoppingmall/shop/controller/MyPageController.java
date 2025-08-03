package shoppingmall.shop.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Status;
import shoppingmall.model.order.OrderSummaryService;
import shoppingmall.util.DateRangeUtil;
import shoppingmall.util.Paging;

@Slf4j
@Controller
public class MyPageController {
	
	@Autowired
	private OrderSummaryService orderSummaryService;
	
	private Paging paging = new Paging();
	
	//각 페이지 전환 요청 처리
	@GetMapping("/mypage/order/list")
	public ModelAndView getMypage(@RequestParam(value = "page", required = false, defaultValue = "order") String page,
								  @RequestParam(value = "start_date", required = false) String startDateStr,
								  @RequestParam(value = "end_date", required = false) String endDateStr,
	                              HttpSession session, HttpServletRequest request) throws ParseException {
		
		log.debug("startDateStr = " + startDateStr);
		log.debug("endDateStr = " + endDateStr);
		
		//날짜 세팅
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp startDate = DateRangeUtil.parseStartDate(startDateStr); 	//쿼리문 연동용 조회 시작 일자
		Timestamp endDate = DateRangeUtil.parseEndDate(endDateStr);			//쿼리문 연동용 조회 종료 일자
		startDateStr = DateRangeUtil.formatStartDateForDisplay(startDate);	//화면 렌더링용 조회 시작 일자
		endDateStr = DateRangeUtil.formatEndDateForDisplay(endDate);		//화면 렌더링용 조회 종료 일자
	    
		//로그인 체크
	    Member member = (Member) session.getAttribute("member");
	    if (member == null) {
			session.invalidate();
	        return new ModelAndView("redirect:/shop/member/loginform");
	    }

	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("shop/mypage/main");
	    mav.addObject("pageParam", page);  // main.jsp에서 switch 조건으로 사용
	    
	    /*------------------------------------------------------
	    쇼핑 탭(주문 배송 내역 / 취소·반품, 교환 내역) 조회
	    ------------------------------------------------------*/
        if ("order".equals(page) || "return".equals(page)) {
	        List<OrderSummary> orderSummaryList = orderSummaryService.selectByPageAndMember(page, member, startDate, endDate);
			log.debug("로그인 한 회원은 "+member);
			
			//페이징 처리
	        paging.init(orderSummaryList, request);
	        
	        mav.addObject("orderSummaryList", orderSummaryList);
	        mav.addObject("paging", paging);
	        
	        // 날짜 정보도 JSP에 전달해서 폼 초기값 설정용으로 사용    
	        mav.addObject("startDate", startDateStr);
	        mav.addObject("endDate", endDateStr);
	    }
	    
	    // 필요 시 page별로 다른 데이터도 처리
	    /*if ("qna".equals(page)) {
	        // 예시: QNA 리스트 가져오기
	        List<Qna> qnaList = qnaService.selectByMember(member);
	        mav.addObject("qnaList", qnaList);
	    }
		*/
	    // 필요 시 추가 파라미터 처리 가능
	    // if ("point".equals(page)) {...}

	    return mav;
	}

	
	//상세 주문 목록 페이지 요청 처리
	@GetMapping("/mypage/order/detail")
	public ModelAndView getOrderDetail(HttpSession session, HttpServletRequest request,
								   	   @RequestParam(value = "order_summary_id") int id, 
									   @RequestParam(value = "status_type", required = false, defaultValue = "delivery") String statusType) {
		
		System.out.println("✅✅✅ 주문 상세 컨트롤러 진입 ✅✅✅");
	    log.debug("order_detail 컨트롤러 진입");
		
		//로그인 체크
	    Member member = (Member) session.getAttribute("member");
	    if (member == null) {
			session.invalidate();
	        return new ModelAndView("redirect:/shop/member/loginform");
	    }

	    
	    List<Integer> statusList = orderSummaryService.getStatusListByType(statusType);
	    OrderSummary orderSummary = orderSummaryService.selectByStatusList(id, member, statusList);
	    List<Status> statusListAll = orderSummaryService.selectStatusAll();
	    
	    log.info("요청 페이지는 "+ statusType);
	    log.info("주문 요약은 " + orderSummary);
	    
	    ModelAndView mav = new ModelAndView();
		mav.addObject("orderSummary", orderSummary);
		mav.addObject("statusType", statusType);
		mav.addObject("statusList", statusListAll);
		mav.setViewName("shop/mypage/orderDetail");
		
	    return mav;
	}
	
}
