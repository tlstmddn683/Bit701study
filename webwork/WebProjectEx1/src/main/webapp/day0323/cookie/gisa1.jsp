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
코로나19로 인한 소득 최하위 계층의 우울 증상 유병률이 최상위 계층보다 2배 이상 높은 것으로 나타났다.
경기연구원은 2021년 3월 전국 17개 시도에 사는 2000명을 대상으로 정신건강실태 설문조사를 벌여
그 결과를 분석한 ‘코로나19 팬데믹은 우리에게 평등하지 않았다’라는 제목의 보고서를 23일 발간했다.
보고서에 따르면 코로나19로 인한 우울 증상 유병률은 월평균 가구소득 100만원 미만인 소득 최하위 계층(32.8%)과 500만원 이상인
최상위 계층(13.4%)의 격차가 2.4배로 나타났다.
코로나19 팬데믹으로 인해 극단적 선택을 생각한 비율도 최하위 계층(24.1%)이 최상위 계층(6.74%)보다 약 3.6배 많았다.
가구 구성원별로는 1인 가구의 위험이 더욱 컸다.
1인 가구의 우울 증상 유병률(21.6%)은 2인 이상 가구(17.2%)와 4.4%포인트 격차를 보였다.
코로나19로 극단적 선택을 생각한 비율도 1인 가구(13.5%)와 2인 이상 가구(7.7%)가 1.8배 격차를 나타냈다.
이은환 경기연구원 연구위원은 “연구를 통해 코로나19 팬데믹이 국민 정신건강에 미치는 영향은 개인의 사회경제적 위치에 따라 건강불평등이 발생하고 있는 것을 확인했다”
며 “향후 정책당국은 코로나19와 같은 신종 감염병으로 인한 재난이 발생했을 때 국민 정신건강 위험을 줄이기 위한 대응방안 마련에 만전을 기해야 할 것”이라고 말했다.

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