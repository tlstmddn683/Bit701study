<%@page import="study.dao.PersonDao"%>
<%@page import="study.dto.PersonDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//엔코딩
request.setCharacterEncoding("utf-8");
//데이터 각각읽기
String name=request.getParameter("name");
int birthyear=Integer.parseInt(request.getParameter("birthyear"));
String address=request.getParameter("address");
String job=request.getParameter("job");
String photo=request.getParameter("photo");
//dto선언
PersonDto dto=new PersonDto();
//데이터  dto에 넣기
dto.setName(name);
dto.setBirthyear(birthyear);
dto.setAddress(address);
dto.setJob(job);
dto.setPhoto(photo);
//dao선언
PersonDao dao=new PersonDao();
//insert 메소드 호출
dao.insertPerson(dto);
//페이지 이동
response.sendRedirect("personlist.jsp");

%>
