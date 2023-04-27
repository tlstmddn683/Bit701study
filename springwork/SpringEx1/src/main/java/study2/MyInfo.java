package study2;

public class MyInfo {
	private String name;
	private int age;
	private String hobby;
	private String address;
	
	public MyInfo(String name, int age, String hobby, String address) {
		super();
		this.name = name;
		this.age = age;
		this.hobby = hobby;
		this.address = address;
		
	}

	@Override
	public String toString() {
		return "MyInfo [name=" + name + ", age=" + age + ", hobby=" + hobby + ", address=" + address + "]";
	}
		

	
}
