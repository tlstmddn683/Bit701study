<%@page import="study.dao.MyBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//num읽기
int num= Integer.parseInt(request.getParameter("num"));
//dao
MyBoardDao dao=new MyBoardDao();
//delete
dao.updateMyLike(num);
//디테일
response.sendRedirect("mydetailboard.jsp?num="+num);
%>