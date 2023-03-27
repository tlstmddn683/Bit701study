<%@page import="study.dao.MyCarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
int num=Integer.parseInt(request.getParameter("num"));

MyCarDao dao=new MyCarDao();

dao.deleteCar(num);

response.sendRedirect("mycarlist.jsp");



%>



