<%@page import="study.dto.MyBoardDto"%>
<%@page import="study.dao.MyBoardDao"%>
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
	font-family: 'Jua';
	
	}
	body{
	background:url("../image/12345.jpg")no-repeat center;
	background-size:cover;
	}
</style>
</head>
<%
int num=Integer.parseInt(request.getParameter("num"));
MyBoardDao dao=new MyBoardDao();
MyBoardDto dto=dao.getMyData(num);
%>
<body>
	<div style="margin: 50px 50px">
		<!--이미지가 출력되는곳입니다 -->
		<img id="showimg" src="../save/<%=dto.getPhoto() %>"
			style="position: absolute; left: 165px; top: 470px; max-width: 350px;">
		<form action="myupdateboardaction.jsp" method="post"
			enctype="multipart/form-data">
				<!-- hidden -->
			<input type="hidden" name="num" value="<%=dto.getNum()%>">
			<table class="table table-bordered" style="width: 600px;">
				<caption align="top">
					<b style="margin-left: 200px; font-size: 22px">게시글 작성하기</b>
				</caption>
				<tr class="table-secondary">
					<th  width="100">작성자</th>
					<td><input type="text" name="writer" class="form-control"
						style="width: 120px;" autofocus="autofocus" required="required" value="<%=dto.getWriter()%>">
					</td>
				</tr>
				<tr class="table-secondary">
				<th  width="100">카테고리</th>
				<td>
				<select class="form-select" name="category" value="<%=dto.getCategory()%>">
				<option hidden disabled selected>카테고리 선택</option>
					<option>수다</option>
					<option>이벤트</option>
					<option>공지사항</option>
					<option>일기장</option>
					<option>사진들</option>
				</select>
				</td>
				</tr>
				<tr class="table-secondary">
					<th  width="100">제 목</th>
					<td><input type="text" name="title" class="form-control"
						required="required" value="<%=dto.getTitle()%>"></td>
				</tr>
				<tr class="table-secondary">
					<th width="100">사 진</th>
					<td colspan="2"><input type="file" name="upload" class="form-control"
						id="myfile"></td>
				</tr>
				<tr class="table-secondary">
					<td colspan="2"><textarea style="width: 100%; height: 700px;"
							name="content" required="required"><%=dto.getContent()%></textarea></td>
				</tr>
				<tr class="table-secondary">
					<td colspan="2">
						<button type="submit" class="btn btn-outline-secondary" style="margin-left:200px;">수정하기</button>
						<button type="button" class="btn btn-outline-secondary"
							onclick="history.back()">이전으로</button>
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
			var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
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