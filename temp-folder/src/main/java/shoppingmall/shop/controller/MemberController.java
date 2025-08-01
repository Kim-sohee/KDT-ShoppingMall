package shoppingmall.shop.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.model.member.MailService;
import shoppingmall.model.member.MemberService;

@Slf4j
@Controller
public class MemberController {

	@Autowired
    private OAuth20Service googleAuthService;
	
	@Autowired
	private OAuth20Service naverAuthService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MailService mailService;
	
	//로그인 폼 요청 처리
	@GetMapping("/member/loginform")
	public String getLoginForm() {
		return "shop/login";
	}
	
	//홈페이지 로그인 요청 처리
	@PostMapping("/member/login")
	public String login(Member member, HttpSession session) {
		Member loginSuccessMember = memberService.login(member);
		
		log.debug("로그인 성공했니? 성공한 회원 email은 " + loginSuccessMember.getEmail());
		
		session.setAttribute("member", loginSuccessMember);
		return "redirect:/shop/main";
	}
	
	//로그아웃 요청 처리
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 초기화하여 로그인 연결 해제 
		return "redirect:/shop/main";
	}
	
	//회원가입폼 요청 처리
	@GetMapping("/member/joinform")
	public String getRegistForm() {
		return "shop/join";
	}
	
	//회원가입 요청 처리
	@PostMapping("/member/join")
	public String regist(Member member) {
		memberService.regist(member);
		mailService.sendJoinMail(member);
		return "redirect:/shop/member/joinCompleteForm";
	}
	
	//회원가입 완료 폼 요청 처리
	@GetMapping("/member/joinCompleteForm")
	public String getJoinCompleteForm() {
		return "shop/joinComplete";
	}
	
	//아이디&비밀번호 찾기 폼 요청 처리
	@RequestMapping(value="/member/findForm", method=RequestMethod.GET)
	public ModelAndView getFind() {
		ModelAndView mav = new ModelAndView("shop/findForm");
		return mav;
	}
	
	//아이디&비밀번호 찾기 요청 처리
	@RequestMapping(value="/member/find", method=RequestMethod.POST)
	public ModelAndView getInfo(@RequestParam Map<String, String> paramMap) {
		String type = paramMap.get("type"); // "email" 또는 "password"
		
		Member member = new Member();
		member.setMember_name(paramMap.get("member_name"));
		if("id".equals(type)) {
			member.setPhone(paramMap.get("phone"));
		} else if("password".equals(type)){
			member.setId(paramMap.get("id")); //비밀번호 찾기			
		}

		mailService.sendFindMail(member, type);
		
		return new ModelAndView("shop/getInfo");
	}
	
	/*-------------------------------------------------
	 * SNS 로그인 요청 처리 : Google
	-------------------------------------------------*/
	//인증 동의화면 요청 처리
	@GetMapping("/member/google/authurl")
	@ResponseBody
	public String getGoogleAuthUrl() {
		return googleAuthService.getAuthorizationUrl();
	}
	
	//구글에 등록해 놓은 콜백 주소로 전송되는 콜백 요청 처리
	@GetMapping("/callback/sns/google")
	public String googleCallback(@RequestParam("code") String code, HttpSession session) throws IOException, InterruptedException, ExecutionException {
		//IDP가 전송한 code와 client Id, client Secret을 조합하여 토큰 요청
		//client ID, client Secret은 빈 등록 시 이미 등록한 것들을 사용 
		OAuth2AccessToken accessToken=googleAuthService.getAccessToken(code); 
		
		log.debug("구글이 전송해준 인증 코드는 "+code);
		log.debug("구글이 전송해준 토큰은 "+accessToken);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://www.googleapis.com/oauth2/v2/userinfo");
		googleAuthService.signRequest(accessToken, request); //요청 시 사용할 토큰 지정
		Response response = googleAuthService.execute(request); //사용자 정보 요청 시도
		
		//json 파싱
		JsonObject json = JsonParser.parseString(response.getBody()).getAsJsonObject();
		
		//필요한 개인정보를 key값으로 조회하여 가져오기
		String email = json.get("email").getAsString();
		String name = json.get("name").getAsString();
		String openid = json.get("id").getAsString(); //sns provider가 회원을 구분하기 위한 내부 식별 id일 뿐 회원이 직접 생성한 id가 아님
		
		//토큰을 통해 얻은 회원정보가 쇼핑몰에 등록되어 있는지(회원가입여부) 체크
		Member member = null;
		
		//sns 로그인 회원 정보 member 객체에 담기
		member = new Member();
		member.setSns_provider("google");
		member.setId(openid);
		member.setEmail(email);
		member.setMember_name(name);
		
		log.debug("식별자인 openId는 "+ openid);
		
		//서비스가 판단해서 로그인 혹은 회원가입 후 로그인 처리
		Member loginSuccessMember = memberService.login(member);
		log.debug("로그인한 회원은 " + loginSuccessMember);
	
		//세션에 로그인 정보 저장
		session.setAttribute("member", loginSuccessMember);
		
		//로그인 완료 후 메인페이지 이동
		return "redirect:/shop/main"; 
	}
	
	/*-------------------------------------------------
	 * SNS 로그인 요청 처리 : Naver
	-------------------------------------------------*/
	//인증 동의화면 요청 처리
	@GetMapping("/member/naver/authurl")
	@ResponseBody
	public String getNaverAuthUrl() {
		return naverAuthService.getAuthorizationUrl();
	}
	
	@GetMapping("/callback/sns/naver")
	public String naverCallback(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session) throws IOException, InterruptedException, ExecutionException  {
		//IDP가 전송한 code와 client Id, client Secret을 조합하여 토큰 요청
		//client ID, client Secret은 빈 등록 시 이미 등록한 것들을 사용 
		OAuth2AccessToken accessToken = naverAuthService.getAccessToken(code);
		
		//발급받은 토큰을 이용하여 회원정보 조회
		OAuthRequest request = new OAuthRequest(Verb.GET, "https://openapi.naver.com/v1/nid/me");
		naverAuthService.signRequest(accessToken, request);
		Response response = naverAuthService.execute(request);
		
		JsonObject responseJson = JsonParser.parseString(response.getBody()).getAsJsonObject();
		
		JsonObject userJson = responseJson.getAsJsonObject("response");
		
		log.debug("응답객체 생성 완료");
		
		String id = userJson.get("id").getAsString();
		String email = userJson.get("email").getAsString();
		String name = userJson.get("name").getAsString();
		
		//토큰을 통해 얻은 회원정보가 쇼핑몰에 등록되어 있는지(회원가입여부) 체크
		Member member = null;
		
		//sns 로그인 회원 정보 member 객체에 담기
		member = new Member();
		member.setSns_provider("naver");
		member.setId(id);
		member.setEmail(email);
		member.setMember_name(name);
		
		log.debug("식별자인 id는 "+ id);
		
		//서비스가 판단해서 로그인 혹은 회원가입 후 로그인 처리
		Member loginSuccessMember = memberService.login(member);
		log.debug("로그인한 회원은 " + loginSuccessMember);
	
		//세션에 로그인 정보 저장
		session.setAttribute("member", loginSuccessMember);
		
		//로그인 완료 후 메인페이지 이동
		return "redirect:/shop/main"; 
		
	}
}
