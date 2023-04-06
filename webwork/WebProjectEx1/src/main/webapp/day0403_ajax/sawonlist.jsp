<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="study.dto.SawonDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.SawonDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
int select=Integer.parseInt(request.getParameter("select"));
//dao선언
SawonDao dao=new SawonDao();
//select에 맞게 데이터 가져오기
List<SawonDto>list=dao.getSelectSawons(select);

JSONArray arr=new JSONArray();
for(SawonDto dto:list)
{
	JSONObject ob=new JSONObject();
	
	ob.put("num",dto.getNum());
	ob.put("name",dto.getName());
	ob.put("gender",dto.getGender());
	ob.put("buseo",dto.getBuseo());
	ob.put("score",dto.getScore());
	//arr에 ob추가
	arr.add(ob);
}

%>
<%=arr.toString()%>