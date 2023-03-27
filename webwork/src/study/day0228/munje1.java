package study.day0228;

import java.util.Scanner;

public class munje1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		점수를 반복적으로 입력받아 총 몇개 입력인지 출력하고
//	    그 점수들의 합계를 출력하시오(점수를 0 입력시 while문 빠져나와서 합계와 갯수 출력)
//	    (while,Scanner)

		java.util.Scanner input = new java.util.Scanner(System.in);
		int score=0;
		int total=0;
		System.out.println("입력 받은 정수로 합 구하기");
		System.out.println("점수를 입력하시오");
		while((score=input.nextInt()) !=0)
		{
			
			total+=score;
			
					System.out.println("누적합=" +total);
					System.out.println("누적할 데이터 입력>");
					System.out.println();
		}
		System.out.println("End, 총합: "+total);
		
	}

}
