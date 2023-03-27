package study.day0307;
class Stu
{
	private String name;
	private int score;
	private int age;
	
	Stu()
	{
		this("미자",10,10);//3번째 생성자 호출
	}
	Stu(String name)
	{
		this(name,10,10);//3번째 생성자 호출
		
	}
	Stu(String name, int score, int age)
	{
		this.name=name;
		this.score=score;
		this.age=age;
	}
	//출력
	public void writeStu() 
	{
		System.out.println(name+"\t"+score+"점"+age+"세");
	}
}
public class Ex10ArrayConst {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stu []stu=new Stu[3];//배열로 할당  생성하는것은 아님!
		//각배열번지를 생성
		stu[0]=new Stu();
		stu[1]=new Stu("김**");
		stu[2]=new Stu("정준하",90,40);
		
		//출력
		for(Stu s:stu) {
			s.writeStu();
		}
		System.out.println("=".repeat(30));
		Stu[]stu2= {
				new Stu(),
				new Stu("철수"),
				new Stu("영희",89,30)
		};
		for(Stu s:stu2) {
			s.writeStu();
		}
		
	}

}
