<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

.alist {
	padding-left: 10px;
	color: #666;
}
</style>
<script type="text/javascript">
	$(function(){
		list();//처음시작시 댓글 출력
		//댓글 추가 이벤트
		$("#btnasave").click(function(){
			//댓글 내용이 없을 경우
			let content=$("#answer").val();
			let idx=${dto.idx};//원글번호
			let num=${sessionScope.loginnum};
			console.log(content,idx);
			if(content.trim()==''){
				alert("댓글을 입력바랍니다");
				return false;
			}
		
			$.ajax({
				type:"get",
				url:"ainsert",
				data:{"idx":idx,"content":content ,"num":num},
				dataType:"text",
				success:function(){
					//댓글 목록 다시출력
					list();
					//입력창에 댓글 삭제
					$("#answer").val("");
				}
			})
		});
		//입력후 엔터
		$("#answer").keyup(function(e){
			if(e.keyCode==13)
				$("#btnasave").click();
			
				});	
		//댓글리스트창 숨기기 / 다시 열기
			$("b.answer").click(function(){
				$(".alist").toggle('fast');
			});
		//on 삭제이벤트
		$(document).on("click",".adelete",function(){
			let seq=$(this).attr("seq");
			let b=confirm("해당 댓글을 삭제하시겠습니까?")
			if(b){
			$.ajax({
				type:"get",
				url:"adelete",
				data:{"seq":seq},
				dataType:"text",
				success:function(){
					//댓글 목록 다시 출력
					list();
				}
			});
		  }
		});
	});	
	//댓글 출력하는 함수
	function list()
	{
		//글번호 idx 구하기
		let idx=${dto.idx};
		//로그인한 사람의 num=?
		let num=${sessionScope.loginnum};
		
		$.ajax({
			type:"get",
			url:"alist",
			data:{"idx":idx},
			dataType:"json",
			success:function(res){
				//댓글 갯수 출력하기
				$("span.acount").text(res.length);
				//댓글 출력
				let s="";
				$.each(res,function(idx,ele){
					s+= 
						`
						<img src="../photo/\${ele.photo}" class="round-circle" width=30 height=30 hspace=5> &nbsp; <b>\${ele.name}</b>:&nbsp;
						\${ele.content}
						&nbsp;&nbsp;
						<span style='font-size:13px'>\${ele.writeday}</span>
						`;
						
						if(num==ele.num){
						s+=
						`
						&nbsp;
						<i class="bi bi-trash adelete" seq="\${ele.seq}" style="cursor:pointer"></i>
						
						`;
						}
						s+="<br>";
				});
				
				$(".alist").html(s);
			}
		})
	}
</script>
</head>
<body>

	<c:if test="${sessionScope.loginok==null}">
		<script type="text/javascript">
	alert("로그인을 해주세요");
	location.href="../login/form";
</script>
	</c:if>

	<div style="margin: 30px 50px; width: 600px;">
		<table class="table">
			<tr>
				<h2>${dto.subject}</h2>
				<img src="../photo/${dto.photo}" class="rounded-circle" width="50"
					height="50" align="left" hspace="10">
				<b>${dto.name}</b>
				<br>
				<span style="color: #aaa; font-size: 12px;"> <fmt:formatDate
						value="${dto.writeday}" pattern="yyyy.MM.dd HH:mm" /> &nbsp;
					조회:${dto.readcount}
				</span>
				<span style="float: right; color: #555; font-size: 15px;"> <i
					class="bi bi-chat-dots"></i>&nbsp;댓글<span class="acount">0</span>
				</span>
			</tr>
			<tr>
				<td><pre style="margin-top: 30px; font-size: 18px;">${dto.content}</pre>
					<br> <br> <c:if test="${dto.images!='no'}">
						<c:forTokens items="${dto.images}" delims="," var="myimg">
							<img src="../photo/${myimg}" class="img-thumbnail"
								style="max-width: 200px;">
							<br>
						</c:forTokens>
					</c:if></td>
			</tr>
			<tr>
				<td><b class="answer" style="cursor: pointer;">댓글 <span
						class="acount">0</span></b>
					<div class="alist"></div></td>
			</tr>
			<!-- 댓글 (로그인에 성공한 사람만 댓글작성 가능)-->
			<c:if test="${sessionScope.loginok!=null}">
				<tr>
					<td class="input-group"><input type="text" id="answer"
						class="form-control" placeholder="댓글을 작성해주세요"
						style="height: 70px;">
						<button type="button" id="btnasave"
							class="btn btn-outline-success btn-sm">댓글작성</button></td>
				</tr>
			</c:if>
			<tr>
				<td><c:if
						test="${sessionScope.loginok!=null and sessionScope.loginnum==dto.num}">
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='updateform?idx=${dto.idx}&currentPage=${currentPage}'">수정</button>
						<button type="button" class="btn btn-outline-secondary" onclick="bdelete(${dto.idx})">삭제</button>
					</c:if>
					<button type="button" class="btn btn-outline-secondary btn-sm"
						style="float: right;"
						onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				</td>
			</tr>
		</table>
		<script>
		function bdelete(idx)
		{
			//alert(idx);
		let b=confirm("게시물 삭제시 댓글도 같이 삭제가 됩니다. 정말 삭제하시겠습니까?");
		if(b)
			{
			let cp=${currentPage};
			location.href="delete?idx="+idx+"&currentPage="+cp;
			}
		}
		</script>
	</div>
</body>
</html>