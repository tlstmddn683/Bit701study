<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	session.removeAttribute("loginstate");
	//메인 이동
	response.sendRedirect("sessionmain.jsp");

%>