package study.day0308;

public class Student extends School {
	private String stuName;
	private String stuAdd;
	private int score;
	public Student() {
		super();
	}
	public Student(String schoolName, String schoolLoc, String stuName, String stuAdd, int score) {
		super(schoolName, schoolLoc);
		this.stuName = stuName;
		this.stuAdd = stuAdd;
		this.score = score;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuAdd() {
		return stuAdd;
	}
	public void setStuAdd(String stuAdd) {
		this.stuAdd = stuAdd;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Student [stuName=" + stuName + ", stuAdd=" + stuAdd + ", \nscore=" + score + ", \ntoString()="
				+ super.toString() + "]";
	}
	
	
}
