package shoppingmall.admin.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.domain.ResponseMessage;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.model.member.MemberService;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;

	@PostMapping("/login")
	@ResponseBody
	public ResponseEntity<ResponseMessage<String>> login(
			@RequestParam(name = "email", required = true) String email, 
			@RequestParam(name = "password", required = true) String password, 
			HttpSession session, 
			HttpServletResponse response
	) throws MemberNotFoundException, MemberRegistException {
		log.debug("로그인 Email : {}", email);
		log.debug("로그인 Password : {}", password);
		Member member = new Member();
		member.setId(email);
		member.setPassword(password);
		ResponseMessage<String> responseMessage = new ResponseMessage<>();
		try {
			Member resultMember = memberService.login(member);
			if(resultMember.getPoint_remained() >= 100000) {
				responseMessage.setResult(true);
				session.setAttribute("loginAdmin", resultMember);
			} else {
				responseMessage.setResult(false);
				responseMessage.setErrorMessage("권한이 없는 유저 입니다.");
			}
		} catch (Exception e) {
			responseMessage.setResult(false);
			responseMessage.setErrorMessage(e.getMessage());
		}
		return ResponseEntity.ok(responseMessage);
	}
	
	@PostMapping("/logout")
	public ResponseEntity<ResponseMessage<String>> logout(HttpSession session) {
		Member sessionMember = (Member) session.getAttribute("loginAdmin");
		if(sessionMember != null) {
			session.invalidate();
		}
		ResponseMessage<String> responseMessage = new ResponseMessage<>();
		responseMessage.setResult(true);
		responseMessage.setData("success");
		return ResponseEntity.ok(responseMessage);
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
