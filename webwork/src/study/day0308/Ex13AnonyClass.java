package study.day0308;

interface InterB
{
	public void paint();
	public void save();
}
abstract class AbstOne
{
	public void show()
	{
		System.out.println("AnstOne-show");
		
	}
	abstract public void study();
	
}
class MyAnony
{
	//InterB 구현
	InterB b= new InterB() {
		
		@Override
		public void save() {
			// TODO Auto-generated method stub
			System.out.println("save");
		}
		
		@Override
		public void paint() {
			// TODO Auto-generated method stub
			System.out.println("paint");
		}
	};
	
	//AbstOne
	AbstOne ao=new AbstOne() {
		
		@Override
		public void study() {
			// TODO Auto-generated method stub
			System.out.println("study");
		}
		@Override
		public void show() {
			super.show();
			System.out.println("익명 내부클래스에서 나머지 show 처리");
		}
		
	};
	
	
	
}

public class Ex13AnonyClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			MyAnony my=new MyAnony();
			my.b.save();
			my.b.paint();
			my.ao.study();
			my.ao.show();
	}

}
