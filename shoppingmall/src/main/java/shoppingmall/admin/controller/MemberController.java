package shoppingmall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.domain.ResponseMessage;
import shoppingmall.model.member.MemberService;
import shoppingmall.util.Paging;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private Paging paging;
	
	@GetMapping("/member/listpage")
	public ModelAndView getMemberListPage(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum
			) {
		int totalRecord = memberService.totalRecord();
		int currentPage = Integer.parseInt(pagenum);
		paging.init(totalRecord, currentPage);
		List<Member> members = memberService.selectByPage(paging.getPageSize(), paging.getCurPos());
		ModelAndView modelAndView = new ModelAndView("/management/member/list");
		modelAndView.addObject("members", members);
		modelAndView.addObject("paging", paging);
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
	
	@GetMapping("/member/total")
	@ResponseBody
	public ResponseEntity<ResponseMessage<Integer>> totalMemberCount() {
		ResponseMessage<Integer> responseMessage = new ResponseMessage<>();
		try {
			int count = memberService.totalRecord();
			responseMessage.setResult(true);
			responseMessage.setData(count);
		} catch (Exception e) {
			responseMessage.setResult(false);
			responseMessage.setErrorMessage(e.getMessage());
		}
		return ResponseEntity.ok(responseMessage);
	}
}
