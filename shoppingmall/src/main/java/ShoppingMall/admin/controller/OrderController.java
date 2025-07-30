package shoppingmall.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@GetMapping("/order/history/list")
	public ModelAndView getOrderListPage() {
		ModelAndView mav = new ModelAndView("/management/order/history");
		return mav;
	}
	
	@GetMapping("/order/detail")
	public ModelAndView getOrderDetail(@RequestParam(name = "order_id", required = false) Integer orderId) {
		ModelAndView modelAndView = new ModelAndView("/management/order/history_detail");
		return modelAndView;
	}
	
	
	@GetMapping("/order/inquiry/list")
	public ModelAndView getInquiryListPage() {
		ModelAndView mav = new ModelAndView("/management/order/inquiry");
		return mav;
	}
	
	@GetMapping("/order/return/list")
	public ModelAndView getReturnListPage() {
		ModelAndView mav = new ModelAndView("/management/order/return");
		return mav;
	}
	
}
