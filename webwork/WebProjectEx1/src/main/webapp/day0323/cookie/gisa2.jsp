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
미국 연방준비제도가 기준금리를 0.25%포인트 인상했습니다.

이로써 미국 기준금리는 4.75에서 5%.

2007년 9월 이후 가장 높은 수준입니다.

제롬 파월 연준 의장은 금리 동결도 검토했었지만, 물가 상승 압력이 너무 높다며 인상 이유를 설명했습니다.

[제롬 파월/미국 연방준비제도 의장]
"인플레이션은 여전히 너무 높고 노동 시장 역시 계속해서 매우 강력합니다. 우리는 물가상승률을 목표치인 2%로 되돌리는 데 강력하게 전념하고 있습니다."

최근 은행 파산 사태에 대해서는 미국의 은행 시스템은 건전하다고 강조했습니다.

[제롬 파월/미국 연방준비제도 의장]
"우리는 계속해서 은행 시스템의 상황을 면밀히 살펴볼 것이며, 은행 시스템을 안전하고 건전하게 유지하기 위해 필요한 모든 수단을 사용할 준비가 되어 있습니다."

올해 최종 금리 전망치는 5.1%로 작년 12월과 같은 수준을 유지했습니다.

따라서 연준이 올해 기준금리를 한번 정도 더 인상할 것으로 예상됩니다.

다만 파월 의장은 올해 중 금리 인하는 없을 거라고 못박았습니다.

여기에 재닛 옐런 재무장관이 미국 의회 청문회에 출석해 모든 예금에 대해 보호 조치를 고려하는 건 아니라고 밝히면서 뉴욕증시는 주요 지수가 1% 넘게 하락했습니다.

특히 어제 30% 가까이 급등한 퍼스트리퍼블릭은행 주가는 다시 15% 넘게 떨어지는 등 은행 관련 주가들이 하락했습니다.

이번 금리 인상으로 현재 3.5%인 한국의 기준금리와 미국의 금리 차이는 1.5% 포인트까지 벌어졌습니다.

한미 금리 차이가 2000년 이후 가장 큰 폭을 기록하면서 외화 유출 등 우려가 나오는 가운데 우리나라 기준 금리에 대한 인상 압박도 커질 것으로 보입니다.

뉴욕에서 MBC뉴스 강나림입니다.
	
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