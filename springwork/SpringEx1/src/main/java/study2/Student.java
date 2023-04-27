package study2;

public class Student {
	String schoolName;
	String grade;
	
	MyInfo myInfo;
	public Student(MyInfo myInfo) {
		// TODO Auto-generated constructor stub
		this.myInfo=myInfo;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public void setGrade(String grade)
	{
		this.grade = grade;
	}
	public void show() {
		// TODO Auto-generated method stub
		System.out.println(myInfo);
		System.out.println("학교명: "+schoolName);
		System.out.println(grade+"학년");
	}
}
