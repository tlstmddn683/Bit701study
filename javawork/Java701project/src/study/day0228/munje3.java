package study.day0228;

import java.util.Date;
import java.util.Scanner;

public class munje3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		태어난 년도와 월 일을 키보드로부터 입력받아 그날이 무슨 요일인지 출력하시오
//	       (Scanner, Date  클래스 사용)
		Scanner sc=new Scanner(System.in);
		
		int year,month,day;
		String week;
		
		System.out.println("년도는?");
		year=sc.nextInt();
		System.out.println("몇 월?");
		month=sc.nextInt();
		
		Date date=new Date(year-1900,month-1,5);
		day=date.getDay();
		
		week=day==0?"일":day==1?"월":day==2?"화":day==3?"수":day==4?"목":day==5?"금":"토";
		System.out.printf("%d년 %d월 5일은 %s요일 입니다. \n",year,month,week);
	}

}
