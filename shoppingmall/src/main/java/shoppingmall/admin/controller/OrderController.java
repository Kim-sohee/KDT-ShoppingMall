package shoppingmall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.Status;
import shoppingmall.model.order.OrderSummaryService;
import shoppingmall.util.Paging;

@Slf4j
@Controller
public class OrderController {
	
	@Autowired
	private OrderSummaryService orderSummaryService;
	@Autowired
	private Paging paging;
	
	
	@GetMapping("/order/history/listpage")
	public ModelAndView getOrderListPage(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum,
			@RequestParam(name = "status_id", required = false) String statusId) {
		Status status = new Status();
		if (statusId != null) {
			status.setStatus_id(Integer.parseInt(statusId));
		}
		int currentPage = Integer.parseInt(pagenum);
		int totalRecord = orderSummaryService.totalRecord(status);
		log.debug("totalRecored {}", totalRecord);
		log.debug("currentPage {}", currentPage);
		paging.init(totalRecord, currentPage);
		List<OrderSummary> orderSummaries = orderSummaryService.selectByOrder(paging.getPageSize(), currentPage);
		ModelAndView modelAndView = new ModelAndView("/views/management/order/history");
		modelAndView.addObject("orderSummaries", orderSummaries);
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}

	@GetMapping("/order/inquiry/listpage")
	public ModelAndView getInquiryListPage(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum,
			@RequestParam(name = "status_id", required = false) String statusId) {
		Status status = new Status();
		if (statusId != null) {
			status.setStatus_id(Integer.parseInt(statusId));
		}
		int currentPage = Integer.parseInt(pagenum);
		int totalRecord = orderSummaryService.totalRecord(status);
		log.debug("totalRecored {}", totalRecord);
		log.debug("currentPage {}", currentPage);
		paging.init(totalRecord, currentPage);
		List<OrderSummary> orderSummaries = orderSummaryService.selectByInquiry(paging.getPageSize(), currentPage);
		ModelAndView modelAndView = new ModelAndView("/views/management/order/inquiry");
		modelAndView.addObject("orderSummaries", orderSummaries);
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}

	@GetMapping("/order/return/listpage")
	public ModelAndView getReturnListPage(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum,
			@RequestParam(name = "status_id", required = false) String statusId) {
		Status status = new Status();
		if (statusId != null) {
			status.setStatus_id(Integer.parseInt(statusId));
		}
		int currentPage = Integer.parseInt(pagenum);
		int totalRecord = orderSummaryService.totalRecord(status);
		log.debug("totalRecored {}", totalRecord);
		log.debug("currentPage {}", currentPage);
		paging.init(totalRecord, currentPage);
		List<OrderSummary> orderSummaries = orderSummaryService.selectByReturn(paging.getPageSize(), currentPage);
		ModelAndView modelAndView = new ModelAndView("/views/management/order/return");
		modelAndView.addObject("orderSummaries", orderSummaries);
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}
	
	
	@GetMapping("/order/history/list")
	@ResponseBody
	public ResponseEntity<String> getOrderList(
			@RequestParam(name = "member_id", required = false) String memberId 
	){
		if(memberId != null) {
			Member member = new Member();
			member.setMember_id(Integer.parseInt(memberId));
			//TODO("멤버 기준으로 주문 내역 불러오기")			
		} else {
			//TODO("전체 주문내역 불러오기")
		}
		return null;
	}
	
	@GetMapping("/order/detail")
	public ModelAndView getOrderDetail(@RequestParam(name = "order_id", required = false) Integer orderId) {
		ModelAndView modelAndView = new ModelAndView("/views/management/order/history_detail");
		return modelAndView;
	}
	
	
	
	
}
