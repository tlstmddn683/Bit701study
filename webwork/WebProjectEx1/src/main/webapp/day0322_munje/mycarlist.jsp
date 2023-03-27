<%@page import="java.util.Date"%>
<%@page import="study.dto.MyCarDto"%>
<%@page import="java.util.List"%>
<%@page import="study.dao.MyCarDao"%>
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
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body, body * {
	font-family: 'Jua'
}
.carphoto{
	cursor:pointer;
}
</style>
</head>
<%
MyCarDao dao = new MyCarDao();
List<MyCarDto> list = dao.getAllCars();
%>
<body>
<!-- The Modal -->
<div class="modal" id="carModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"id="modalname">Modal Heading</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <img src="" id="modalphoto" style="width: 100%;height: 400px;">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

	<a href="mycarform.jsp">구매 할 차량 추가</a>
	<hr>
	<h3 class="alert alert-info">
		<b>총<%=list.size()%> 대 의 차량을 보관했습니다.
		</b>
	</h3>
	<table class="table table-bordered" style="width: 700px">
		<tr bgcolor="skyblue">
			<th width="40">번호</th>
			<th width="80">차량명</th>
			<th width="120">가격</th>
			<th width="200">사진</th>
			<th width="70">구입일</th>
			<th width="70">삭제</th>
		</tr>
		<%
		int n = 1;
		Date date = new Date();
		for (MyCarDto dto : list) {
		%>
		<tr>
			<td align="center"><%=n++%></td>
			<td><%=dto.getCarname()%></td>
			<td><%=dto.getCarprice()%>원</td>
			<td><img src="../image/mycar/<%=dto.getCarphoto()%>" width="200"
				border="1" hspace="20" class="carphoto"
				data-bs-toggle="modal" data-bs-target="#carModal"></td>
			<td><%=dto.getGuipday()%>일</td>
			<td>
				<button type="button" class="btn btn-warning btn-sm"
					onclick="del(<%=dto.getNum()%>)">삭제</button>
			</td>
		</tr>
		<%
		}
		%>

	</table>

	<script type="text/javascript">
	function del(num)
	{
		
		let b=confirm("삭제하려면 [확인]버튼을 눌러주세요");
		if(b){
			location.href="deletecar.jsp?num="+num;
		
		}
	}
	//작은 사진 클릭시 모달에 사진 나오게하기
	$(".carphoto").click(function(){
		//클릭한곳의 src
		let selectSrc=$(this).attr("src");
		//모달안에 이미지 삽입
		$("#modalphoto").attr("src",selectSrc);
		//사진클릭한곳 다음태그가 b태그이다 그태그의 text 얻기
		let Carname=$(this).parent().prev().prev().text();
		//모달 header에 text출력
		$("#modalname").text(Carname);
	});
	
	</script>


</body>
</html>