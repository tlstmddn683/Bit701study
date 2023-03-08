package study.day0303;

import java.util.Scanner;

public class Ex9ArrayMunje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		String[]members= {"이효리","강호동","손미나","손흥민"
				,"이진","박재범","이효순","엄준식","박효신",
				"박재순","손예진","이수근","김순자","김말자",
				"이진상","박진상","손진상","마이클","재니퍼",
				"재니스"};
		
		/**
		 * 
		 * 이름의 앞글자를 입력하면 그단어로 시작하는
		 * 이름들을 출력하고 그인원수를 출력
		 * 예를들어 
		 * 검색할 이름은?: 손
		 * 3.손미나,4.손흥민,17.손진상
		 * 총 3명
		 */
		String name;
		int count=0;
		
		System.out.println("검색할 이름 입력");
		name=sc.nextLine();
		
		for(int i=0;i<members.length;i++) {
			if(members[i].startsWith(name)) {
				count++;
				System.out.print((i+1)+"."+members[i]);
				
			}
		}
		if(count==0)
			System.out.println("\'"+name+"\'로 시작하는 회원님은 없습니다!");
		else 
		System.out.println("\n총"+count+"명");
		
		
	}

}
