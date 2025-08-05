package shoppingmall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Qna;
import shoppingmall.domain.ResponseMessage;
import shoppingmall.exception.BadAccessQnaDetailPage;
import shoppingmall.model.product.QnaService;
import shoppingmall.util.Paging;

@Slf4j
@Controller
public class CsController {
	
	@Autowired
	private QnaService qnaService;
	@Autowired
	private Paging paging;
	@Autowired
	private ObjectMapper objectMapper;
	
	@GetMapping("/cs/qna/listpage")
	public ModelAndView getQnaPageList(
			@RequestParam(name = "pagenum", required = false, defaultValue = "1") String pagenum
	) {
		int totalRecored = qnaService.totalRecord();
		int currentPage = Integer.parseInt(pagenum);
		paging.init(totalRecored, currentPage);
		List<Qna> qnas = qnaService.selectAllOrderBy(paging.getPageSize(), paging.getCurPos());
		ModelAndView modelAndView = new ModelAndView("/management/cs/qna/list");
		modelAndView.addObject("qnas", qnas);	
		modelAndView.addObject("paging", paging);
		return modelAndView;
	}
	
	@GetMapping("/cs/qna/list")
	@ResponseBody
	public ResponseEntity<String> getQnaListByMember(
			@RequestParam(name = "member_id", required = true) String memberId) {
		List<Qna> qnas = qnaService.selectByMemberId(Integer.parseInt(memberId));
		log.debug("가져온 문의 {}", qnas);
		try {
			String json = objectMapper.writeValueAsString(qnas);
			log.debug("변경한 문자 {}", json);
			return ResponseEntity.ok(json);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
	} 
	
	@GetMapping("/cs/qna/detail")
	public ModelAndView getQnaDetailPage (
			@RequestParam(name = "qna_id", required = true) String qnaId
	) throws BadAccessQnaDetailPage {
		if(qnaId == null) {
			throw new BadAccessQnaDetailPage("QnA 아이디가 없습니다.");
		}
		Qna qna = qnaService.select(Integer.parseInt(qnaId));
		log.debug("Selected Qna : {}",qna);
		ModelAndView modelAndView = new ModelAndView("/management/cs/qna/detail");
		modelAndView.addObject("qna", qna);
		return modelAndView;
	}
	
	@PostMapping("/cs/qna/update")
	@ResponseBody
	public ResponseEntity<ResponseMessage<String>> updateQnA(
		@RequestBody Qna qna
	){	
		log.debug("Update Qna : {}", qna);
		ResponseMessage<String> responseMessage = new ResponseMessage<>();
		try {
			qnaService.updateFromAdmin(qna);		
			responseMessage.setResult(true);
		} catch (Exception e) {			
			responseMessage.setResult(false);
		}
		return ResponseEntity.ok(responseMessage);
	}
}
