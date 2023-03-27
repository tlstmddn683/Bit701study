package study.day0307;
class Animal
{
	private String animalName;
	
	Animal(String animalName)
	{
		this.animalName=animalName;
	}
	
	public void writeData()
	{
		System.out.println("animalName= "+animalName);
	}
}
class Dog extends Animal
{
	private String animalColor;
	
	Dog(String animalName,String animalColor)
	{
		super(animalName);//무조건 첫줄
		this.animalColor=animalColor;
	}
	/*
	 * 부모가 가진 메소드와 동일한 메소드명과 인자를 가진 메소드를 구현 
	 * 미완성의 메소드를 완성할 목적으로 오버라이드 한다.
	 * @override : @를 어노테이션이라고 하며 오버라이드 규칙에 어긋나지 않도록한다.
	 * (어긋날 경우 오류 발생)
	 */
	@Override
	public void writeData() {
		// TODO Auto-generated method stub
		super.writeData();//부모가 먼저 처리할 경우 첫줄, 어디에 넣든 상관없다.
		System.out.println("animalColor= "+animalColor);
	}
}
public class Ex14Inheri {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Dog d1=new Dog("리트리버","갈색");
		d1.writeData();
		//super 클래스로 선언한 경우 오버라이드 메소드와 부모가 가진 메소드만 호출가능
		//sub의 메소드는 호출 불가능!!
//		Dog d2=new Dog("스피츠","흰색");
		Animal d2=new Dog("스피츠","흰색");
		d2.writeData();
		
		Dog d3=new Dog("말티즈","흰색");
		d3.writeData();
		
		Dog d4=new Dog("시골잡종","알수없음");
		d4.writeData();
	}

}
