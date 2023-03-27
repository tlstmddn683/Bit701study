<%@page import="study.day0321.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="study.day0321.ShopList"%>
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
	font-family: 'Jua'
}
</style>
</head>
<body>
	<h3 class="alert alert-success">ShopDto 데이터 출력</h3>
	<%
	ShopList ShopList = new ShopList();
	//list 데이터 가져오기
	List<ShopDto> list = ShopList.getAllsangpum();
	%>
	<table class="table table-bordered" style="width: 400px">
		<tr bgcolor="green">
			<th width="60">번호</th>
			<th width="250">상품</th>
			<th width="100">색상</th>
			<th width="150">가격</th>
		</tr>
		<%
		int i=1;
		for(ShopDto dto :list)
		{%>
		<tr>
			<td><%=i + 1%></td>
			<td><img src="../image/shop/<%=dto.getSangpumPhoto()%>.jpg"
				width="70" height="60" border="1" hspace="20"><%=dto.getSangpumName() %></td>
			<td>
			<div style="width: 40px; height:40px; background-color:<%=dto.getSangpumColor()%>; border:1px solid gray">
			</div>
			<b><%=dto.getSangpumColor()%></b>
			</td>
			<td align="right"><%=dto.getSangpumPrice()%>원</td>
		</tr>
		<%
		}
		%>

	</table>
</body>
</html>