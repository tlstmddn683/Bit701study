<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sang="원피스";
	int su=2;
	int dan=23000;
	
	String s="";
	s+="{";
	s+="\"sang\":\""+sang+"\",";
	s+="\"su\":"+su+",";
	s+="\"dan\":"+dan;
	s+="}";
%>
<%=s%>