package study.day0302;

public class Ex6Loop {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1. 1~20까지의 숫자중 3의 배수만 출력(printf("%4d ",변수))
		
		//2. 10~1까지 거꾸로 출력
		
		//3. 1~30까지 숫자중 5의 배수만 출력
		
		//4. * 20개 출력
		
		int count=1;
		for(int a=1;a<=20;a++) {
		if(a%3==0) {
			System.out.println(count+"번째의 3의배수는"+a);
			count+=1;
			}
		 }
	System.out.println();
	for(int a=10; a>=1; a--) 
		System.out.printf("%4d",a);
	System.out.println();
	
	for(int a=1; a<=30;a++) {
		if(a%5==0)
			System.out.printf("%4d",a);
		
	}System.out.println();
	for(int a=1;a<=20;a++) 
		System.out.print("*");
		System.out.println();
		
		for(int a=1; a<=20;a+=2)
			System.out.printf("%4d",a);
	
	}	
}