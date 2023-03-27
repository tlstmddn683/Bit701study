package study.day0302;

import java.util.Scanner;

public class Ex4Munje4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		int num;
		double area,r,w,h;
		System.out.println("**메뉴**");
		System.out.println("1.원의 넓이 구하기");
		System.out.println("2.사각형의 넓이 구하기");
		
		num=sc.nextInt();
		switch(num) {
		case 1:
			System.out.println("원의 반지름입력");
			r=sc.nextInt();
			area=r*r*Math.PI;
			System.out.printf("반지름이 %3.1f인 원의 넓이는 %4.1f입니다",r,area);
			break;
		case 2:
			 System.out.println("사각형의 가로길이와 세로길이를 입력하세요");
			 w=sc.nextDouble();
			 h=sc.nextDouble();
			 area=w*h;
			 System.out.printf("가로 %3.1fCm이고 세로 %3.1fCm인 사각형의 넓이는 %4.1f 입니다" ,w,h,area);
			break;
		default:
			System.out.println("잘못입력했습니다");
		}
	}

}
