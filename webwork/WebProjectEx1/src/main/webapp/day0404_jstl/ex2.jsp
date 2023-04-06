<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
</style>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<form action="ex2.jsp" method="post">
		이름 : <input type="text" name="irum" value="${param.irum}"><br>
		나이 : <input type="text" name="nai" value="${param.nai}"><br>
		가고싶은 나라 : <input type="text" name="nara" value="${param.nara}"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<c:if test="${!empty param.irum}">
	이름 : ${param.irum}<br>
	나이 : ${param.nai}<br>

		<c:if test="${param.nai>=20}">
			<h2 style="color: blue">${param.irum}님은성인입니다</h2>
		</c:if>
		<c:if test="${param.nai<20}">
			<h2 style="color: blue">${param.irum}님은미성년자입니다</h2>
		</c:if>

		<c:set var="nara" value="${param.nara}" />

		<c:choose>
			<c:when test="${nara=='하와이'}">
				<h3 style="color: green">하와이의 바다는 아름답습니다</h3>
			</c:when>
			<c:when test="${nara=='프랑스'}">
				<h3 style="color: green">프랑스의 에펠탑은 아름답습니다</h3>
			</c:when>
			<c:when test="${nara=='미국'}">
				<h3 style="color: green">미국의 대륙은 매우 넓고 방대합니다</h3>
			</c:when>
			<c:when test="${nara=='시공의 폭풍'}">
				<h3 style="color: green">♚♚히어로즈 오브 더 스☆톰♚♚가입시$$전원 카드팩☜☜뒷면100%증정※ ♜월드오브 워크래프트♜펫 무료증정￥ 특정조건 §§디아블로3§§★공허의유산★초상화획득기회@@ 즉시이동http://kr.battle.net/heroes/ko/</h3>
			</c:when>
			<c:otherwise>
				<h3 style="color: gray">${nara}는 가 보지 못했지만 좋은 곳 입니다</h3>
			</c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>