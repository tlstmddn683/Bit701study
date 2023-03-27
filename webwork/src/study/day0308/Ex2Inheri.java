package study.day0308;

class Parent{
	public void play()
	{
		System.out.println("나는 부모!! 일을 시킨다");
	}
}

class Child1 extends Parent{
	@Override
	public void play() {
		super.play();
		System.out.println("첫째:나는 집안 청소를 하겠습니다.");
	}
}
class Child2 extends Parent{
	@Override
	public void play() {
		super.play();
		System.out.println("둘째: 나는 식사를 담당 하겠습니다.");
	}
}
class Child3 extends Parent{
	@Override
	public void play() {
		super.play();
		System.out.println("셋째: 나는 설거지를 담당하겠습니다.");
	}
}

public class Ex2Inheri {
	public static void process(Parent p) {
		p.play();//다형성처리
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//			Parent p=null;
//			p=new Child1();
//			p.play();
//			
//			p=new Child2();
//			p.play();
//			
//			p=new Child3();
//			p.play();
		
		
		process(new Child1());
		process(new Child2());
		process(new Child3());
	}

}
