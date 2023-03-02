package study.day0228;

import java.util.Scanner;

public class munje4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
//	       ** 메뉴 **
//	1.원의 넓이 구하기
//	2.사각형의 넓이 구하기
//
//	1번 선택시 원의 반지름을 입력받아 원의 넓이를 구해서 출력하고
//	2번 선택시 가로와 세로길이를 입력받아 사각형의 넓이를 구해서 출력하시오
//	  (switch 문 사용)
		int menu;
		double a,b,c;
		System.out.println("1.원의 넓이 구하기");
		System.out.println("2.사각형의 넓이 구하기");
		menu=sc.nextInt();
		switch(menu) {
		case 1:
			System.out.println("원의 반지름 입력:");
			a=sc.nextInt();
			System.out.println(a*a*Math.PI);//2827.4~
			break;
		case 2:
			System.out.println("사각형의 가로 길이 입력: ");
			b=sc.nextInt();
			System.out.println("사각형의 세로 길이 입력: ");
			c=sc.nextInt();
			System.out.println(b*c);//2827.4~
		}
		
	}

}
