package study.day0228;

import java.util.Scanner;

public class Ex4Scanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			Scanner sc=new Scanner(System.in);
			String name,java,spring;
			System.out.println("이름입력: ");
			name=sc.nextLine();
			System.out.println("자바점수입력: ");
			java=sc.nextLine();
			System.out.println("스프링점수입력: ");
			spring=sc.nextLine();
			
//			int total=Integer.parseInt(java)+Integer.parseInt(spring);
			//실수형 입력시  double 타입으로 변환
			//wrappre class= Integer,Double,Float등등: 변환을 하기위한 클래스들
			double total=Double.parseDouble(java)+Double.parseDouble(spring);
//			System.out.println("이름:"+name);
//			System.out.println("자바점수:"+java);
//			System.out.println("스프링점수:"+spring);
//			System.out.println("총 점:"+total);
			System.out.printf("이름:%s\n",name);
			System.out.printf("자바점수:%s\n",java);
			System.out.printf("스프링점수:%s\n",spring);
			System.out.printf("총점:%5.1f\n",total);
	}

}
