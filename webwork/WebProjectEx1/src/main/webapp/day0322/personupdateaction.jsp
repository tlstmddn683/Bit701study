<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
request.setCharacterEncoding("utf-8");
%>  
<!-- 자바 빈즈 -->
<!-- dao 선언 -->    
<jsp:useBean id="dao" class="study.dao.PersonDao"/>
<!-- dto 선언 -->
<jsp:useBean id="dto" class="study.dto.PersonDto"/>
<!-- form태그의 name과 같은 경우에만 dto에 자동주입 -->
<jsp:setProperty property="*" name="dto"/>
<%
//수정 메소드 호출
	dao.updatePerson(dto);
//목록으로 이동
	response.sendRedirect("personlist.jsp");
%>