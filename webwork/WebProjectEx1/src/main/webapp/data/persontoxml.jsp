<?xml version="1.0" encoding="UTF-8"?>
<%@page import="study.dto.PersonDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.PersonDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//보내온 data 를 읽는다
	//list()함수에서 호출된 경우는 name값이 넘어오지 않는다
	String name=request.getParameter("name");
	
	PersonDao dao=new PersonDao();
	List<PersonDto> list= null;
	
	if(name==null){
		list=dao.getAllPersons();
	}else{
		list=dao.getSearchNamePersons(name);
	}
%>
<person>
<%
	for(PersonDto dto:list)
	{%>
	 <data>
		<name num="<%=dto.getNum()%>" photo="<%=dto.getPhoto() %>"><%=dto.getName() %></name>
		<birthyear><%=dto.getBirthyear() %></birthyear>
		<address><%=dto.getAddress() %></address>
		<job><%=dto.getJob() %></job>
	 </data>	
	<%}
%>
</person>