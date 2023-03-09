package study.day0309;

import java.util.Scanner;

class ExcepTest1
{
	public static void writeArray()
	{
		int []arr= {5,7,9};
		for(int i=0;i<=arr.length;i++)
		{
			//예외 발생가능부분에서 try~catch를 이용해서 직접처리
			try {
				
			System.out.println(arr[i]);
			}catch(ArrayIndexOutOfBoundsException e)
			{
//				e.printStackTrace();//예외 추적-라인번호,에러메시지 출력
				System.out.println("에러메시지: \n"+e.getMessage());
			}
			
		}
	}
	public static void writeData()
	{
		Scanner sc=new Scanner(System.in);
		System.out.println("숫자 2개 입력");
		int su1,su2;
		try {
		su1=Integer.parseInt(sc.nextLine());
		su2=Integer.parseInt(sc.nextLine());
		System.out.printf("%d+%d=%d\n",su1,su2,su1+su2);
		}catch (NumberFormatException e) {
			// TODO: handle exception
			System.out.println("문자가 입력된 것 같습니다.: "+e.getMessage());
		}
	}
}
public class Ex1Exception {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ExcepTest1.writeArray();
		ExcepTest1.writeData();
		System.out.println("**정상종료**");
	}

}
