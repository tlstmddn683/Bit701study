package study.day0302;

import java.util.Scanner;

public class Ex9Loop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		 int menu;
		 int su1,su2,i;
		 int sum;
		 Exit:
		 while(true) {
			 System.out.println("**Menu**");
			 System.out.println("1. 숫자입력후 1부터 그숫자까지 합계 구하기");
			 System.out.println("2. 2개의 숫자입력후 숫자1~숫자2까지 합계 구하기");
			 System.out.println("3. 숫자입력후 1부터 그숫자까지 팩토리얼(!) 구하기");
			 System.out.println("4. 두개의 숫자su1,su2 입력후 su1의 su2승 구하기");
			 System.out.println("5. 종료");
			 
			 menu=sc.nextInt();
			 switch(menu) {
			 case 1:
				 System.out.println("숫자입력");
				 su1=sc.nextInt();
				 sum=0;
				 for(i=1;i<=su1;i++)
					 sum+=i;
				System.out.println("1부터"+su1+"까지의 합은"+sum+"입니다.");
				 
				 break;
			 case 2:
				 System.out.println("두 숫자입력");
				 su1=sc.nextInt();
				 su2=sc.nextInt();
				 sum=0;
				 for(i=su1;i<=su2;i++)
					 sum+=i;
				System.out.println(su1+"부터"+su2+"까지의 합은"+sum+"입니다.\n");				 
				 break;
			 case 3:
				 System.out.println("숫자입력");
				 su1=sc.nextInt();
				 sum=1;
				 for(i=1;i<=su1;i++)
					 sum*=i;
				 System.out.println("1부터"+su1+"까지의 팩토리얼값은"+sum+"입니다.");
				 break;
			 case 4:
				 System.out.println("지수승을 구할 두숫자 입력");
				 su1=sc.nextInt();
				 su2=sc.nextInt();
				 sum=1;
				 for(i=1;i<=su2;i++)
					 sum*=su1;
				 System.out.println(su1+"의"+su2+"승은"+sum+"입니다.");
				 break;
			default:
				System.out.println("**프로그램종료**");
				/*break 만 쓸 경우 switch만 빠져나옴 while문은 계속 반복중*/
				break Exit;//while문을 빠져나온다.
			 }
			 System.out.println();
		 }
	}

}
