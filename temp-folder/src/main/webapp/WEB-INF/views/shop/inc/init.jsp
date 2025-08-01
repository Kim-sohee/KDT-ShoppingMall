<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String pageParam = request.getParameter("page");
    if (pageParam == null) pageParam = "order";
    request.setAttribute("pageParam", pageParam); // 공유
%>