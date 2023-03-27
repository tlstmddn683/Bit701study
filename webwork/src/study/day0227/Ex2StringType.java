package study.day0227;

public class Ex2StringType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//2글자 이상 저장시 문자열 처리
		String s1=new String("Hello");//방법1
		String s2="Apple Manggo";//방법2
		String s4="  Happy  ";
		System.out.println(s1);
		System.out.println(s2);
		
		
		String s3=s1+100;
		System.out.println(s3);//String+int=String:문자열에서는 + 는 나열
		System.out.println("34+89="+34+89);//34+89=3489
		System.out.println("34+89="+(34+89));//34+89=123, ()를 이용해서 우선순위를 바꿔줌
		
		//String 클래스가 가진 메소드들
		System.out.println("s1의 length="+s1.length());//s1의 길이를 구하는 length()매소드
		System.out.println("s2의 length="+s2.length());//s2의 길이를 구하는 length()매소드
		
		System.out.println("s4의 length="+s4.length());//9
		System.out.println("s4의 length="+s4.trim().length());//5  trim():s4의 값에서 앞뒤 공백을 제거한 문자의 길이만 출력
		
		//charAt(인덱스):문자열에서 인덱스 번지에 해당하는 문자 (1글자)반환
		//indexOf(문자): 해당 문자가 어디에 있는지 index값을 반환한다
		
		String msg="Have a Good Day";
		System.out.println(msg.charAt(7));//G
		System.out.println(msg.charAt(12));//D
		System.out.println(msg.indexOf('G'));
		System.out.println(msg.indexOf('D'));//인덱스값 반환
		System.out.println(msg.indexOf('a'));//처음만난 a의 인덱스반환
		System.out.println(msg.lastIndexOf('a'));//마지막 a의 인덱스 반환
		
		//변수.startsWith("문자열"): 변수가 "문자열" 로 시작하면 true 반환
		//변수.endsWith("문자열"): 변수가 "문자열" 로 끝나면 true 반환
		System.out.println(msg.startsWith("Have"));//true
		System.out.println(msg.startsWith("have"));//false
		
		System.out.println(msg.endsWith("Hello"));//false
		System.out.println(msg.endsWith("Day"));//true

		//substring(5):5번 인덱스부터 끝까지 반환
		//substring(1,10): 1~(10-1)의 인덱스에 해당하는 문자열 반환
		System.out.println(msg.substring(7));//Good Day 7번인덱스 부터 끝까지 반환!
		System.out.println(msg.substring(7,10));//Goo 7번부터 9번 인덱스 까지 반환 
		System.out.println(msg.toLowerCase());//전부 소문자 변환
		System.out.println(msg.toUpperCase());//전부 대문자 변환
		
		//replace : 일부 문자 또는 단어 변경후 반환
		System.out.println(msg.replace('a','*'));// H*ve * Good D*y  모든 A가 별표로 바껴서 출력
		System.out.println(msg.replace("Good","Happy"));//Have a Happy Day
		//문자열 비교
		//equals,compareTo
		String m1="Apple";
		String m2="apple";
		String m3="Orange";
		
		// ==기본형에서는 값으로 비교, 클래스 타입에서는 주소 비교를 의미함
		System.out.println(m1==m2);// 주소 비교
		//문자열 같은 경우는 정확한 값으로 비교하기위해 두 매소드를 사용한다
		System.out.println(m1.equals(m2));//false m1이 m2와 같은지 비교(대소문자가 다를경우false)
		System.out.println(m1.equals("Apple"));//true
		System.out.println(m1.equalsIgnoreCase(m2));//true 대소문자 무시하고 철자만 비교
		//compareTo: 두문자열의 아스키코드 값의 차이를 반환한다
		System.out.println(m1.compareTo(m3));// A(65) ,O(79):65-79= -14 :(음수값은 뒤의 값이 더 크다는 뜻)
		System.out.println(m1.compareTo("Apple")); //0 두변수의 값이 완전히 같을땐 0이 출력된다
		System.out.println("computer".compareTo("command"));//'p','m'을 비교 p(112),m(109): 3:(양수값은 앞의값이 더 크다는 뜻)
		//split(','): ,로 분리하여 배열타입으로 반환
		String colors="red,blue,green,orange,pink,black";
		String []mycolor=colors.split(",");
		System.out.println("총 "+mycolor.length+"개 분리함");
		// for문으로 출력(배열 갯수만큼 자동 반복한다)
		//for 문 출력
		for(String ch:mycolor) {
			System.out.println(ch);//분리한 색상표 출력
		}
		
		
	}

}
