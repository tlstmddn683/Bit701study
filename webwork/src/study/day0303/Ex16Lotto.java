package study.day0303;

import java.util.Random;
import java.util.Scanner;

public class Ex16Lotto {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		int money;
		int count=0;
		int[] lotto = new int[6];
		int min=1;
		int max=45;
		
		
		System.out.println("로또 구입 금액: ");
		money=sc.nextInt();
		
		for(int i=0;i<lotto.length;i++) {
			count++;
			lotto[i]=(r.nextInt((max-min)+1)+min);
			
			System.out.print(lotto[i]+"\t");
			for(int j=0;j<i;j++) {
				if(lotto[i]==lotto[j])//중복처리로직
					i--; //제자리유지
				
			
			if(lotto[i]<lotto[i]) {
				int temp=lotto[i];
				lotto[i]=lotto[j];
				lotto[j]=temp;
				
				 for (i = 0; i < lotto.length; i++) {
			            System.out.println( lotto[i]);
				
				 }
			}
		}
	}
}
}
	
		
		// 금액을 입력후 금액만큼 로또 출력(1~45 중복없는 숫자로 오름차순 정렬로 출력)(다중 for문 두번)
		// 단 금액이 1000원 미만이면 "금액이 부족합니다" 라고 출력후 메인 종료
		// 입력한 금액만큼 (천원당 1회) 반복해서 로또 숫자를 구한후 정렬후 출력
		/*
		 * (예시)
		 *  로또 구입 금액 : 5000
		 * ============================ 
		 * 1회:5 12 25 34 41 45 
		 * 2회: 
		 * 3회:
		 * 4회: 
		 * 5회:
		 */
		




