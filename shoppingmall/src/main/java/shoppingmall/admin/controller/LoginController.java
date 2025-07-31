package shoppingmall.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.domain.ResponseMessage;

@Controller
public class LoginController {

	@PostMapping("/login")
	@ResponseBody
	public ResponseMessage<String> login(String id, String password, HttpSession session) {
		ResponseMessage<String> responseMessage = new ResponseMessage<>();
		responseMessage.setResult(true);
		responseMessage.setData("로그인 성공");
		return responseMessage;
	}

	@GetMapping("/loginpage")
	public String getLoginPage() {
		return "/management/login";
	}

	@GetMapping("/find/idpage")
	public String getFindIdPage() {
		return "/management/find/id";
	}

	@PostMapping("/find/id")
	public String findId(Model model) {
		return "/management/find/result";
	}

	@GetMapping("/find/passwordpage")
	public String getFindPasswordPage() {
		return "/management/find/password";
	}

	@PostMapping("/find/password")
	public String findPassword(Model model) {
		return "/management/find/password-change";
	}

	@PostMapping("/change/password")
	public String changePassword(@RequestParam(required = false) String Password) {
		return "/management/find/result";
	}

}
