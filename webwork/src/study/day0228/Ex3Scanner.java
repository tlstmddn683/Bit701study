package study.day0228;

import java.util.Scanner;

public class Ex3Scanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner	sc=new Scanner(System.in);
//		int kor,eng;
//		System.out.println("Input Kor? ");
//		kor=sc.nextInt();
//		System.out.println("Input eng? ");
//		eng=sc.nextInt();
//		int sum=kor+eng;
//		System.out.println("두 과목의 합은 "+sum+"점 입니다.");
//		String name;
//		int age;
//		System.out.println("이름입력: ");
//		name=sc.nextLine();
//		System.out.println("나이입력: ");
//		age=sc.nextInt();
//		System.out.printf("%s님의 나이는 %d세 입니다.",name,age);
		
		String name;
		int age;
		
		System.out.println("이름입력: ");
		//숫자입력후 문자입력시에만 문제가 발생한다
		age=sc.nextInt();
		//키보드 버퍼의 엔터 문자를 먼저 읽어서 없앤다
		sc.nextLine();
		
		System.out.println("나이입력: ");
		name=sc.nextLine();
		System.out.printf("%s님의 나이는 %d세 입니다.",name,age);
	}

}
