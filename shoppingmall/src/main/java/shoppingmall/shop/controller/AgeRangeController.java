package shoppingmall.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.model.product.AgeRangeService;

@Controller
public class AgeRangeController {
	@Autowired
	private AgeRangeService ageRangeService;
	
	@GetMapping("/ageRange/list")
	@ResponseBody
	public List selectAll() {
		List ageRangeList = ageRangeService.selectAll();
		return ageRangeList;
	}
}
