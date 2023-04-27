<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	font-family: 'Jua'
}
</style>
</head>

<body>
	<!-- 이미지 출력위치 -->
	<img id="showimg" src="https://${imageUrl}/board/${dto.filename}"
		style="position: absolute; left: 600px; top: 50px; max-width: 300px;">

	<div style="width: 450px; margin: 50px 100px;">
		<form action="update" method="post" enctype="multipart/form-data">
			<!-- hidden -->
			<input type="hidden" name="num" value="${dto.num}"> <input
				type="hidden" name="currentPage" value="${currentPage}">
			<table class="table table-bordered">
				<caption align="top">
					<h4>
						<b> 
						글수정
						</b>
					</h4>
				</caption>
				<tr>
					<th style="width: 100px; background-color: #ddd">작성자</th>
					<td><input type="text" class="form-control" name="writer"
						required="required" value="${dto.writer}"></td>
				</tr>
				<tr>
					<th style="width: 100px; background-color: #ddd">제목</th>
					<td><input type="text" class="form-control" name="subject"
						value="${subject}" required="required" value="${dto.subject}"></td>
				</tr>
				<tr>
					<th style="width: 100px; background-color: #ddd">공유사진</th>
					<td><input type="file" class="form-control" name="upload"
						id="myfile"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea style="width: 100%; height: 130px;"
							name="content" required="required" class="form-control"> ${dto.content} </textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-success">글수정</button>
						<button type="button" class="btn btn-outline-success"
							onclick="history.back()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$("#myfile").change(function() {
			console.log("1:" + $(this)[0].files.length);
			console.log("2:" + $(this)[0].files[0]);
			//정규표현식
			var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
			var f = $(this)[0].files[0];//현재 선택한 파일
			if (!f.type.match(reg)) {
				alert("확장자가 이미지파일이 아닙니다");
				return;
			}
			if ($(this)[0].files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#showimg").attr("src", e.target.result);
				}
				reader.readAsDataURL($(this)[0].files[0]);
			}
		});
	</script>
</body>
</html>
