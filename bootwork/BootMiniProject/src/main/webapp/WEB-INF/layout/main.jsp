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
	.mainphoto{
	width:200px;
	height:200px;
	border:5px double beige;
	border-radius:30px;
	margin-right:20px;
	box-shadow:3px 3px 3px gray;
	}
	.mainboard{
	font-size:20px;
	width:300px;
	height:200px;
	border:2px solid gray;
	border-radius:20px;
	padding-top:10px;
	text-align:center;
	float:left;
	}
	.mainboard .goboard{
		cursor:pointer;
		
	}
	.mainshop{
	font-size:20px;
	width:300px;
	height:200px;
	border:2px solid gray;
	border-radius:20px;
	padding-top:10px;
	text-align:center;
	position:absolute;
	left: 350px;
	top:222px;
	}
	.mainshop .goshop{
		cursor:pointer;
		
	}
</style>
</head>
<body>
<img class="mainphoto" src="./photo/1414.jpg">
<img class="mainphoto" src="./photo/123.jpg">
<img class="mainphoto" src="./photo/1111.jpg">
<br><br>
<div class="mainboard">
	<b>게시판 목록</b>
	<i class="bi bi-patch-plus-fill goboard"></i>
</div>

<div class="mainshop">
	<b>상품 목록</b>
	<i class="bi bi-patch-plus-fill goshop"></i>
</div>
</body>
</html>












