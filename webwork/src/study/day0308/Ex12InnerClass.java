package study.day0308;

//Anonymous 내부 클래스
interface InterTest {
	public void insert();

	public void delete();
}

abstract class AbstTest {
	abstract public void process();

}

public class Ex12InnerClass {

	// 익명 내부 클래스 형태로 구현한 경우
	InterTest it = new InterTest() {

		@Override
		public void insert() {
			// TODO Auto-generated method stub
			System.out.println("데이터 추가");
		}

		@Override
		public void delete() {
			// TODO Auto-generated method stub
			System.out.println("데이터 삭제");
		}
	};
	// 익명 내부 클래스 2
	AbstTest ab = new AbstTest() {

		@Override
		public void process() {
			// TODO Auto-generated method stub
			System.out.println("데이터 호출");
		}
	};

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex12InnerClass ex = new Ex12InnerClass();
		ex.it.insert();
		ex.it.delete();
		ex.ab.process();
	}

}
