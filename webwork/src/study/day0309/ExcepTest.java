package study.day0309;

import java.util.Scanner;

class ExcepT{
	public static void writeArray()
	{
		int []arr= {1,2,3,4,5};
		for(int i=0;i<=arr.length;i++) {
			try {
				System.out.println(arr[i]);
			} catch (ArrayIndexOutOfBoundsException e) {
				// TODO: handle exception
				{
					System.out.println("에러메세지: \n"+e.getMessage());
				}
				
			}
		}
	}
	public static void writeData()
	{
		Scanner sc=new Scanner(System.in);
		System.out.println("숫자를 두번 입력해주세요!");
		int su1,su2;
		try {
			su1=Integer.parseInt(sc.next());
			su2=Integer.parseInt(sc.next());
			System.out.printf("%d+%d=%d\n",su1,su2,su1+su2);
			System.out.printf("%d*%d=%d\n",su1,su2,su1*su2);
		} catch (NumberFormatException|ArithmeticException e) {
			// TODO: handle exception
			
			System.out.println(" 문자를 포함하여 입력했습니다.\n"+e.getMessage());
			
		}
	}
}


public class ExcepTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ExcepT.writeArray();
		ExcepT.writeData();
		System.out.println("시스템종료!!");
	}

}
