package shoppingmall.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@GetMapping("/member/list")
	public ModelAndView getMemberListPage() {
		ModelAndView modelAndView = new ModelAndView("/management/member/list");
		return modelAndView;
	}
	
	@GetMapping("/member/detail")
	public ModelAndView getMemberDetailPage() {
		ModelAndView modelAndView = new ModelAndView("/management/member/detail");
		return modelAndView;
	}
}
