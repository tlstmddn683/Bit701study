<%@page import="study.dao.MyCarDao"%>
<%@page import="study.dto.MyCarDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%
request.setCharacterEncoding("utf-8");
String carname=request.getParameter("carname");
int carprice=Integer.parseInt(request.getParameter("carprice"));
String carphoto=request.getParameter("carphoto");
String guipday=request.getParameter("guipday");

MyCarDto dto=new MyCarDto();

dto.setCarname(carname);
dto.setCarprice(carprice);
dto.setCarphoto(carphoto);
dto.setGuipday(guipday);

MyCarDao dao=new MyCarDao();

dao.insertCar(dto);

response.sendRedirect("mycarlist.jsp");



%>
