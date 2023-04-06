<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
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
</style>
</head>
<body>
	<h3 class="alert alert-success">Person List</h3>
	<br>
	<h3>총 ${count} 명의 직원이 있습니다</h3>
	
	<table class="table table-bordered" style="width:600px;">
	<tr style="background-color:lightgreen">
	<th width="50">번호</th>
	<th width="70">이름</th>
	<th width="120">태어난연도</th>
	<th width="150">주소</th>
	<th width="100">직업</th>
	<th width="150">사진</th>
	</tr>
	<c:forEach var="dto" items="${list}" varStatus="j">
	<tr>
	<td align="center">${j.count}</td>
	<td><b>${dto.name}</b></td>
	<td align="center">${dto.birthyear}
	</td>
	<td>${dto.address}</td>
	<td>${dto.job}</td>
	<td><img src="../image/moviestar/${dto.photo}" width="80" border="1" hspace="10"></td>
	</tr>
	</c:forEach>
	</table>
</body>
</html>