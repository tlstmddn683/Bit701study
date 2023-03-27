package study.day0310;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

public class Ex6ListVector {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Vector<String> list1=new Vector<>();//10개 할당,일반적으로 사용
		//Vector<String> list1=new Vector<>(5);//5개 할당,초과될 경우 두배로 늘어난다
		Vector<String> list1=new Vector<>(5,3);//초기에 5개 할당 후 , 초과될 경우 3개씩 증가
		
		System.out.println("size는 실제 데이터가 들어있는 갯수:"+list1.size());//0
		System.out.println("capacity 할당 갯수:"+list1.capacity());//10  - vector만이 가지고있는 메소드
		
		list1.add("장미");
		list1.add("무궁화");
		list1.add("국화");
		list1.add("개나리");
		
		System.out.println(list1.size());
		
		List<String>list2=new Vector<>();
		//나열된 문자열이  List 타입으로 변환 해서 리턴
		list2=Arrays.asList("빨강","파랑","노랑","검정","초록");
		System.out.println(list2.size());
		
		System.out.println("***list1 출력***");
		int n=1;
		for(String s:list1)
		{
			System.out.println(n++ +":"+s);
		}
		System.out.println("***list2 출력***");
		for(int i=0;i<list2.size();i++)
		{
			String s=list2.get(i);//i번지의 데이터를 꺼낸다
			System.out.println(i+1+":"+s);
			
		}
		System.out.println("***list2 출력2***");
		n=1;
		Iterator<String>iter= list2.iterator();
		while(iter.hasNext())
		{
			String s=iter.next();
			System.out.println(n++ +":"+s);
		}
	}

}
