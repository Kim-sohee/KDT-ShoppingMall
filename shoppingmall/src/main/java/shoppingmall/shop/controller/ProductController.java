package shoppingmall.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import shoppingmall.domain.Product;
import shoppingmall.domain.Review;
import shoppingmall.model.product.AgeRangeService;
import shoppingmall.model.product.DifficultyService;
import shoppingmall.model.product.PlayerRangeService;
import shoppingmall.model.product.ProductService;
import shoppingmall.model.product.ReviewService;
import shoppingmall.model.product.ThemeService;
import shoppingmall.util.Paging;

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
	
	//가지고온 product에 대한 리뷰 가지고 오기
	@Autowired
	private ReviewService reviewService;
	
	//상품 목록 요청 처리
	@GetMapping("/product/list")
	public ModelAndView getList(HttpServletRequest request) {
		List productList = productService.selectAll();
		
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
	
	//상품 하나 detail 페이지로 들어가기
	@GetMapping("/product/detail")
	public ModelAndView getDetail(int product_id) {
	    ModelAndView mav = new ModelAndView();

	    // 상품 1개 가져오기
	    Product product = productService.select(product_id);
	    //상품1개에 대한 리뷰 가져오기
	    List reviews = reviewService.selectByProductId(product_id);
	    //상품 한개에 대한 리뷰 평점 평균 가지고 오기
	    double rating = reviewService.AvgRating(product_id);
	    //상품의 총 개수 구해오기..
	    int count = reviewService.CountReview(product_id);
	    //상품의 별점 별 개수 가져오기 
	    Map<Integer, Integer> ratingMap = reviewService.getRatingDistribution(product_id);
	    
	    
	    mav.addObject("ratingMap", ratingMap);
	    mav.addObject("product", product); 
	    mav.addObject("reviews",reviews);
	    mav.addObject("rating",rating);
	    mav.addObject("count",count);
	    mav.addObject("ratingMap", ratingMap);
	    mav.setViewName("shop/product/detail");

	    return mav;
	}
}
