package study.day0302;

import java.util.Scanner;

public class Ex10Loop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		int menu, dan;
		while(true) {
			System.out.println("1. 구구단 출력 2.전체 구구단 3.종료");
			menu=sc.nextInt();
			if(menu==1) {
				//조건 2~9사이 숫자 입력시 해당구구단 출력
				//그값을 벗어날 경우 잘못입력했습니다 메시지 출력후 다시 메뉴로
				//continue
				System.out.println("구구단 입력");
				dan=sc.nextInt();
				if(dan<2||dan>9) {
					System.out.println("잘못입력했습니다");
					continue;
					
				}else {
					System.out.println("**"+dan+"단**\n");
					for(int i=1;i<=9;i++)
					{
						System.out.printf("%d x %d = %2d\n",dan,i,dan*i);
					}
				}
			
			}else if(menu==2) {
				//제목부분
				for(dan=2;dan<=9;dan++) {
					System.out.printf("%d단\t\t",dan);
					
				}
				System.out.println();
				//2~9단 가로방향 출력
				for(int i=1;i<=9;i++) {
					for(dan=2;dan<=9;dan++) {
						System.out.printf("%d X %d = %2d\t", dan,i,dan*i);
					}
					System.out.println();
				}
			}else {
				System.out.println("**프로그램종료**");
				break;
			}
			
		}
		
		
	}

}
