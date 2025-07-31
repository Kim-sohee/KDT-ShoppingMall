package shoppingmall.shop.advice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import shoppingmall.model.product.ThemeService;

@ControllerAdvice
public class ShopAdvice {
	
	@Autowired
	private ThemeService themeService;
	
	//nav에 들어갈 상품 테마 전체 가져오기
	@ModelAttribute("themeList")
	public List getThemeList() {
		return themeService.selectAll();
	}
}
