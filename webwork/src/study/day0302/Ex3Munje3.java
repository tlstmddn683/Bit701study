package study.day0302;

import java.util.Date;
import java.util.Scanner;

public class Ex3Munje3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		int year,month,day,week;
		String weekday;
		
		System.out.println("년도 와 월 일을 차례대로 입력");
		year=sc.nextInt();
		month=sc.nextInt();
		day=sc.nextInt();
		//date 클래스 생성
		Date date=new Date(year-1900,month-1,day);
		//요일 숫자 구하기
		week=date.getDay();
		//요일 구하기
		weekday=week==0?"일":week==1?"월":week==2?"화":week==3?"수":week==4?"목":week==5?"금":"토";
		System.out.printf("%d년 %02d월 %02d일은 %s요일입니다.",year, month,day,weekday);
	}
	
}
