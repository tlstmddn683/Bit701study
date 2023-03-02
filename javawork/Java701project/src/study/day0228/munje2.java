package study.day0228;

import java.util.Scanner;

public class munje2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		상품명과 수량 단가를 입력받아서 총 금액을 구해서 출력하시오
//	      (단 수량이 5개 이상이면 총금액 출력후 10프로 디씨된 금액도 같이 출력해주세요)
//	      (Scanner,if 문)
//	     (예)
//	            상품명 
//	              딸기
//	            수량
//	               5
//	            단가
//	               1000
//	                
//	             총 5000 원
//	             10프로 할인된 금액  4500 원  <-이건 5개 이상일경우에만 출력
		Scanner sc=new Scanner(System.in);
		String name;
		int su,danga; 
		
		System.out.println("상품명: ");
		name=sc.nextLine();
		System.out.println("수량: ");
		su=sc.nextInt();
		System.out.println("단가: ");
		danga=sc.nextInt();
		
		int total=su*danga;
		System.out.printf("상품명:%s\n",name);
		System.out.printf("수량:%s\n",su);
		System.out.printf("단가:%s\n",danga);
		System.out.printf("총:%s원\n ",total);
	
		if(su>=5) {
			System.out.println("10프로 할인된 금액"+total*0.9+"원");
		}
		
		
	
	}
}
