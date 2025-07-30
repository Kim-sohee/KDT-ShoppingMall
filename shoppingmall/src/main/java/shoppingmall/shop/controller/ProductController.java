package shoppingmall.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.AgeRange;
import shoppingmall.domain.Difficulty;
import shoppingmall.domain.PlayerRange;
import shoppingmall.domain.Product;
import shoppingmall.domain.Theme;
import shoppingmall.model.product.AgeRangeService;
import shoppingmall.model.product.DifficultyService;
import shoppingmall.model.product.PlayerRangeService;
import shoppingmall.model.product.ProductService;
import shoppingmall.model.product.ThemeService;
import shoppingmall.util.Paging;

@Slf4j
@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	//필터링할 카테고리들 가져오기
	@Autowired
	private ThemeService themeService;
	@Autowired
	private PlayerRangeService playerRangeService;
	@Autowired
	private DifficultyService difficultyService;
	@Autowired
	private AgeRangeService ageRangeService;
	
	
	//상품 필터링 목록 조회
	@GetMapping("/product/list")
	public ModelAndView getList(HttpServletRequest request, Product product) {
		List productList = productService.selectProductByFilter(product);
		
		//페이징 처리
		Paging paging = new Paging();
		paging.init(productList, request);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("productList", productList);
		mav.addObject("paging", paging);
		mav.setViewName("shop/product/list");
		
		//필터링할 카테고리
		mav.addObject("themeList", themeService.selectAll());
		mav.addObject("playerRangeList", playerRangeService.selectAll());
		mav.addObject("difficultyList", difficultyService.selectAll());
		mav.addObject("ageRangeList", ageRangeService.selectAll());
		
		return mav;
	}

}
