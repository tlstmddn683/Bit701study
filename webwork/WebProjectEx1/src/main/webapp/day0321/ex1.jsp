<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.hello{
	color:orange;
	font-size:15px;
}
</style>
</head>
<body>
	<h3 style="color:green;">Hello JSP</h3>
	<script>
	for(let i=1;i<=10;i++){
		//document.write("<b class='hello'>"+i+"</b>&nbsp;");
		//es6 literal 사용시 변수값 가져오는 $ 앞에 \를 붙여야된다
		//왜냐하면 JSP에서 $에는 다른 기능이 이미 존재하기 때문이다
		document.write(`<b class='hello'>\${i}</b>&nbsp;`);
	}
	
	</script>
	<%
	//이곳은 자바영역이다..scriptlet 이라고 부른다
	//이곳에서 선언하는 변수는 지역변수가 된다
	String name="홍길동";
	int year=2010;
	//브라우저로 출력시 out이라는 내장객체를 사용해도 된다.(out은 jspwriter)
	out.print("<h2>내 이름은 "+ name+"이고"+ year+"년 생 입니다.</h2>");
	%>
	
	
	<%=getAddress() %><br>
	<%=address %><br>
	<%=MESSAGE %><br>
	
	
	<!-- 표현식을 이용하여 자바영역의 변수 출력이 가능하다 -->
	<h2>내 이름은<%=name%>이고 <%=year%>년 생입니다.^^2</h2>
	
	<!-- 클래스 멤버변수나 메서드를 선언하려면 선언문을 사용하여야 한다 -->
	<%!
	//이곳에서 선언한 변수나 메서드는 멤버로 구현된것이므로
	//위치상관없이 어느곳에서든 호출이 가능하다!!
	final static String MESSAGE="Bitcamp 701";
	String address="강남구 역삼동";
	
	public String getAddress(){
		return "우리집은 " +address;
	}
	%>
	
	
</body>
</html>