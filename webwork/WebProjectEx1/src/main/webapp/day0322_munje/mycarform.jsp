
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
	<h4 class="alert alert-info">Mysql Car 데이터 추가</h4>
	<form action="mycaraction.jsp" method="post">
		<table class="table table-bordered" style="width: 400px">
			<tr>
				<th bgcolor="pink" width:"100">차량명</th>
				<td><input type="text" name="carname" requrired="required"
					class="form-control"></td>
			</tr>
			<tr>
				<th bgcolor="pink"width:"100">가격</th>
				<td><input type="text" name="carprice" class="form-control"></td>
			</tr>
			<tr>
				<th bgcolor="pink"width:"100">사진</th>
				<td>
					<div class="input-group">
						<select class="form-select" name="carphoto" id="carphoto">
							<%
							for (int i = 1; i <= 15; i++) {
							%>
							<option value="mycar<%=i%>.png"><%=i%>번 자동차사진
							</option>
							<%
							}
							%>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th bgcolor="pink" width="100">구입일</th>
					<td><input type="date" name="guipday">
					</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn-btn-success">서버로 전송</button>
				</td>
			</tr>
		</table>
	</form>
	<img src="../image/mycar/mycar1.png" id="carphotoview" width="400"
		border="1" style="position: absolute; left: 450px; top: 100px">

	<script type="text/javascript">
		$("#carphoto").change(function() {
			let src = $(this).val();
			$("#carphotoview").attr("src", `../image/mycar/\${src}`);
		});
	</script>
</body>
</html>