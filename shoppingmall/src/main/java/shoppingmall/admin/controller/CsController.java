package shoppingmall.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CsController {
	
	@GetMapping("/cs/qna/listpage")
	public ModelAndView getQnaPage() {
		ModelAndView modelAndView = new ModelAndView("/management/cs/qna/list");
		return modelAndView;
	}
}
