package shoppingmall.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import shoppingmall.model.product.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	//상품 목록 요청 처리
	@GetMapping("/shop/product/list")
	public ModelAndView getList(HttpServletRequest request) {
		List productList = productService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productList", productList);
		mav.setViewName("/product/list");
		
		return mav;
	}
}
