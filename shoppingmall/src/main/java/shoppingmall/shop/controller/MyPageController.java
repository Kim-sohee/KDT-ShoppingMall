package shoppingmall.shop.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Delivery;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Qna;
import shoppingmall.domain.Review;
import shoppingmall.domain.Status;
import shoppingmall.model.member.MemberService;
import shoppingmall.model.order.OrderSummaryService;
import shoppingmall.model.product.QnaService;
import shoppingmall.util.DateRangeUtil;
import shoppingmall.util.Paging;
import shoppingmall.util.PasswordUtil;

@Slf4j
@Controller
public class MyPageController {
	
	@Autowired
	private OrderSummaryService orderSummaryService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private Paging paging;
	
	//각 페이지 전환 요청 처리
	@GetMapping("/mypage/list")
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

	    //상단 정보 확인용(주문 건수, 구매 누적 금액 등)
	    List<OrderSummary> orderSummaryList = orderSummaryService.selectByMember(member); 
	    
	    //페이지별 공통 파라미터 넘기기
	    ModelAndView mav = new ModelAndView("shop/mypage/main");
	    mav.addObject("pageParam", page);  			//main.jsp에서 switch 조건으로 사용
	    mav.addObject("startDate", startDateStr); 	//날짜 정보도 JSP에 전달해서 폼 초기값 설정용으로 사용
	    mav.addObject("endDate", endDateStr);
	    mav.addObject("defaultOrderSummaryList", orderSummaryList);
	    
	    
	    //쇼핑 탭(주문 배송 내역 / 취소·반품, 교환 내역) 조회 & 혜택 탭(포인트) 조회
        if ("order".equals(page) || "return".equals(page) || "point".equals(page)) {
	        orderSummaryList = orderSummaryService.selectByPageAndMember(page, member, startDate, endDate); //날짜별 조회를 위해 orderSummaryList값 변경 후 다른 변수명으로 addObject
	        log.debug("orderSummaryList = "+orderSummaryList);
			log.debug("쇼핑 탭 요청 회원은 "+member);
			
	        paging.init(orderSummaryList, request); //페이징 처리
	        mav.addObject("orderSummaryList", orderSummaryList);
	    }
        
        //활동 탭(상품후기) 조회
        else if("review".equals(page)) {
	    	List<Review> reviewList = memberService.getChildList(member.getMember_id(), startDate, endDate).getReviewList();
	    	log.debug("상품후기 요청 회원은 "+memberService.getChildList(member.getMember_id(), startDate, endDate));
	    	log.debug("등록한 상품후기 목록은" + reviewList);
	    	
	    	paging.init(reviewList, request); 		//페이징 처리
	    	mav.addObject("reviewList", reviewList);
	    }
        
        //활동 탭(문의내역) 조회
        else if("qna".equals(page)) {
        	List<Qna> qnaList = memberService.getChildList(member.getMember_id(), startDate, endDate).getQnaList();
	    	log.debug("Qna 요청 회원은 "+memberService.getChildList(member.getMember_id(), startDate, endDate).getQnaList());
	    	log.debug("등록한 Qna 목록은" + qnaList);
	    	
	    	paging.init(qnaList, request); 			//페이징 처리
	    	mav.addObject("qnaList", qnaList);
	    } 
        
        //배송지 및 환불계좌 조회 요청 처리
        else if("delivery-payment".equals(page)) {
        	Member loginnedMember = memberService.selectById(member.getId());
        	orderSummaryList = orderSummaryService.selectByMember(loginnedMember);
	    	List<Delivery> deliveryList = loginnedMember.getDeliveryList();
	    	
	    	log.debug("배송지 정보 요청 회원은 "+loginnedMember);
	    	log.debug("주문요약 리스트는 "+orderSummaryList);
	    	log.debug("배송지 정보 리스트는 "+deliveryList);
	    	
	    	mav.addObject("orderSummaryList", orderSummaryList);
	    	mav.addObject("deliveryList", deliveryList);
        }
        mav.addObject("paging", paging);

	    return mav;
	}

	
	//상세 주문 목록 페이지 요청 처리
	@GetMapping("/mypage/order/detail")
	public ModelAndView getOrderDetail(@RequestParam(value = "status_type", required = false, defaultValue = "delivery") String statusType,
									   @RequestParam(value = "order_summary_id") int id,
									   HttpSession session, HttpServletRequest request) {
		
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
	
	//Qna 답변 상세 페이지 요청 처리
	@GetMapping("/mypage/detail")
	public ModelAndView getAnswerDetail(@RequestParam(value = "qna_id") int id, HttpSession session) {
		
		//로그인 체크
	    Member member = (Member) session.getAttribute("member");
	    if (member == null) {
			session.invalidate();
	        return new ModelAndView("redirect:/shop/member/loginform");
	    }
		
		ModelAndView mav = new ModelAndView("shop/mypage/qnaDetail");
		Qna qna = qnaService.select(id);
		mav.addObject("qna", qna);
		
		return mav;
	}
	
	//회원정보 수정 및 삭제 비밀번호 체크 요청 처리
	@PostMapping("/mypage/check-password")
	public String checkPassword(@RequestParam(value = "page", required = false) String page, 
								@RequestParam("password") String inputPassword, HttpSession session) {
	    
		//로그인 체크
		Member member = (Member) session.getAttribute("member");
	    if (member == null) {
	    	session.invalidate();
	        return "redirect:/shop/member/loginform";
	    }
	    log.debug("해시값 = "+member.getPassword());

	    //비밀번호 검증 로직
	    String password= PasswordUtil.hashPassword(inputPassword, member.getSalt());
	    log.debug("사용자입력 pwd 해시값 = "+password);
	    if (!password.equals(member.getPassword())) {
	    	session.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
	    	if ("cancel".equals(page)) {
	            return "redirect:/shop/mypage/list?page=cancel&tab=check-pwd";
	        } else {
	            return "redirect:/shop/mypage/list?page=edit-mypage&tab=check-pwd";
	        }
	    }

	    //성공 시 세션에 인증 정보 저장
	    log.debug("비밀번호 확인 성공");
	    session.setAttribute("pwdChecked", true);
	    if ("cancel".equals(page)) {
	        return "redirect:/shop/mypage/list?page=cancel&tab=cancel-info";
	    } else {
	        return "redirect:/shop/mypage/list?page=edit-mypage&tab=edit-detail";
	    }
	}
	
	//회원정보 수정 요청 처리
	@PostMapping("/mypage/updateInfo")
	public String updateInfo(@RequestParam("id") String id, @RequestParam("password") String inputPassword, 
							 @RequestParam("phone") String phone) {
		memberService.edit(memberService.selectById(id), inputPassword, phone);
		
		return "redirect:/shop/main";
	}
	
	//회원정보 삭제 요청 처리
	@PostMapping("/mypage/delete")
	public String delete(@RequestParam("member_id") int member_id, @RequestParam("page") String page, 
						 RedirectAttributes redirectAttributes, HttpSession session) {
		memberService.remove(member_id);
		redirectAttributes.addFlashAttribute("deleted", true);
		session.invalidate(); // 세션은 마지막에 끊음
		return "redirect:/shop/mypage/list?page=cancel&tab=cancel-complete"; // 전용 탈퇴완료 페이지로 이동
	}
	
}
