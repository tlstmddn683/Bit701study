package study2;

public class Student {
	String schoolName;
	
	MyInfo myInfo;
	public Student(MyInfo myinfo) {
		// TODO Auto-generated constructor stub
		this.myInfo=myInfo;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	void show() {
		// TODO Auto-generated method stub
		System.out.println("myInfo");
		System.out.println("ÇÐ±³¸í: "+schoolName);
	}
}
