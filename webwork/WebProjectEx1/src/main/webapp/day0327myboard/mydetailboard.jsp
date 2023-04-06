<%@page import="java.text.SimpleDateFormat"%>
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
body{
	background:url("../image/05.png")no-repeat;
	background-size:cover;
}

.day {
	color: gray;
	font-size: 12px;
	float: right;
}
</style>
</head>
<%
//num읽기
int num = Integer.parseInt(request.getParameter("num"));
//dao
MyBoardDao dao = new MyBoardDao();
//조회수 증가
dao.updateMyReadCount(num);
//dto
MyBoardDto dto = dao.getMyData(num);
//날짜 출력 형식
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<div style="margin:50px 400px;">
		<table class="table table-bordered" style="width: 700px;border:1px solid gray;">
			<tr>
				<td>
					<h3>
						<button type="button" class="btn btn-outline-primary" 
				style="width:100px" onclick="location.href='myboardlist.jsp'">
				<i class="bi bi-list"></i>&nbsp;목록</button>
				<b style="margin-left:120px;"><%=dto.getTitle()%></b>
					</h3>
				</td>
			</tr>
			<tr>
				<td>
					<h5>
						<%=dto.getWriter()%><br>
						<span style="color: gray; font-size: 12px;">조회수<%=dto.getReadcount()%>&nbsp;추천<%=dto.getlikes()%>&nbsp;비추천<%=dto.getUnlikes() %></span>
					</h5> 
					<span class="day"><%=sdf.format(dto.getWriteday())%></span>
				</td>
			</tr>
			<tr>
				<td valign="top">
					<br><br>
			<!-- 저장시 br이 \n으로 db에 저장된다
			그래서 출력시 다시 br로 변경해야됨
			두번째 방법은 pre 태그안에 출력하면 자동으로 줄넘김이 된다 --> 
			<%=dto.getContent().replace("\n", "<br>")%>
				<br><br>
				<%
				if(dto.getPhoto()!=null){
					
				
				%>
				<br><br>
				<!-- onerror <<<-- 사진을 가져오다가 오류발생시 사진을 안보이게해줌 -->
				<img src="../save/<%=dto.getPhoto()%>" style="max-width:650px;margin:30px 20px; margin-left:30px;"
				onerror="this.src='../image/noimage.jpg'">
				<%}%>
				</td>
			</tr>
			<tr>
			<td>
			<button type="button" class="btn btn-outline-secondary" 
				style="width:100px; margin-left:205px; "onclick="update(<%=dto.getNum()%>)">
				<i class="bi bi-star-fill"></i>&nbsp;추천</button>
				<button type="button" class="btn btn-outline-secondary" 
				style="width:100px; margin-left:50px; "onclick="update2(<%=dto.getNum()%>)">
				<i class="bi bi-star"></i>&nbsp;비추천</button>
			</td>
			</tr>
			<tr>
			<td>
				<button type="button" class="btn btn-outline-secondary" 
				style="width:100px; margin-left:50px;" onclick="location.href='myboardform.jsp'">
				<i class="bi bi-pencil"></i>&nbsp;글쓰기</button>
				
				<button type="button" class="btn btn-outline-secondary" 
				style="width:100px; margin-left:50px;" onclick="location.href='myupdateboardform.jsp?num=<%=dto.getNum()%>'">
				<i class="bi bi-pencil-square"></i></i>&nbsp;수정</button>
				
				<button type="button" class="btn btn-outline-secondary" 
				style="width:100px; margin-left:50px;" onclick="del(<%= dto.getNum()%>)">
				<i class="bi bi-trash"></i>&nbsp;삭제</button>
				
				<button type="button" class="btn btn-outline-secondary" 
				style="width:100px; margin-left:50px;" onclick="location.href='myboardlist.jsp'">
				<i class="bi bi-list"></i>&nbsp;목록</button>
			</td>
			</tr>
		</table>
	</div>
	
<script type="text/javascript">
function del(num)
	{
		/* alert(num); */
		let b=confirm("삭제를 하려면 [확인]을 눌러주세요")
		if(b){
			location.href="mydeleteboard.jsp?num="+num;
		}
	}
function update(num)
{
	/* alert(num); */
	let b=confirm("추천을 하려면 [확인]을 눌러주세요")
	if(b){
		location.href="mylikeboard.jsp?num="+num;
	}
}	
function update2(num)
{
	/* alert(num); */
	let b=confirm("비추천을 하려면 [확인]을 눌러주세요")
	if(b){
		location.href="myunlikeboard.jsp?num="+num;
	}
}	

</script>  
</body>
</html>