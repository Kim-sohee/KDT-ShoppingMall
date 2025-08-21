<%@page import="shoppingmall.domain.Member"%>
<%@page import="shoppingmall.util.Paging"%>
<%@page import="shoppingmall.domain.OrderSummary"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String pageParam = request.getParameter("page");
	if (pageParam == null) pageParam = "order";
	request.setAttribute("pageParam", pageParam);
	
    Paging paging = (Paging)request.getAttribute("paging");
    
    Member member = (Member)request.getAttribute("member");
%>