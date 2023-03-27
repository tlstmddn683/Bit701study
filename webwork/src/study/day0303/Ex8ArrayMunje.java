package study.day0303;

import java.util.Scanner;

public class Ex8ArrayMunje {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		String[]members= {"이효리","강호동","손미나","손흥민","이진","박재범","이효순","엄준식","박효신","박재순","손예진","이수근","김순자","김말자","이진상","박진상","손진상","마이클","재니퍼","재니스"};
//		System.out.println(members.length);	 
		//검색할 이름을 입력후
		//몇번째에 있는지 출력하기
		//없을 경우 없다는 메시지 출력
		
		String name;
		boolean n=false;
		System.out.println("검색할 이름 입력: ");
		name=sc.nextLine();
		
		for(int i=0;i<members.length;i++) {
			if(name.compareTo(members[i])==0)//0이면 같다는뜻 
				{
				System.out.println(name+"은"+(i+1)+"번째에 있습니다.");
				n=true;
				break;
			}
		}
		if(!n) {
			System.out.println(name+"은 목록에 없습니다.");
		}
	}

}
