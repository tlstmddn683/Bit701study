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
<script type="text/javascript">
$(function(){
	list();
	
	
	
	//사진부터업로드
	/*$("#photoupload").change(function(){
		console.dir(this);
		//file input type 은 한개일지라도 기본이 배열타입으로 넘어옴
		//그래서 배열의 0번으로 표시한다!!
		let cnt=$(this)[0].files.length;
		if(cnt>3){
			alert("3장까지만 업로드 가능합니다!!");
			return false;
		}
		var form=new FormData();
		for(i=0;i<$(this)[0].files.length;i++){
		form.append("upload",$(this)[0].files[i]);//선택한 사진 모두 추가
		}
		
 		$.ajax({
			type:"post",
			dataType:"text",
			url:"upload",
			processData:false,
			contentType:false,
			data:form,
			success:function(res){
		
			}
		});
	});
	
	$("#guestadd").click(function(){
		let content=$("#content").val();
		let nn=$("#nickname").val();
		console.log(content);
		$.ajax({
			type:"post",
			dataType:"text",
			url:"./insert",
			data:{"content":content,"nickname":nn},
			success:function(res){
				//입력값 초기화
				$("#nickname").val("");
				$("#content").val("");
				$("#photoupload").val("");
				//목록 다시 출력하기
				list();
			}
		});
	}); */
	
	
	
	//업로드한 사진들과 데이터를 묶어서 서버에 전송하기
	$("#guestadd").click(function(){
		let content=$("#content").val();
		let cnt=$("#photoupload").val();
		let nn=$("#nickname").val();
		var form=new FormData();
		for(i=0;i<$("#photoupload")[0].files.length;i++){
		form.append("upload",$("#photoupload")[0].files[i]);
		}
		form.append("content",content);
		form.append("nickname",nn);
		$.ajax({
			type:"post",
			dataType:"text",
			url:"./insert",
			processData:false,
			contentType:false,
			data:form,
			success:function(res){
				//입력값 초기화
				$("#nickname").val("");
				$("#content").val("");
				$("#photoupload").val("");
				//목록 다시 출력하기
				list();
			}
		});
	});
});
function list()
{
	
}
</script>
</head>
<body>
<div style="width:500px;margin-left: 100px;">
	<input type="text" id="nickname" class="form-control" placeholder="닉네임"  style="width: 200px;">
	
	<textarea style="width:80%;height: 100px"  class="form-control" id="content"></textarea>
	<input type="file" id="photoupload" multiple="multiple">
	<button type="button" class="btn btn-sm btn-outline-success" id="guestadd">등록</button>
</div>
</body>
</html>
