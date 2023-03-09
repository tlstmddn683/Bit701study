package study.day0308;

class Person {
	String name;

	public Person() {

	}

	public Person(String theName) {
		this.name = theName;
	}
}

class Employ extends Person {
	String id;

	public Employ() {

	}

	public Employ(String name) {
		super(name);
	}

	public Employ(String name, String id) {
		super(name);
		this.id = id;
	}

	@Override
	public String toString() {
		return "Employ [id=" + id + "\tname="+name+"]";
	}

}

public class Munje3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Employ e = new Employ("Shin", "201884035");
		System.out.println(e);
	}

}
