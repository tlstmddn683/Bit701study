package study4.anno;

import org.springframework.stereotype.Component;

//@Component : xml ���� �ڵ����� bean ��� (id�� �ڵ����� canadaTire)
//@Component("cTire") : id�� cTire �� �ȴ�(ù���ڴ� �ҹ���)
@Component
public class CanadaTire implements Tire {

	@Override
	public String getTireName() {
		// TODO Auto-generated method stub
		return "ĳ����Ÿ�̾�";
	}

}
