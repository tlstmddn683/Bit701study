package study.day0307;

/*
 * 
 * method overloading:  중복함수
 * 
 * 같은 클래스 내의 매소드중 매소드명은 같고 인자가 다른경우 오버로딩 매소드라고함
 * 리턴 타입은 달라도 된다
 * 
 */
class Apple{
	public static int getLength(int n)
	{
		//스트링타입으로 변환
		String s=String.valueOf(n);
		
		//길이를 반환
		return s.length();
	}
	public static int getLength(double n)
	{
		//스트링타입으로 변환
		String s=String.valueOf(n);
		
		//길이를 반환
		return s.length();
	}
	public static int getLength(float n)
	{
		//스트링타입으로 변환
		String s=String.valueOf(n);
		
		//길이를 반환
		return s.length();
	}
	public static int getLength(String n)
	{
	
		return n.length();
	}
}
public class Ex2Overloading {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int n1=123000;
		float n2=2.345f;
		double n3=34.5678;
		String n4="Yes Or No";
		
		System.out.println("각 데이터의 길이 구하기");
		System.out.println(n1+"의 길이는"+Apple.getLength(n1));
		System.out.println(n2+"의 길이는"+Apple.getLength(n2));
		System.out.println(n3+"의 길이는"+Apple.getLength(n3));
		System.out.println(n4+"의 길이는"+Apple.getLength(n4));
	}

}
