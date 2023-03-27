package study.day0303;

public class Ex13ArraySortString {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] names = { "홍길동", "강호동", "James", "이순신", "고길동" };
		
		// 오름 차순 정렬해서 출력하기(문자열 compareTo 이용)
		for(int i=0;i<names.length-1;i++) {
			
			for(int j=i+1;j<names.length;j++) {
				if(names[i].compareTo(names[j])>0) {
		//i번지값이 j번지값보다 더 클경우 양수 값이 나온다
					String temp=names[i];
					names[i]=names[j];
					names[j]=temp;
				}
			}
		}
		// 출력
		for(String s:names) {
			System.out.println(s);
		}
	}

}
