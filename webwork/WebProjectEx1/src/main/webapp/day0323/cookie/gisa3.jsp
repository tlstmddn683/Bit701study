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
<%
boolean b = false;//amho 쿠키가 존재한다면 true로 변경
//브라우저에 저장된 모든 쿠키값들을 얻는다
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		String cname = cookies[i].getName();
		String cvalue = cookies[i].getValue();
		if (cname.equals("amho") && cvalue.equals("1234")) {
	//amho 쿠키가 존재하므로 b를 true로 변경한다
	b = true;
		}
	}
}
%>
<body>
<%
	if (b) {
	%>
	<pre>
미군 정찰기가 23일 동해 상공에서 정찰비행에 나섰다. 전날 북한이 순항미사일을 발사한 직후라는 점에서 북한 미사일 동향을 감시하려는 움직임으로 해석된다.
항공기 추적 사이트 등에 따르면, 미군 RC-135S 전자정찰기가 일본 혼슈 지역을 가로질러 동해상으로 비행하며 정찰에 나섰다. RC-135S는 적외선 센서와 광학 카메라,
첨단 통신설비를 갖추고 탄도 미사일의 발사 징후와 궤적을 추적하는 비행기다.
미군 정찰기의 비행은 북한의 움직임을 면밀히 감시하고 있다는 미국 정부 입장과 맥락을 같이 한다. 존 커비 백악관 국가안보회의(NSC) 전략소통조정관은 22일(현지시간)
브리핑에서 ‘북한이 최근 전술핵무기 시뮬레이션을 진행했고 김정은은 언제든 핵 공격에 대한 준비를 지시했는데,
북한의 핵 공격이 임박했다고 보느냐’는 질문에 “현재로선 실제로 그런 종류의 공격이 임박했다고 믿을만한 정보나 징후가 없지만 최대한 면밀히 지켜보며 감시하고 있다”고 답했다.
	</pre>
<%
	} else {
	%>
	<script type="text/javascript">
		alert("먼저 로그인 후 기사를 확인하세요");
		history.back();
	</script>


	<%
	}
	%>
</body>
</html>