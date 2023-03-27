package study.day0308;

//abstract(추상)클래스:일반 메소드와 추상 메소들 두가지 구현이 모두 가능
//추상 클래스를 상속받는 클래스 는 반드시 추상 메소드를 오버라이드 해야 하지만
//만약 오버라이드를 안할 경우는 상속받는 클래스도 추상클래스로 만들면 된다.
abstract class Apple
{
	abstract public void process(); 
	//나중에 override를 목적으로 만든 메서드
	//추상메소드(미완성 메소드)
		public void show()
		{
			System.out.println("show");
		}
	
}
// 추상클래스를 상속받는 일반클래스
class Orange extends Apple
{
	@Override
	public void process() {
		// TODO Auto-generated method stub
		System.out.println("process override");
	}
}
public class Ex4Abstract {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Apple a=new Orange();
		a.process();
		
//		Apple a2= new Apple();//추상클래스는 new로 생성 불가
		
	}

}
