package study.day0308;
//class가 class를 상속받을때 extends
//interface가 interface를 상속받을때도 똑같이 extends
//class가 interface 를 상속받을때는 implements
interface Kiwi
{
	public void play();
}
interface Manggo extends Kiwi
{
	public void study();
}
class Banana
{
	public void eat()
	{
		System.out.println("바나나를 먹어보자~");
	}
}
class Berry extends Banana implements Manggo
{

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("*****집가고싶다*****");
	}

	@Override
	public void study() {
		// TODO Auto-generated method stub
		System.out.println("*****침대에 눕고싶다*****");
	}
	
}

public class Ex8Interface {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Manggo m=new Berry();
		m.play();
		m.study();
		
		Banana b=new Berry();
		b.eat();
		
		Berry b2=new Berry();
		b2.play();
		b2.study();
		b2.eat();
	
	}

}
