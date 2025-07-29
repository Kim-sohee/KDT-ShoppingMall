package shoppingmall.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class MainController {
	@GetMapping("/main")
	public ModelAndView getMain() {
		ModelAndView mav= new ModelAndView("shop/main");
		return mav;
	}
	
}
