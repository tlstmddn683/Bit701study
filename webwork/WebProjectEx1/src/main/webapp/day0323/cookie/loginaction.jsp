<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
//amho값을 읽는다.
String amho=request.getParameter("amho");
if(amho.equals("1234"))
{
Cookie cookie=new Cookie("amho",amho);
cookie.setPath("/");//쿠키저장위치를 루트(/)로 설정
cookie.setMaxAge(60*60);//1시간 동안 쿠키가 유지됨
response.addCookie(cookie);//브라우저에 쿠키추가
response.sendRedirect("cookiemain.jsp");//쿠키메인페이지로 이동!
			
	}else{%>
<script>
		alert("비밀번호가 맞지않습니다");
		history.back();
		</script>
<%}
%>