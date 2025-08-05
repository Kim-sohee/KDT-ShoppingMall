package shoppingmall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.AgeRange;
import shoppingmall.domain.Difficulty;
import shoppingmall.domain.PlayerRange;
import shoppingmall.domain.Product;
import shoppingmall.domain.Theme;
import shoppingmall.domain.request.ProductDto;
import shoppingmall.model.product.AgeRangeService;
import shoppingmall.model.product.DifficultyService;
import shoppingmall.model.product.PlayerRangeService;
import shoppingmall.model.product.ProductService;
import shoppingmall.model.product.ThemeService;
import shoppingmall.util.Paging;

@Slf4j
@Controller
@Qualifier("adminProductController")
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ThemeService themeService;
	@Autowired
	private DifficultyService difficultyService;
	@Autowired
	private AgeRangeService ageRangeService;
	@Autowired
	private PlayerRangeService playerRangeService;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private Paging paging;

	@PostMapping("/product/regist")
	@Transactional
	public ResponseEntity<String> regist(@RequestParam(value = "productData", required = true) String productData,
			@RequestParam(value = "files", required = false) MultipartFile[] files, HttpServletRequest request) {
		try {
			ProductDto productDto;

			if (productData != null && !productData.trim().isEmpty()) {
				productDto = objectMapper.readValue(productData, ProductDto.class);
			} else {
				log.error("productData is null or empty: {}", productData);
				return ResponseEntity.badRequest().body("Invalid request format - productData is missing");
			}

			if (files != null) {
				log.debug("files count: {}", files.length);
				for (MultipartFile file : files) {
					if (!file.isEmpty()) {
						log.debug("file: {}, size: {}", file.getOriginalFilename(), file.getSize());
						productDto.getFiles().add(file);
					}
				}
			}
			String saveImagePath = request.getServletContext().getRealPath("/data");
			productService.regist(productDto, saveImagePath);
			return ResponseEntity.ok("상품이 성공적으로 등록되었습니다.");
		} catch (Exception e) {
			log.error("Product registration error", e);
			return ResponseEntity.badRequest().body("등록 중 오류가 발생했습니다: " + e.getMessage());
		}
	}

	@PostMapping("/product/update")
	@Transactional
	public ResponseEntity<String> update(@RequestParam(value = "productData", required = true) String productData,
			@RequestParam(value = "files", required = false) MultipartFile[] files, HttpServletRequest request) {
		ProductDto productDto;
		try {
			if (productData != null && !productData.trim().isEmpty()) {
				productDto = objectMapper.readValue(productData, ProductDto.class);
			} else {
				log.error("상품데이터가 없음: {}", productData);
				return ResponseEntity.badRequest().body("Invalid request format - productData is missing");
			}

			if (files != null) {
				log.debug("파일 갯수 : {}", files.length);
				for (MultipartFile file : files) {
					if (!file.isEmpty()) {
						log.debug("파일 이름: {}, 파일크기: {}", file.getOriginalFilename(), file.getSize());
						productDto.getFiles().add(file);
					}
				}
			}
			
			String saveImagePath = request.getServletContext().getRealPath("/data");
			productService.update(productDto, saveImagePath);
			return ResponseEntity.ok("상품이 성공적으로 업데이트되었습니다.");
		} catch (Exception e) {
			log.error("상품 등록 오류", e);
			return ResponseEntity.badRequest().body("등록 중 오류가 발생했습니다: " + e.getMessage());
		}
	}

	@GetMapping("/product/listpage")
	public ModelAndView getProductList(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum,
			@RequestParam(name = "theme_id", required = false) String themeId) {
		int totalCount = 0;
		List<Theme> themes = themeService.selectAll();
		if (themeId != null) {
			Theme theme = new Theme();
			theme.setTheme_id(Integer.parseInt(themeId));
			totalCount = productService.totalCount(theme);
		} else {
			totalCount = productService.totalCount();
		}

		int currentPage = Integer.parseInt(pagenum);
		paging.init(totalCount, currentPage);
		List<Product> products = null;
		if (themeId != null) {
			products = productService.selectByThemeWithPage(Integer.parseInt(themeId), paging.getPageSize(),
					paging.getCurrentPage());
		} else {
			products = productService.selectByPage(paging.getPageSize(), paging.getCurrentPage());
		}
		log.debug("products - {}", products);
		log.debug("totalProductCount : {}", totalCount);
		ModelAndView modelAndView = new ModelAndView("/management/product/list");
		modelAndView.addObject("themes", themes);
		modelAndView.addObject("currentThemeId", themeId);
		modelAndView.addObject("products", products);
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}
	
	@GetMapping("/product/detail")
	public ModelAndView getProductDetail(@RequestParam(name = "product_id", required = false) Integer product_id) {
		List<Theme> themes = themeService.selectAll();
		List<Difficulty> difficulties = difficultyService.selectAll();
		List<AgeRange> ageRanges = ageRangeService.selectAll();
		List<PlayerRange> playerRanges = playerRangeService.selectAll();
		Product product = productService.select(product_id);
		ModelAndView modelAndView = new ModelAndView("/management/product/detail");
		modelAndView.addObject("themes", themes);
		modelAndView.addObject("difficulties", difficulties);
		modelAndView.addObject("ageRanges", ageRanges);
		modelAndView.addObject("playerRanges", playerRanges);
		modelAndView.addObject("product", product);
		return modelAndView;
	}

	@GetMapping("/product/modify")
	public ModelAndView getProductModify(@RequestParam(name = "product_id", required = false) Integer product_id) {
		List<Theme> themes = themeService.selectAll();
		List<Difficulty> difficulties = difficultyService.selectAll();
		List<AgeRange> ageRanges = ageRangeService.selectAll();
		List<PlayerRange> playerRanges = playerRangeService.selectAll();
		Product product = productService.select(product_id);
		ModelAndView modelAndView = new ModelAndView("/management/product/modify");
		modelAndView.addObject("themes", themes);
		modelAndView.addObject("difficulties", difficulties);
		modelAndView.addObject("ageRanges", ageRanges);
		modelAndView.addObject("playerRanges", playerRanges);
		modelAndView.addObject("product", product);
		return modelAndView;
	}

	@GetMapping("/product/registform")
	public ModelAndView getProductRegistForm() {
		List<Theme> themes = themeService.selectAll();
		List<Difficulty> difficulties = difficultyService.selectAll();
		List<AgeRange> ageRanges = ageRangeService.selectAll();
		List<PlayerRange> playerRanges = playerRangeService.selectAll();
		ModelAndView modelAndView = new ModelAndView("/management/product/regist");
		modelAndView.addObject("themes", themes);
		modelAndView.addObject("difficulties", difficulties);
		modelAndView.addObject("ageRanges", ageRanges);
		modelAndView.addObject("playerRanges", playerRanges);
		return modelAndView;
	}
}
