package study.day0228;

public class Ex17Math {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Math클래스는 수학 매소드들을 가지고있는 수학 클래스이다.
		//상수는 Math.PI=3.141592..파이값
		//Math 클래스의 모든 매소드는 static 매소드이다
		//static매소드는 클래스 생성없이 클래스 명으로 호출한다.(예를들어 Math.random())
		System.out.println(Math.PI);
		System.out.println("3과 5중 더 큰값은"+Math.max(3, 5));
		System.out.println("3과 5중 더 작은값은"+Math.min(3, 5));
		System.out.println("3의4승은"+Math.pow(3, 4));
		System.out.println("[0~1사이의 난수 구하기:"+Math.random());
		
		double su=3.4;
		System.out.println("무조건 올림 출력:"+Math.ceil(su));//3.1이나 3.9나 무조건4.0
		System.out.println("무조건 내림 출력"+Math.floor(su));//3.1이나 3.9나 무조건3.0
		System.out.println("반올림 출력:"+Math.round(su));//반올림
		
		//반지름r=20cm 피자 2개, 반지름r=30cm 피자 1개? 어떤게 면적이 더큰가?
		System.out.println("반지름이 20센치인 피자 2개의 전체면적");
		System.out.println(20*20*Math.PI*2);//2513.2~
		System.out.println(30*30*Math.PI);//2827.4~
		
		
		
	}
}
