package shoppingmall.admin.advice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class AdminAdvice {

	@ModelAttribute("navMenu")
	public String getNavMenu(HttpServletRequest request) {
		String uri = request.getRequestURI();
		
		if(uri.endsWith("/order/history/listpage")) {
			return "orderHistory";
		}
		
		if(uri.endsWith("/order/inquiry/listpage")) {
			return "orderInquiry";
		}
		
		if(uri.endsWith("/order/return/listpage")) {
			return "orderReturn";
		}
		
		if(uri.endsWith("/product/listpage")) {
			return "productList";
		}
		
		if(uri.endsWith("/member/listpage")) {
			return "memberList";
		}
		
		if(uri.endsWith("/cs/qna/listpage")) {
			return "csQnaList";
		}
		
		return null;
	}
}
