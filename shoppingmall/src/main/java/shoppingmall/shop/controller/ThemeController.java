package shoppingmall.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.domain.Theme;
import shoppingmall.model.product.ThemeService;

@Controller
public class ThemeController {
	@Autowired
	private ThemeService themeService;
	
	@GetMapping("/theme/list")
	@ResponseBody
	public List selectAll() {
		List themeList = themeService.selectAll();
		return themeList;
	}
	
	//필터링 된 상품으로 바로 가기
	@GetMapping("/theme/selectname")
	public String selectThemeByName(String theme_name) {
		Theme theme = themeService.selectThemeByName(theme_name);
		int themeId = theme.getTheme_id();
		return "redirect:/shop/product/list?theme.theme_id="+themeId;
	}
}
