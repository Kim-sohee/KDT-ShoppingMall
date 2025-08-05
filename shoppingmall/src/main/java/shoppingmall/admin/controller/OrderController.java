package shoppingmall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.ResponseMessage;
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
	@Autowired
	private ObjectMapper objectMapper;
	
	
	@GetMapping("/order/history/listpage")
	public ModelAndView getOrderListPage(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum,
			@RequestParam(name = "status_id", required = false, defaultValue = "1") String statusId) {
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
		ModelAndView modelAndView = new ModelAndView("/management/order/history");
		modelAndView.addObject("orderSummaries", orderSummaries);
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}

	@GetMapping("/order/inquiry/listpage")
	public ModelAndView getInquiryListPage(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum,
			@RequestParam(name = "status_id", required = false, defaultValue = "7") String statusId) {
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
		ModelAndView modelAndView = new ModelAndView("/management/order/inquiry");
		modelAndView.addObject("orderSummaries", orderSummaries);
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}

	@GetMapping("/order/return/listpage")
	public ModelAndView getReturnListPage(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum,
			@RequestParam(name = "status_id", required = false, defaultValue = "6") String statusId) {
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
		ModelAndView modelAndView = new ModelAndView("/management/order/return");
		modelAndView.addObject("orderSummaries", orderSummaries);
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}
	
	@GetMapping("/order/{type:history|inquiry|return}/detail")
	public ModelAndView getOrderDetailPage(
			@RequestParam(name = "order_summery_id", required = true) String orderSummeryId) {
		OrderSummary orderSummary = orderSummaryService.select(Integer.parseInt(orderSummeryId));
		ModelAndView modelAndView = new ModelAndView("/management/order/detail");
		modelAndView.addObject("orderSummary", orderSummary);
		return modelAndView;
	}
	
	
	@GetMapping("/order/history/list")
	@ResponseBody
	public ResponseEntity<String> getOrderListByMemberId(
			@RequestParam(name = "member_id", required = true) String memberId 
	){
		Member member = new Member();
		member.setMember_id(Integer.parseInt(memberId));
		List<OrderSummary> orderSummaries = orderSummaryService.selectByMember(member);
		try {
			String json = objectMapper.writeValueAsString(orderSummaries);
			return ResponseEntity.ok(json);
		} catch (JsonProcessingException e) {
			return null;
		}
	}
	
	@GetMapping("/order/detail")
	public ModelAndView getOrderDetail(@RequestParam(name = "order_id", required = false) Integer orderId) {
		ModelAndView modelAndView = new ModelAndView("/management/order/history_detail");
		return modelAndView;
	}
	
	@GetMapping("/order/history/neworders")
	@ResponseBody
	public ResponseEntity<ResponseMessage<Integer>> getNewOrder() {
		ResponseMessage<Integer> responseMessage = new ResponseMessage<>();
		try {
			int count = orderSummaryService.newOrderCount();
			responseMessage.setResult(true);
			responseMessage.setData(count);
		} catch (Exception e) {
			responseMessage.setResult(false);
			responseMessage.setErrorMessage(e.getMessage());
		}
		return ResponseEntity.ok(responseMessage);
	}
	
	
	
	
}
