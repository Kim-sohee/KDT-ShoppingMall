package shoppingmall.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

	@GetMapping("/product/list")
	public ModelAndView getProductList() {
		ModelAndView modelAndView = new ModelAndView("/management/product/list");
		return modelAndView;
	}
	
	@GetMapping("/product/detail")
	public ModelAndView getProductDetail(@RequestParam(name = "product_id", required = false) Integer product_id) {
		ModelAndView modelAndView = new ModelAndView("/management/product/detail");
		return modelAndView;
	}
	
	
	@GetMapping("/product/registform")
	public ModelAndView getProductRegistForm() {
		ModelAndView modelAndView = new ModelAndView("/management/product/regist");
		return modelAndView;
	}
}
