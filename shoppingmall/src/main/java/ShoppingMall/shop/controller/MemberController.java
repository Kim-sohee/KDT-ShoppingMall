package shoppingmall.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shoppingmall.domain.Member;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.model.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//로그인 폼 요청 처리
	@GetMapping("/member/loginform")
	public String getLoginForm() {
		return "shop/login";
	}
	
	//홈페이지 로그인 요청 처리
	@PostMapping("/member/login")
	public String login(Member member, HttpSession session) {
		Member loginSuccessMember = memberService.login(member);
		session.setAttribute("member", loginSuccessMember);
		return "redirect:shop/main";
	}
	
	//로그아웃 요청 처리
	@GetMapping("/memger/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 초기화하여 로그인 연결 해제 
		return "redirect:shop/main";
	}
	
	//회원가입폼 요청 처리
	@GetMapping("/member/joinform")
	public String getRegistForm() {
		return "shop/join";
	}
	
	//회원가입 요청 처리
	@PostMapping("/member/join")
	public String regist(Member member) throws MemberRegistException {
		memberService.regist(member);
		return "redirect:shop/joinComplete";
	}
	
	/*-------------------------------------------------
	 * SNS 로그인 요청 처리 : Google
	-------------------------------------------------*/
	//인증 동의화면 요청 처리
	
	
	//구글에 등록해 놓은 콜백 주소로 전송되는 콜백 요청 처리
	
	
	/*-------------------------------------------------
	 * SNS 로그인 요청 처리 : Naver
	-------------------------------------------------*/
	
}
