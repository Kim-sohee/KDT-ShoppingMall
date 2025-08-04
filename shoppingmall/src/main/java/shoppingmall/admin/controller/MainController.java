package shoppingmall.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	
	@GetMapping("/main")
	public String getMainPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		return "/management/index";
	}
}
