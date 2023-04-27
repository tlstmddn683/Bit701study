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
		font-family: 'Jua'
	}
	.subphoto{
	width:200px;
	height:200px;
	border:10px double pink;
	border-radius:30px;
	margin-right:20px;
	box-shadow:3px 3px 3px gray;
	}
</style>
</head>
<body>
<img src="./photo/1.png" class="subphoto">
<img src="./photo/2.png" class="subphoto">
<img src="./photo/3.png" class="subphoto">
<br><br>
<img src="./photo/4.png" class="subphoto">
<img src="./photo/5.png" class="subphoto">
<img src="./photo/6.png" class="subphoto">
</body>
</html>
