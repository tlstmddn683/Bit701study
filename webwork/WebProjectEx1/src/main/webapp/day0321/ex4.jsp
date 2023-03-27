<%@page import="study.day0321.AnimalDTO"%>
<%@page import="java.util.List"%>
<%@page import="study.day0321.animalList"%>
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
	font-family: 'Jua';
}
</style>
</head>
<body>
	<h3 class="alert alert-danger">AnimalDTO 데이터 출력하기</h3>
	<%
	animalList animalList = new animalList();
	//list 데이터 가져오기
	List<AnimalDTO> list = animalList.getAllanimals();
	%>
	<table class="table table-bordered" style="width: 400px">
		<tr bgcolor="gray">
			<th>이름</th>
			<th>나이</th>
			<th>사진</th>
		</tr>
		<%
		for (AnimalDTO dto : list) {
		%>
		<tr>
			<td><%=dto.getAnimalName()%></td>
			<td><%=dto.getAnimalAge()%>세</td>
			<td><img src="../image/animal/<%=dto.getAnimalPhoto()%>.png"
				width="40"></td>
		</tr>
		<%
		}
		%>
	</table>
	<hr>
	<table class="table table-bordered" style="width: 400px">
		<tr bgcolor="pink">
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>사진</th>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			AnimalDTO dto = list.get(i);
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=dto.getAnimalName()%></td>
			<td><%=dto.getAnimalAge()%>세</td>
			<td><img src="../image/animal/<%=dto.getAnimalPhoto()%>.png"
				width="50"></td>
		</tr>
		<%
		}
		%>

	</table>
</body>
</html>