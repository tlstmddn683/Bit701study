<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="study.dto.PersonDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.PersonDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
body, body * {
	font-family: 'Jua'
}

table thead tr {
	background-color: #ffc;
}
</style>
</head>
<%
PersonDao dao = new PersonDao();
List<PersonDto> list = dao.getAllPersons();
Date date = new Date();
int currYear = date.getYear() + 1900;//현재년도
%>
<body>
	<table class="table table-bordered">
		<caption align="top">
			<h2 class="alert alert-danger">Mysql Person 직원들</h2>
		</caption>
		<thead>
			<tr>
				<th width="200" style="text-align: center">사진</th>
				<th width="300" style="text-align: center">개인정보</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (PersonDto dto : list) {
				//나이
				int age = currYear - dto.getBirthyear();
				//띠
				int m = dto.getBirthyear() % 12;
				String ddi = m == 0 ? "원숭이"
				: m == 1 ? "닭"
				: m == 2 ? "개"
				: m == 3 ? "돼지"
				: m == 4 ? "쥐"
				: m == 5 ? "소"
				: m == 6 ? "호랑이"
				: m == 7 ? "토끼"
				: m == 8 ? "용" 
				: m == 9 ? "뱀" 		
				: m == 10 ? "말" : "양";
			%>
			<tr>
				<td align="center"><img src="../image/moviestar/<%=dto.getPhoto()%>"
					width="150" height="200" hspace="10"></td>
				<td><b>이름:<%=dto.getName()%></b> <br> <b><%=dto.getBirthyear()%>년생(<%=age%>세,<%=ddi%>띠)</b>
					<br> <b>주소: <%=dto.getAddress()%></b> <br> <b>직업: <%=dto.getJob()%></b>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>