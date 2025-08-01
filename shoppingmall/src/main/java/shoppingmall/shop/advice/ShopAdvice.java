package shoppingmall.shop.advice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import shoppingmall.model.product.ProductService;
import shoppingmall.model.product.ThemeService;

@ControllerAdvice
public class ShopAdvice {
	
	@Autowired
	private ThemeService themeService;
	
	@Autowired
	private ProductService productService;
	
	//nav에 들어갈 상품 테마 전체 가져오기
	@ModelAttribute("themeList")
	public List getThemeList() {
		return themeService.selectAll();
	}
	
	//header에 들어있는 검색창에서 필터링된 상품 가져오기
	@ModelAttribute("searchProductList")
	public List getProductList(String product_name) {
		return productService.selectProductSearchName(product_name);
	}
}
