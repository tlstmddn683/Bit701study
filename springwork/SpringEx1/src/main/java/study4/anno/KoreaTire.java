package study4.anno;

import org.springframework.stereotype.Component;

@Component
public class KoreaTire implements Tire {

	@Override
	public String getTireName() {
		// TODO Auto-generated method stub
		return "�ѱ���ȣŸ�̾�";
	}

}
