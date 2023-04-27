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
</style>
</head>
<body>
	<div style="margin:30px 50px">
	<h4>post 방식으로 dto로 한번에 읽기</h4>
		<form action="read2" method="post">
		       상품명 :<input type="text" name="sangpum"><br>
		  		 가격	 :<input type="text" name="price"><br>
		  		 수량	 :<input type="text" name="su"><br>
		     페이지번호 : <input type="text" name="pagenum"><br>
			<button type="submit" class="btn btn-outline-secondary">서버전송 2</button>
		</form>
	</div>
</body>
</html>