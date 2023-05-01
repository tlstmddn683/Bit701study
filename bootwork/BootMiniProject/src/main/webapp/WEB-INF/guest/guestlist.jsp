<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="../commonvar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body, body *{
		font-family: 'Jua'
	}
	.small_photo{
		border:5px solid pink;
		border-radius:30px;
		margin-right:10px;
	}
	.today{
	float:right;
	color:#ccc;
	font-size:14px;
	margin-right:10px;
	}
	div.guest_box{
	width:500px;
	height:200px;
	border:2px solid lightgray;
	margin-bottom:20px;
	padding:10px 20px;
	margin-left:100px;
	}
	div.guest_box>div{
	margin-bottom:10px;
	}
	.photodel{
		cursor:pointer;
		font-size:1.5em;
		position:relative;
		left:-45px;
		top:-22px;
		visibility: hidden;
		z-index:10;
		color:yellow;
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
		if(content.length==0){
			alert("내용을 입력해주세요!");
			return false;
		}
		if(nn.length==0){
			alert("닉네임을 입력해주세요!");
			return false;
		}
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
	//이미지 이벤트
	$(document).on("mouseover",".photo_box img",function(){
		$(this).next().css("visibility","visible");
	});
	$(document).on("mouseout",".photo_box img",function(){
		$(this).next().css("visibility","hidden");
	});
	$(document).on("mouseover",".photodel",function(){
		$(this).css("visibility","visible");
	});
	$(document).on("mouseout",".photodel",function(){
		$(this).css("visibility","hidden");
	});
	// X(삭제) 아이콘 이벤트
	$(document).on("click",".photodel",function(){
		//e.stopPropagation(); 이벤트 버블링을 제어해주는 코드
		let b=confirm("해당 사진을 삭제하시겠습니까?");
		if(b){
			let photo_idx=$(this).attr("photo_idx");
			//alert(photo_idx);
			$.ajax({
				type:"get",
				url:"./deletephoto",
				data:{"photo_idx":photo_idx},
				dataType:"text",
				success:function(){
					alert("삭제 -완-!");
					//목록 재 호출
					list();	
				}
			});
		}
	});
	//방명록 삭제 이벤트
	$(document).on("click",".guestdel",function(){
		//e.stopPropagation(); 이벤트 버블링을 제어해주는 코드
		let b=confirm("해당 방명록을 삭제하시겠습니까?");
		if(b){
			let guest_idx=$(this).attr("guest_idx");
			//alert(photo_idx);
			$.ajax({
				type:"get",
				url:"./delete",
				data:{"guest_idx":guest_idx},
				dataType:"text",
				success:function(){
					alert("삭제 -완-!");
					//목록 재 호출
					list();	
				}
			});
		}
	});
	
});//$function close

function large_photo(photoname)
{
	//alert(photoname);
	let src=`https://${imageUrl}/guest/\${photoname}`;
	$("#largephoto").attr("src",src);
}

function list()
{
	$.ajax({
		type:"get",
		url:"./alist",
		dataType:"json",
		success:function(res){
			let s="";
			$.each(res,function(idx,ele){
				s+=`
			<div class='guest_box'>
				<div>
					<b>\${ele.nickname}</b>
					<span class='today'>\${ele.writeday}
					&nbsp;<i class="bi bi-trash2 guestdel" guest_idx="\${ele.guest_idx}" style="cursor:pointer;"></i>
					</span>
				</div>
				<pre>\${ele.content}</pre>
		
				`;
				//각 방명록에 추가한 이미지 출력
				s+="<div class='photo_box'>";
				$.each(ele.photoList,function(pidx,pele){
					s+=`
					
					<img src="http://${imageUrl_small}/guest/\${pele.photoname}?type=f&w=80&h=80&faceopt=true&ttype=jpg"
									class="small_photo" onclick="large_photo('\${pele.photoname}')" 
									data-bs-toggle="modal" data-bs-target="#myGuestModal" style="cursor:pointer;">	
									<i class="bi bi-x-square photodel" photo_idx="\${pele.photo_idx}" ></i>
					`;
				});
				s+="</div></div>";
			});
			$("div.alist").html(s);
		}
	});
}
</script>
</head>
<body>
<!-- The Modal -->
<div class="modal fade" id="myGuestModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">원본사진</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <img src="" id="largephoto" style="max-width:100%">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>





<div style="width:500px;margin-left: 100px;">
	<input type="text" id="nickname" class="form-control" placeholder="닉네임"  style="width: 200px;">
	
	<textarea style="width:80%;height: 100px"  class="form-control" id="content"></textarea>
	<input type="file" id="photoupload" multiple="multiple">
	<button type="button" class="btn btn-sm btn-outline-success" id="guestadd">등록</button>
</div>
<hr>
<div class="alist">
</div>
</body>
</html>
