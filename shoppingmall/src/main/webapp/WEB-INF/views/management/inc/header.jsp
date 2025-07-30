<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String title = (String)request.getAttribute("header_title"); %>
<% if(title == null) {
	title = "Sinse Games";
} %>
<nav class="navbar navbar-light bg-primary ">
		<a class="navbar-brand" href="#"> <%= title %> </a>
	</nav>