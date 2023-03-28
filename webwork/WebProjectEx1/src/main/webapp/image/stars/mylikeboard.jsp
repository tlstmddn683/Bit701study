<%@page import="db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="study.dao.MyBoardDao"%>
<%@page import="study.dto.MyBoardDto"%>
<%
MyBoardDao dao=new MyBoardDao();
MyBoardDto dto=new MyBoardDto();
int  like=Integer.parseInt(request.getParameter("like"));
dao.updateMyLike(like);
response.sendRedirect("mydetailboard.jsp");
%>