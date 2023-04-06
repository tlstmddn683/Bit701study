<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.zip.DataFormatException"%>
<%@page import="study.dto.MyBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.MyBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	font-family: 'Jua';

}
body {
	background:url("../image/1111.jpg")no-repeat center;
}
a:link{
	text-decoration: none;
	color:black;
}
a:hover{
	text-decoration: underline;
	color:pink;
}
div.container{
	margin-left:400px;
	background-color:pink;
	width:440px;
	height:42px;
	border-radius:10px;
	border:1px solid gray;
	box-shadow:2px 2px 2px gray;
}
</style>
</head>
<%
//dao 선언
MyBoardDao dao = new MyBoardDao();
//전체 글목록 가져오기
List<MyBoardDto> list = dao.getMyAllDatas();
//세션에 저장되어있는 아이디를 얻는다
String loginid = (String) session.getAttribute("loginid");
%>

<body>
	<h2 align="Left" class="alert alert-danger">
	<button type="button" class="btn btn-outline-danger btn-sm"
	onclick="location.href='mylogoutaction.jsp'" style="margin-left: 10px">
	<i class="bi bi-box-arrow-right"></i>로그아웃</button><b style="font-size:12px; margin-left:30px;"> 
		현재 <%=loginid %>님이 로그인 중입니다.</b>
		<b style="margin-left:230px;">나의 블로그</b></h2>
		<div>
		<div class="container">
			<div class="row">
				<form method="post" name="search" action="searchaction.jsp">
				<table>
					<tr>		
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="title">제목</option>
								<option value="writer">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-light btn-sm">검색</button></td>
						
						<td><button type="button" class="btn btn-light btn-sm"
						style="width: 100px;" onclick="location.href='myboardform.jsp'">
						<i class="bi bi-pencil-fill"></i>&nbsp;작성하기</button></td>
					</tr>
					</table>
				</form>
				</div>
				</div>
		
		<table class="table table-bordered"
			style="width: 1000px; margin: 100px 200px; background-color:white;">
			<caption align="top" style="background-color:lightpink" >
				<b style="color:black">&nbsp;<%=list.size() == 0 ? "MyBoard" : "총" + list.size() + "개 의 글이 있습니다"%></b>
			</caption>
		
			<tr bgcolor="lightpink">
				<th width="50">번호</th>
				<th width="300"><b style="margin-left:180px;">제목</b></th>
				<th width="100"><b style="margin-left:40px;">카테고리</b></th>
				<th width="60">작성자</th>
				<th width="70"><b style="margin-left:40px;">작성일</b></th>
				<th width="60">조회수</th>
				<th width="50">추천</th>
				<th width="50">비추천</th>
			</tr>
			<%
			if (list.size() == 0) {
			%>
			<tr height="60">
				<td colspan="5" align="center" valign="middle"><b>게시물이
						존재하지않습니다</b></td>
			</tr>
			<%
			} else {
			int i = 0;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			for (MyBoardDto dto : list) {
			%>
			<tr>
				<td align="center"><%=list.size() - i++%></td>
				<td>
					<%
					if (dto.getPhoto() == null) {
					%> <a href="mydetailboard.jsp?num=<%=dto.getNum()%>"> <%=dto.getTitle()%></a>
					<%} else {
					%> <a href="mydetailboard.jsp?num=<%=dto.getNum()%>"> <%=dto.getTitle()%>
					<i class="bi bi-image"></i></a> 
 					<%
					}
					%>

				</td>
				<td align="center"><%=dto.getCategory() %></td>
				<td align="center"><%=dto.getWriter()%></td>
				<td align="center"><%=sdf.format(dto.getWriteday())%></td>
				<td align="center"><%=dto.getReadcount()%></td>
				<td align="center"><%=dto.getlikes()%></td>
				<td align="center"><%=dto.getUnlikes()%></td>
				</tr>
			<%
			}

			}
			%>
		</table>
	</div>

</body>
</html>