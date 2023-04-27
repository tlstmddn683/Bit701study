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
</style>
</head>
<body>
	<h4>
		<img src="./image/${carphoto}" width="200"><br>
		<img src="./res/image/${carphoto}" width="200"><br>
		차량명 : ${sangpum}<br>
		가  격 :${price}<br>
		색  상 :${color}<br>
		<img src="./res/image/${carphoto2}" width="200"><br>
		차량명 : ${sangpum2}<br>
		가  격 :${price2}<br>
		색  상 :${color2}
		
	</h4>
	<button type="button" class="btn btn-outline-success" onclick="history.back()">돌아가기</button>

</body>
</html>