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
	<h3 class="alert alert-info">MyCar List</h3>
	<br>
	<h3>총 ${count} 대의 차량이 있습니다</h3>
	<table class="table table-bordered" style="width:600px;">
	<tr style="background-color:skyblue">
	<th width="50">번호</th>
	<th width="100">차량명</th>
	<th width="120">가격</th>
	<th width="150">사진</th>
	<th width="100">구입일</th>
	</tr>
	<c:forEach var="dto" items="${list}" varStatus="l">
	<tr>
	<td align="center">${l.count}</td>
	<td><b>${dto.carname}</b></td>
	<td><fmt:formatNumber value="${dto.carprice}" type="currency" maxFractionDigits="0" currencySymbol="￦"/></td>
	<td>
	<img src="../image/mycar/${dto.carphoto}" width="120" border="1" hspace="10">
	</td>
	<td>${dto.guipday}</td>
	</tr>
	</c:forEach>
	</table>
	
</body>
</html>