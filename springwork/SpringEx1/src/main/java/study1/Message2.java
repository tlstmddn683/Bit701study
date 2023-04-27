package study1;

public class Message2 implements MessageInter {

	@Override
	public void sayHello(String name,String job) {
		// TODO Auto-generated method stub
		System.out.println("당신의 이름은 "+name+"입니까?");
		System.out.println("당신의 직업은 "+job+"입니까?");
	}

}
