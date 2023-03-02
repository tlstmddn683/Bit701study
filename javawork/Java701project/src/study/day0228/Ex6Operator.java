package study.day0228;

public class Ex6Operator {
	

	public static void main(String[] args) {
		//산술연산자 : + - * / %
		int su1=7;
		int su2=4;
		System.out.printf("%d+%d=%d\n",su1,su2,su1+su2);
		System.out.printf("%d-%d=%d\n",su1,su2,su1-su2);
		System.out.printf("%d*%d=%d\n",su1,su2,su1*su2);
		System.out.printf("%d/%d=%d\n",su1,su2,su1/su2);//자바에서 7/4는 1이다 정수끼리의 계산은 무조건 정수
		System.out.printf("%d/%d=%3.1f\n",su1,su2,(double)su1/su2);
		System.out.printf("%d%%%d=%d\n",su1,su2,su1%su2);//printf 에서 % 자체 출력시 %%로 적어야됨
		
	
	}
}