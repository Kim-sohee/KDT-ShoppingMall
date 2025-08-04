package shoppingmall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.model.member.MemberService;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/list")
	public ModelAndView getMemberListPage() {
		List<Member> members = memberService.selectAll();
		ModelAndView modelAndView = new ModelAndView("/management/member/list");
		modelAndView.addObject("members", members);
		return modelAndView;
	}
	
	@GetMapping("/member/detail")
	public ModelAndView getMemberDetailPage(
			@RequestParam(name = "member_id", required = true) String memberId
	) {
		Member member = memberService.selectWithDelivery(Integer.parseInt(memberId));
		log.debug("조회 유저 : {}", member);
		ModelAndView modelAndView = new ModelAndView("/management/member/detail");
		modelAndView.addObject("member", member);
		return modelAndView;
	}
}
