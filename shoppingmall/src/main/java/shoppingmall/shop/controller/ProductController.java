package shoppingmall.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.domain.Product;
import shoppingmall.domain.Qna;
import shoppingmall.model.product.AgeRangeService;
import shoppingmall.model.product.DifficultyService;
import shoppingmall.model.product.PlayerRangeService;
import shoppingmall.model.product.ProductService;
import shoppingmall.model.product.QnaService;
import shoppingmall.model.product.ReviewService;
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
	
	//가지고온 product에 대한 리뷰 가지고 오기
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private QnaService qnaService;
	
	//상품 필터링 목록 조회
	@GetMapping("/product/list")
	public ModelAndView getList(HttpServletRequest request, Product product) {
		List<Product> productList = productService.selectProductByFilter(product);
		
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
		
		//각 상품의 별점과 리뷰 수
		Map<Integer, Double> avgRatingMap = new HashMap<>();	//평균 별점
		Map<Integer, Integer> reviewCountMap = new HashMap<>();		//리뷰 개수
		for(int p=0; p<productList.size(); p++) {
			Product pd = productList.get(p);
			int productId = pd.getProduct_id();
			double avgRating = 0.0;
			int reviewCount = 0;
			
			avgRating = reviewService.AvgRating(productId);
			reviewCount = reviewService.CountReview(productId);
			
			avgRatingMap.put(productId, avgRating);
			reviewCountMap.put(productId, reviewCount);
		}
		
		mav.addObject("avgRatingMap", avgRatingMap);
		mav.addObject("reviewCountMap", reviewCountMap);
		
		return mav;
	}
	
	//검색을 통한 상품 리스트 가져오기
	@GetMapping("/product/search/list")
	@ResponseBody
	public List selectProductSearchName(String product_name) {
		List searchProductList = productService.selectProductSearchName(product_name);
		return searchProductList;
	}
	@GetMapping("/product/search/go")
	public String goToProductDetail(@RequestParam("product_name") String product_name, RedirectAttributes redirectAttributes) {
	    List<Product> products = productService.selectProductSearchName(product_name);

	    if (products != null && !products.isEmpty()) {
	        // 검색어와 일치하는 첫 번째 상품으로 이동
	        int productId = products.get(0).getProduct_id(); // 혹은 getProductId() 등
	        return "redirect:/shop/product/detail?product_id=" + productId;
	    } else {
	        // 검색 결과가 없을 경우 검색 페이지로 다시 이동 또는 알림 처리
	        redirectAttributes.addFlashAttribute("error", "검색 결과가 없습니다.");
	        return "redirect:/product/search/list";
	    }
	}
	
	
	//상품 하나 detail 페이지로 들어가기
	@GetMapping("/product/detail")
	public ModelAndView getDetail(@RequestParam(value="product_id", required=false) int product_id) {
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
	    //QNA 가져오기
	    List<Qna> qna = qnaService.selectAll();
	    //Qna 갯수 가져오기
	    int qna_count= qnaService.count(product_id);
	    
	   
	    
	    mav.addObject("ratingMap", ratingMap);
	    mav.addObject("product", product); 
	    mav.addObject("reviews",reviews);
	    mav.addObject("rating",rating);
	    mav.addObject("count",count);
	    mav.addObject("ratingMap", ratingMap);
	    mav.addObject("qna",qna);
	    mav.addObject("qna_count",qna_count);
	    mav.setViewName("shop/product/detail");

	    return mav;
	}
	
	@PostMapping("/product/qna/regist")
	public String registQna(Qna qna, HttpSession session, int product_id) {
	    Member loginMember = (Member) session.getAttribute("member");
	    Product product = productService.select(product_id);
	    qna.setMember(loginMember);
	    qnaService.insert(qna);
	    return "redirect:/shop/product/detail?product_id=" +product.getProduct_id() ;
	}
}