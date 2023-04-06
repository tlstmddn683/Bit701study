package study4.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Car {
	//Tire tire;
	//같은 타입을 찾아서 자동으로 주입해준다
	@Autowired
	CanadaTire tire;
	@Autowired
	KoreaTire tire2;
	
	public void myCarTire()
	{
		System.out.println("내 차의 타이어는 "+tire.getTireName()+"입니다.");	
		System.out.println("내 차의 타이어는 "+tire2.getTireName()+"입니다.");	
	}
}
