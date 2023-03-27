package study.day0309;

import java.util.Scanner;

class ExcepT1{
	public static void inputData() throws NumberFormatException,ArithmeticException
	{
		Scanner sc=new Scanner(System.in);
		int su1,su2;
		System.out.println("숫자 두번 입력");
		su1=Integer.parseInt(sc.next());
		su2=Integer.parseInt(sc.next());
		
		System.out.printf("%d+%d=%d\n",su1,su2,su1+su2);
		System.out.printf("%d/%d=%d\n",su1,su2,su1/su2);
	}
}
public class ExcepT2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			ExcepT1.inputData();
		} catch (NumberFormatException|ArithmeticException e) {
			// TODO: handle exception
			System.out.println("문자or 두번째 입력에서 0이 입력되었습니다."+e.getMessage());
			
		}finally {
			System.out.println("**finally = 무조건 실행되는 영역 **");
		}
		System.out.println("**시스템 종료!!**");
	
	}

}
