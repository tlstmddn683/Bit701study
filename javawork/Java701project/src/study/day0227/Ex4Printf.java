package study.day0227;

public class Ex4Printf {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("apple");//apple
		System.out.println("orange");//orange
		System.out.print("사과");//사과오렌지
		System.out.println("오렌지");
		
		//제어 문자열:\n(엔터),\t(탭)
		System.out.println("사과\n\n");
		System.out.println("오렌지");
		System.out.println("red\tblue\torange");
		
		//\\: \출력됨 ,\":"출력,\':'출력
		System.out.println("\"red\",\"yellow\"");
		System.out.println("\'자바\',\'스프링\'");
		System.out.println("c:\\bit701\\image\\photo.png");
		
		//printf 는 변수값을 변환기호를 이용하여 출력이 가능하다
		//1글자:%c(char), 문자열:%s(String), 정수:%d, 실수:%f
		int java=78;
		int spring=87;
		
		String name="수지";
		double height=167.8;
		char blood='B';
		
		System.out.println("**println 으로 출력**");
		System.out.println("이름: "+name);
		System.out.println("혈액형: "+blood+"형");
		System.out.println("키: "+height+"cm");
		System.out.println("자바: "+java+"점"+",스프링: " +spring+"점");
		System.out.println("총점: "+(java+spring));
		
		System.out.println("\n**printf로 출력**");
		System.out.printf("이름: %s\n",name);
		System.out.printf("혈액형: %c형\n",blood);
		System.out.printf("키: %5.1fCm\n",height);
		//%5.1f:전체자리수:5, 소숫점이하:1
		System.out.printf("자바: %d점,스프링: %d점\n",java ,spring);
		System.out.printf("총점:%d점\n",java+spring);
		
		int a=65;
		System.out.printf("a의 십진수값은 %d, 문자는 %c\n",a,a);
		
	}

}
