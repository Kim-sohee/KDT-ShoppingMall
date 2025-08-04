package shoppingmall.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shoppingmall.domain.Member;

public class AdminLoginFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		//더미 어드민 (테스트용)
		//Member dummyMember = createDummyAdmin();
		//session.setAttribute("loginAdmin", dummyMember);
		String uri = httpRequest.getRequestURI();
		
		// 로그인 페이지는 필터 제외
		if(uri.endsWith("loginpage") || uri.endsWith("login") || uri.endsWith("logout")) {
			chain.doFilter(httpRequest, httpResponse);
			return;
		}
		
		// page로 끝나는 요청에 대해서만 로그인 체크
		if(uri.endsWith("page")|| uri.endsWith("main")|| uri.endsWith("detail")) {
			Member member = (Member)session.getAttribute("loginAdmin");
			if (member == null || member.getPoint_remained() < 100000) {
				httpResponse.sendRedirect(request.getServletContext().getContextPath()+"/admin/loginpage");
				return;
			}
		}
		
		chain.doFilter(httpRequest, httpResponse);
	}
	
	@Override
	public void destroy() {
		
	}
	//		더미 어드민 (테스트용)
	private Member createDummyAdmin() {
		Member member = new Member();
		member.setMember_name("어드민");
		member.setPoint_remained(100000000);
		return member;
	}

}
