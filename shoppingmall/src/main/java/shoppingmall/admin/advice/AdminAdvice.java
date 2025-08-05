package shoppingmall.admin.advice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class AdminAdvice {

	@ModelAttribute("navMenu")
	public String getNavMenu(HttpServletRequest request) {
		String uri = request.getRequestURI();
		
		if(uri.endsWith("/order/history/list")) {
			return "orderHistory";
		}
		
		if(uri.endsWith("/order/inquiry/list")) {
			return "orderInquiry";
		}
		
		if(uri.endsWith("/order/return/list")) {
			return "orderReturn";
		}
		
		if(uri.endsWith("/product/list")) {
			return "productList";
		}
		
		if(uri.endsWith("/member/list")) {
			return "memberList";
		}
		
		if(uri.endsWith("/cs/qna/listpage")) {
			return "csQnaList";
		}
		
		return null;
	}
}
