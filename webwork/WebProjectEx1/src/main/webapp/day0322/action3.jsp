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
	font-family: 'Jua'
	
	}
</style>
</head>
<%
request.setCharacterEncoding("utf-8");

String sname=request.getParameter("sname");
String gender=request.getParameter("gender");
String []hobbys=request.getParameterValues("hobby");
String email=request.getParameter("email");
String email2=request.getParameter("email2");
%>
<body>
	<div class="alert alert-info" style="width:400px;font-size: 20px">
	사원명:<%=sname %><br>
	성별:<%=gender %><br>
	나의 취미생활은 <%
	if(hobbys==null){%>
		<b>취미활동이 없습니다</b>
	<%}else{
		for(String h:hobbys){%>
			<%=h%>,
		<%}
	} 
	%>입니다.
	<br>
이메일:<%=email %>@<%=email2 %>

	</div>
	
</body>
</html>