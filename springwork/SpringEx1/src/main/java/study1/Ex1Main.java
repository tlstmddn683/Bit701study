package study1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex1Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//자바 방식으로 호출
		MessageInter m1=new Message1();
		m1.sayHello("사탕","학생");
		MessageInter m2=new Message2();
		m2.sayHello("계란","개발자");
		
		//스프링 방식으로 호출
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext.xml");
		MessageInter m3=(Message1)context.getBean("mes1");//방법1
		MessageInter m33=(Message1)context.getBean("mes1");//방법1
		MessageInter m4=context.getBean("mes2",Message2.class);//방법2
		m3.sayHello("고길동","검성");
		m33.sayHello("고길동2","검성2");
		
		//scope="singletone" --> 두 주소가 같음을 알수 있다(기본값이 singletone)
		//scope="prototype" --> 두 주소가 서로 다름
		
		System.out.println("주소 비교:"+m3.hashCode()+":"+m33.hashCode());
		m4.sayHello("고길동","검성");
		
		
		
	}

}
