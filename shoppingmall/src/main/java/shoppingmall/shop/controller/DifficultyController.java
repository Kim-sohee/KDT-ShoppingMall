package shoppingmall.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.model.product.DifficultyService;

@Controller
public class DifficultyController {
	@Autowired
	private DifficultyService difficultyService;
	
	@GetMapping("/difficulty/list")
	@ResponseBody
	public List selectAll() {
		List difficultyList = difficultyService.selectAll();
		return difficultyList;
	}
}
