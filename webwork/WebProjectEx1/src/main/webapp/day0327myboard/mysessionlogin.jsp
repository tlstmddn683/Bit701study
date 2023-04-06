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
	height: 100vh;
    width: 100vw;
	background:url(../image/B.jpg);
	background-size : cover;
	}
	#logintable{
	width: 300px;
	border:1px solid gray;
	}
</style>
</head>
<%
String chksave=(String)session.getAttribute("chksave");
String loginid=(String)session.getAttribute("loginid");
boolean b;
//chksave가 한번도 세션에 저장된적이 없을 경우는 null값이 나옴
//체크후 로그인을 했다면 yes or no
if(chksave==null|| chksave.equals("no")){
	b=false;
	loginid="";//체크를 안했을 경우 세션으로부터 얻은 아이디를 지운다
}else
	b=true;
%>
<body>
	<div style="margin:270px 500px;">
		<form action="myloginaction.jsp" method="post">
			<table class="table table-bordered" id="logintable">
				<tr class="table-danger">
					<td colspan="2" align="center"><label> <!-- 체크후 로그인을 했을경우 b 가 true값이므로 체크속성 추가 -->
							<input type="checkbox" name="chksave" <%=b?"checked":""%>>아이디저장
					</label></td>
				</tr>
				<tr class="table-danger">
					<th  width="100">아이디</th>
					<td><input type="text" name="id" class="form-cotrol" value="<%=loginid%>">
					</td>
				</tr>
				<tr class="table-danger">
					<th  width="100">비밀번호</th>
					<td><input type="password" name="pass" class="form-cotrol">
					</td>
				</tr>
				<tr class="table-danger">
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-light" style="border:1px solid gray; background-color:white;">
						<i class="bi bi-box-arrow-in-right"></i>로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>