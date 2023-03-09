package study.day0309;

import java.util.Scanner;

class ExcepTest2
{
	//throws: 메소드를 호출하는 곳으로 2개의 예외를 던진다
	public static void inputData() throws NumberFormatException,ArithmeticException
	{
		Scanner sc=new Scanner(System.in);
		int su1,su2;
		System.out.println("두개의 숫자입력");
		su1=Integer.parseInt(sc.next());
		su2=Integer.parseInt(sc.next());
		
		System.out.printf("%d + %d = %d\n",su1,su2,su1+su2);
		System.out.printf("%d / %d =%d\n",su1,su2,su1/su2);
	}
}
public class Ex2Exception {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		try {
//			ExcepTest2.inputData();
//		}catch (NumberFormatException e) {
//			// TODO: handle exception
//			System.out.println("문자가 입력됨: "+e.getMessage());
//		}catch (ArithmeticException e) {
//			// TODO: handle exception
//			System.out.println("2번째 숫자가 0이 입력됨:"+e.getMessage());
//		}
			//두개의 Exception 을 묶어서 처리하고 묶어서 처리하고싶을때
		try {
			ExcepTest2.inputData();
		} catch (NumberFormatException|ArithmeticException e){
			System.out.println("문자가 들어갔거나 2번째 숫자가 0이 입력된 경우:"+e.getMessage());
			// TODO: handle exception
		}finally {
			System.out.println("*****여기는 무조건 실행되는 영역이다*****");
		}
		System.out.println("\t***정상 종료***");
	}

}
