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
	div.info img{
	position:absolute;
	top:5px;
	left:10px;
	width:200px;
	}
	div b{
	font-size:30px;
	position: relative;
	z-index: 2;
	}
	i.hp{
	font-size:17px;
	position: relative;
	z-index: 2;
	}
	div iframe{
	position:absolute;
	top:420px;
	left:5px;
	}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
	<div class="info">
	<b>문의전화</b><br>
	<i class="bi bi-telephone-fill hp" >070-3333-3333</i><br>
	<img src="${root}/photo/111.png">
	<br><br>
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d34034.58095441178!2d128.8447937766595!3d41.99745153138713!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5fcb16206f264c65%3A0xd1ae97259d7a0618!2z7KGw7ISg66-87KO87KO87J2Y7J2466-86rO17ZmU6rWtIOufieqwleuPhCDrjIDtmY3ri6g!5e0!3m2!1sko!2skr!4v1681452694360!5m2!1sko!2skr" width="250" height="250" style="border:1;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
	<div>
	<img src="${root}/photo/1.jpg" style="width:600px;position:absolute;top:350px;left:1100px;"> 
	</div>
</body>
</html>
