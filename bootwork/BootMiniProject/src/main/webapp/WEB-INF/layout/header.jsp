<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body, body *{
		font-family: 'Jua';	
	}
	body a{
	color:gray;
	cursor:pointer;
	font-size: 30px;
	}
	body a:hover{
	color:black;
	}
	b.title{
	font-size:30px;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<a href="${root}/">
<i class="bi bi-house-door-fill home"></i>
<b class="title">대홍단 KING감자</b>
</a>
</body>
</html>
