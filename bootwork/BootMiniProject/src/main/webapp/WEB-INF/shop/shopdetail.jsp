<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp" %>
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
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body, body * {
	font-family: 'Jua'
}

div.shop {
	width: 600px;
	height: 800px;
	font-size: 25px;
	color: gray;
	padding-left: 10px;
	padding-top: 10px;
	margin-left: 30px;
	margin-top: 30px;
	border: 3px solid gray;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="shop">
		<img
			src="https://${imageUrl}/shop/${dto.photo}"
			style="width: 60%; margin-left: 100px"> <br>
		<br> 상 품 명: ${dto.sangpum} <br>
		<div style="color:${dto.color}">색 상: ${dto.color}</div>
		가 격:
		<fmt:formatNumber type="currency" currencySymbol="￦"
			value="${dto.price}" minFractionDigits="0" />
		<br> 갯 수: ${dto.cnt} 개
		 <br> 입 고 일: <fmt:formatDate value="${dto.ipgoday}" pattern="yyyy년 MM월 dd일" />
		<br>
	</div>
	<div style="font-size: 25px; cursor: pointer; margin-left: 30px;text-align:center;border:2px solid gray;width:600px">
	<i class="bi bi-card-list" onclick="location.href='list'">목록</i>&nbsp;&nbsp;
	<i class="bi bi-pencil-square"
	 data-bs-toggle="modal" data-bs-target="#myPhotoModal">사진수정</i> &nbsp;&nbsp;
	 <i class="bi bi-pencil-square"
	 data-bs-toggle="modal" data-bs-target="#myShopModal">내용수정</i> &nbsp;&nbsp;
	<i class="bi bi-trash" id="delshop" >삭제</i>
	</div>
		<script type="text/javascript">
			$("#delshop").click(function(){
				let a=confirm("삭제하려면 확인을 눌러주세요!");
				if(a){
					location.href='./delete?num='+${dto.num}
				}
			});
		</script>
		<!-- 사진변경 모달 -->
<div class="modal" id="myPhotoModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">사진 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <img src="http://${imageUrl_small}/shop/${dto.photo}?type=f&w=160&h=160&faceopt=true&ttype=jpg"
        border="2" style="margin-left:40px;border-radius:10px;" id="modalphoto">
        <!-- 카메라 모양 -->
        <i class="bi bi-camera2 update-photo" style="position:absolute;left:180px;top:150px;font-size:25px;cursor:pointer;"></i>
        <!-- 사진업로드 -->
        <input type="file" id="photoupload" style="display: none;">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="location.reload()">Apply</button>
      </div>

    </div>
  </div>
</div>
<script type="text/javascript">
$(".update-photo").click(function(){
	$("#photoupload").trigger("click");//click이벤트 강제 발생!
});
/*processData:false :서버에 전달하는 데이터는 query string 이라는 형태로 전달됨
 파일 전송의 경우 이를 하지않아야 하는데 그설정이 false,
 contentType:false : enctype이 원래 기본값이  application/x-www......이런건데
 multipart/form-data로 변경해준다
 */


$("#photoupload").change(function(){
	let form=new FormData();
	form.append("upload",$("#photoupload")[0].files[0]);//선택한 1개의 파일만 업로드!
	form.append("num",${dto.num});
	$.ajax({
		type:"post",
		dataType:"text",
		url:"./photochange",
		data:form,
		processData:false,
		contentType:false,
		success:function(res){
			let src=`http://${imageUrl_small}/shop/\${res}?type=f&w=160&h=160&faceopt=true&ttype=jpg`;
			$("#modalphoto").attr("src",src);
		}
	});
});
</script>
		<!-- 내용변경 모달 -->
<div class="modal" id="myShopModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">상품정보수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <img src="http://${imageUrl_small }/shop/${dto.photo}?type=f&w=160&h=160&faceopt=true&ttype=jpg"
        border="2" style="margin-left:100px;border-radius:100px;">
    <br>
	<br>
	<form id="updateform">
	<input type="hidden" name="num" value="${dto.num}">
			<table class="table table-bordered">
				<tr>
					<th style="width: 100px; background-color: #ddd">상품명</th>
					<td><input type="text" class="form-control" name="sangpum" required="required" value="${dto.sangpum}">
					</td>
				</tr>
				<tr>
					<th style="width: 100px; background-color: #ddd">색상</th>
					<td><input type="color" class="form-control" name="color"
						value="${dto.color}"></td>
				</tr>
				<tr>
					<th style="width: 100px; background-color: #ddd">가격</th>
					<td><input type="number" class="form-control" name="price"
						min="1000" max="999999" step="5000" value="${dto.price}"></td>
				</tr>
				<tr>
					<th style="width: 100px; background-color: #ddd">갯수</th>
					<td><input type="number" class="form-control" name="cnt"
						min="1" max="5" step="1" value="${dto.cnt}"></td>
				</tr>
			</table>
		</form>
		</div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="btnupdate">Apply</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
 $("#btnupdate").click(function(){
	 let data=$("#updateform").serialize();
	 //alert(data);
	 $.ajax({
			type:"get",
			dataType:"text",
			url:"./update",
			data:data,
			success:function(res){
				location.reload();
			}
		});
 });
 
</script>
</body>
</html>
