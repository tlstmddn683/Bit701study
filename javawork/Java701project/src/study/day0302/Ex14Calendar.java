package study.day0302;

import java.util.Date;
import java.util.Scanner;

public class Ex14Calendar {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//년도와 월을 입력시 해당 달력을 출력해보자
		Scanner sc=new Scanner(System.in);
		int year,month,week,endday;
		
		System.out.println("년도와 월 입력");
		year=sc.nextInt();
		month=sc.nextInt();
		if(year<1||month>12) {
			System.out.println("월 입력을 잘못했습니다(1~12)");
			return;//메인메소드 종료
			
		}
		System.out.printf("%20d년 %2d월 달력\n\n",year,month);
		System.out.println("일\t월\t화\t수\t목\t금\t토");
		System.out.println("=".repeat(50));
		//입력한 년도, 월의 1일이 무슨요일인지 week값이 필요하다
		Date date=new Date(year-1900,month-1,1);
		week=date.getDay();
		//입력한 년도의 월이 며칠까지 있는지 구하기
		switch(month) {
		case 2:
			if(year%4==0&&year%100!=0||year%400==0)
				endday=29;
			else
				endday=28;
			break;
		case 4: case 6: case 9:case 11:
			endday=30;
			
			break;
			default:
				endday=31;
				break;
		}
		//week 숫자만큼 \t으로 띄워주기
		for(int i=1;i<=week;i++) {
			System.out.print("\t");
		}
		//1일부터 endday까지 출력(토요일은 출력후 \n)
		for(int i=1;i<=endday;i++) {
			week++;
			System.out.printf("%2d\t",i);
			if(week%7==0) {
				System.out.println();
			}
		}
	}

}
