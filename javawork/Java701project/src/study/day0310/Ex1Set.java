package study.day0310;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class Ex1Set {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//set 인터페이스를 구현한 클래스가 HashSet:비순차적,중복허용안함
										 //TreeSet:정렬되서 나온다,중복허용안함
		//제네릭스: <String>:String 타입만 넣을수 있다는 뜻
		Set<String> set1=new HashSet<>();
		Set<Integer> set2=new TreeSet<>();
		
		set1.add("apple");
		set1.add("orange");
		set1.add("apple");
		set1.add("banana");
		//set1.add(3);//오류 발생-> generics 때문에 발생함
		System.out.println("set1="+set1.size()+"개");//3개 .. apple은 1개만 출력됨
		
		 System.out.println("**출력1**");
		 for(String s:set1) 
			 System.out.println(s);//비순차적으로 출력됨
		 System.out.println("**출력2-iterator**");
		 
		 Iterator<String> iter=set1.iterator();
		 while(iter.hasNext())//has.next():다음데이터가 있을경우true : true인동안 반복하면됨
		 {
			 String s=iter.next();//다음데이터를 얻어서 출력
			 System.out.println(s);
		 }
		 //set2 : 배열에 int를 넣은후 set2에 넣기
		 int []arr= {4,1,8,3,5,4,3};
		 for(int a:arr) 
			 set2.add(a);
			 
			 System.out.println("set2="+set2.size()+"개");
			 
		for(int a:set2)
			System.out.printf("%5d",a);
		 
		
	}

}
