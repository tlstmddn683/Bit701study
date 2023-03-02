package study.day0228;

public class Ex14Final {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int score=90;
		final String MESSAGE="Happy Day";
		
		//변수는 값변경 가능
		score=100;
		//final 상수는 값변경이 안됨
//		MESSAGE="NICE";//final 상수  수정시 오류 발생
		System.out.println(score+","+MESSAGE);
		
	}

}
