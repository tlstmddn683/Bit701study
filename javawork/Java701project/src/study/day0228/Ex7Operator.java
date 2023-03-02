package study.day0228;

import java.util.Scanner;

public class Ex7Operator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		int money;
		System.out.println("당신의 월 급여는?");
		money=sc.nextInt();
		/*
		 * 예)2345678
		 * 		만원:234장
		 * 		천원:5장
		 * 		백원:6개
		 * 		십원:7개
		 * 		일원:8개
		 * 
		 * */
	System.out.println("만원: "+money/10000+"장");
	System.out.println("천원: "+(money%10000)/1000+"장");
	System.out.println("백원: "+(money%1000)/100+"개");
	System.out.println("십원: "+(money%100)/10+"개");
	System.out.println("일원: "+money%10+"개");
	}

}
