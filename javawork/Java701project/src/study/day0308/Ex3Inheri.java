package study.day0308;

import java.util.List;
import java.util.Vector;

abstract class Super1
{
	abstract public void process();//추상화 ; <--필수
	{
		System.out.println("나는 아무 일을 안한다");
	}
	public void superProcess()
	{
		System.out.println("super만 가지고 있는 메소드");
	}
}
	class Sub1 extends Super1
	{
		@Override
		public void process() {
			System.out.println("데이터를 파일에 저장합니다");
			
		}
		public void sub1Process()
		{
			System.out.println("sub1 만이 할수 있는 일입니다!!");
		}
	}
public class Ex3Inheri {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//super로 선언하고 sub로 생성시 override 매소드와 super가 가진 메소드는 호출가능
		//단 sub만이 가진 매소드는 호출 불가능
		Super1 s1=new Sub1();
		s1.process();//override 메소드
		s1.superProcess();//부모가 가진 메소드
		
//		s1.sub1Process();//오류 발생
		((Sub1)s1).sub1Process();//s1을 sub1으로 다운 형변환 후 호출하는건 가능하다
		
		//collection 의 List 경우를 보자
		List<String> list=new Vector<>();
		list.add("사과");//add는 override 메소드이므로 호출이 가능하다.
		
		int n=((Vector<String>)list).capacity();
		System.out.println("할당크기:"+n);
	}

}
