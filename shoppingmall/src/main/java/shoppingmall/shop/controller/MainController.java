package shoppingmall.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import shoppingmall.domain.Product;
import shoppingmall.model.order.OrderDetailService;

@Controller
public class MainController {
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView getMain() {
		List<Product> topProducts = orderDetailService.getTopSellingProducts();
		
		ModelAndView mav = new ModelAndView("shop/main"); // mav.setViewName(""); 과 동일한 효과
		mav.addObject("topProducts", topProducts);
		return mav;
	}
}