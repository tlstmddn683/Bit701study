<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body,body *{
	font-family: 'Jua';
	}
	#link{
	text-decoration:none;
	color:black;
	}
	#link:hover{
	color:gray;
	}
</style>
</head>
<body>
	<!--  로그인상태인지 확인후 로그인 또는 로그아웃 페이지 include -->
	<%
	String loginstate = (String) session.getAttribute("loginstate");
	if (loginstate == null) {
	%>
	<jsp:include page="mysessionlogin.jsp" />
	<%
	} else {
	%>
	<jsp:include page="mysessionlogout.jsp" />
	<%
	}
	%>
	
	<b><a href="mysuccesspage.jsp" id="link">나의 블로그로 이동</a></b>
</body>
</html>