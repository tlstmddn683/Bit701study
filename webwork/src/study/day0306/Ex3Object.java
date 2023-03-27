package study.day0306;
/*
 * 멤버 변수 선언시 static 을 붙이면 class 멤버 변수라고한다
 * 클래스명 .static멤버 변수 이렇게 호출이 가능하기때문
 * static 멤버 변수는 같은 객체 생성시 공유되는값
 * 
 * static 메소드의 특징 : this가 존재하지않음
 * 			그러므로 일반 멤버변수나 메소드는 호출이 불가능!
 * 		(단 ,new로 생성시 가능!)
 * static멤버변수나 멤버 메소드는 인스턴스가 없어도 호출가능!
 * 
 */
public class Ex3Object {
	//인스턴스 멤버 변수 선언,null값이나 0으로 자동초기화
	String name;
	int score;
	
	//static(클래스)멤버변수 선언
	static String message="월요일!";
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println(name);//오류 발생!
		
		//static 메소드는 this라는 인스턴스 변수가 존재하지않음
		//그래서 부득히 접근을 해야된다면 new 로 생성후 접근함
		Ex3Object ex3=new Ex3Object();
		ex3.name="홍길동";
		ex3.score=90;
		
		System.out.println("이름: "+ex3.name);
		System.out.println("점수: "+ex3.score);
		
		System.out.println(message);//static변수는 호출가능
		System.out.println(Ex3Object.message);
		//원래는 앞에 클래스 명이 붙는데 자기자신일 경우는 생략된다.
	
	}

}
