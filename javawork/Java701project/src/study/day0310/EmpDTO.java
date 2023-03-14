package study.day0310;

public class EmpDTO {
	
	private String name;
	private String buso;
	private String Hp;
	private int age;
	
	public EmpDTO()
	{
		
		
	}
	public EmpDTO(String name, String buso, String Hp, int age) {
		// TODO Auto-generated constructor stub
		this.name=name;
		this.buso=buso;
		this.age=age;
		this.Hp=Hp;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBuso() {
		return buso;
	}
	public void setBuso(String buso) {
		this.buso = buso;
	}
	public String getHp() {
		return Hp;
	}
	public void setHp(String hp) {
		Hp = hp;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void getName(String string) {
		// TODO Auto-generated method stub
		
	}
	public void getBuso(String string) {
		// TODO Auto-generated method stub
		
	}
	public void getAge(int parseInt) {
		// TODO Auto-generated method stub
		
	}
	public void getHp(String string) {
		// TODO Auto-generated method stub
		
	}
	
}
