package study4.anno;

import org.springframework.stereotype.Component;

//@Component : xml 없이 자동으로 bean 등록 (id는 자동으로 canadaTire)
//@Component("cTire") : id가 cTire 가 된다(첫글자는 소문자)
@Component
public class CanadaTire implements Tire {

	@Override
	public String getTireName() {
		// TODO Auto-generated method stub
		return "캐나다타이어";
	}

}
