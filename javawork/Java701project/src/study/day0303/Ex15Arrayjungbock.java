package study.day0303;

import java.util.Random;

public class Ex15Arrayjungbock {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			/*
			 * 
			 * 
			 * 10개의 데이터를 저장할 배열을 생성후 1~30사이의 
			 * 중복없는 숫자를 배열에 넣어보자
			 * 
			 *  
			 */
		Random r=new Random();
		int []data=new int[10];
		Loop:
		for(int i=0;i<data.length;i++) {
			data[i]=r.nextInt(30)+1;
			//중복 숫자가 i이전 번지에 있을경우 다시구하기
			for(int j=0;j<i;j++) {
				if(data[i]==data[j]) {
					i--;//i++로 이동하기때문에 1을 뺀후 이동한다
					//제자리로 가기위해서
//					break;
					continue Loop;//바로 i++로 이동
				}
			}
		}
		//출력
		for(int a:data) {
			System.out.printf("%4d",a);
		}
	}

}
