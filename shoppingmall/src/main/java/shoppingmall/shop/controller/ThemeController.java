package shoppingmall.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
