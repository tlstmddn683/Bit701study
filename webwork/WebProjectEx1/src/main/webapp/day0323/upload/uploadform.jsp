<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	font-family: 'Jua'
	
	}
</style>
</head>
<body>
	<form action="uploadaction.jsp" method="post" enctype="multipart/form-data">
	<h4>사진을 업로드 하세요</h4>
	<input type="file" name="photo"><br><br>
	<h4>사진의 제목을 입력해주세요</h4>
	<input type="text" name="title"><br><br>
	<button type="submit" class="btn btn-info">파일업로드</button>
	</form>
</body>
</html>