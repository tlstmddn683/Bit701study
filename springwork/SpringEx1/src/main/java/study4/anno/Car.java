package study4.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Car {
	//Tire tire;
	//���� Ÿ���� ã�Ƽ� �ڵ����� �������ش�
	@Autowired
	CanadaTire tire;
	@Autowired
	KoreaTire tire2;
	
	public void myCarTire()
	{
		System.out.println("�� ���� Ÿ�̾�� "+tire.getTireName()+"�Դϴ�.");	
		System.out.println("�� ���� Ÿ�̾�� "+tire2.getTireName()+"�Դϴ�.");	
	}
}
