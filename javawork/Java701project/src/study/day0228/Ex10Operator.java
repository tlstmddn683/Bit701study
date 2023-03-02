package study.day0228;

import java.util.Scanner;

public class Ex10Operator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			/*
			 * 윤년의 공식
			 * 년도%4==0 && 년도 %100!=0 ||년도%400==0
			 * 
			 * */
		Scanner sc=new Scanner(System.in);
		int year,month,days;
		System.out.println("년도 입력");
		year=sc.nextInt();
		System.out.println("월 입력");
		month=sc.nextInt();
		
		
		
		//월 입력값이 1~12가 아니면 메인매소드를 종료
//		if(month<1||month>12) {
		if(!(month>=1 && month<=12)) {
			System.out.println("잘못입력했습니다.");
			return;//메인매소드 종료
		}
		//leapyear 에는 조건이 맞으면 true 틀리면 false 대입
		boolean leapyear=year%4==0 && year%100!=0||year%400==0;
		if(leapyear) {//leapyear==true
			System.out.println(year+"년은 윤년입니다.");
		}else {
			System.out.println(year+"년은 평년입니다.");
		}
//		if(month==2) {
//			days=leapyear?29:28;//조건연산자
//			
//		}else if(month==4||month==6||month==9||month==11) {
//			days=30;
//		}else {
//			days=31;
//			
//		}
		//switch문으로 변경
		switch (month) {
		case 2:
			days=leapyear?29:28;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			days=30;
			break;
			//같은 수행문이 실행되는 경우 case만  나열후 
//			마지막에만 수행문을 넣어준다
			
		default:
			days=31;
			break;
		}
		System.out.printf("%d년 %d월 %d일까지 있습니다\n",year,month,days);
	}

}
