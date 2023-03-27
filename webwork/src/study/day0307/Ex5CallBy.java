package study.day0307;

class Test
{
	String name="이지아";
	int age=23;
	
}
class CallBy
{
	//call by value: 주소가 아닌 값만 전달됨(모든 기본형, String이 여기에 해당됨)
	
	public void changeInt(int n)//메인의 n하고는 완전히 다른변수(값만 전달)
	{
		n+=10;
		System.out.println("changeInt n="+n);
		
	}
	public void changeString(String m)
	{
		//m에는 happy라는 값이 전달
		m="hello";// hello로 변경
	}
	//배열은 타입에 상관x 무조건 reference 즉 무조건 주소가 전달됨
	//이런경우를    call by reference라고함
	public void changeArray(int[]a)
	{
		a[1]=100;//2번째 값만 변경해보자
	}
	public void changeTest(Test t) {//메인의 t변수와 주소가 같은 변수
		t.name="이상아";
		t.age=35;
	}
}

public class Ex5CallBy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CallBy call=new CallBy();
		int n=100;
		call.changeInt(n);//n은 값으로 전달
		System.out.println("n은 바꼈을까요?"+n);
		
		String m="Happy";
		call.changeString(m);
		System.out.println("m은 바뀌었을까?"+m);
		
		int[]a= {3,5,9};//배열은 타입상관없이 객체
		call.changeArray(a);//배열 a의 주소가 전달, 메소드의 인자와 메인의 배열변수는 주소가 같은변수
		System.out.println("배열값은 변경되었을까?");
		for(int b:a) 
			System.out.print(b+" ");//1번배열값이 바뀜
		System.out.println();
		
		Test t=new Test();
		System.out.println(t.name+","+t.age);
		call.changeTest(t);//t의 주소가 전달됨 (call by reference)
		System.out.println(t.name+","+t.age);//변경확인
	}

}
