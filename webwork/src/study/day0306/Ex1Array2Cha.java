package study.day0306;

import java.util.Scanner;

public class Ex1Array2Cha {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		//이름을 저장할 배열
		String []names=new String[3];
		//3과목의 점수와 총점을 구할 2차원 배열 선언
		int[][]scores=new int[3][5];//3행 5열(3과목 점수, 총점, 등수)
		
		//입력
		for(int i=0;i<names.length;i++) {
			System.out.println(i+"번의 이름은?");
			names[i]=sc.nextLine();
			
			System.out.println("3과목의 점수를 입력해주세요");
			for(int j=0;j<3;j++) {
				scores[i][j]=sc.nextInt();
			}
			//마지막 점수 입력후 버퍼에 저장된 엔터를 따로 읽어서 처리한다
			sc.nextLine();
		}
		//총점
		for(int i=0;i<scores.length;i++) {
			for(int j=0;j<3;j++) {
				scores[i][3]+=scores[i][j];
			}
		}
		//등수
		for(int i=0;i<scores.length;i++) {
			//등수열을 1로 초기값 지정
			scores[i][4]=1;
			for(int j=0;j<scores.length;j++) {
				//상태방(j)의 총점이 기준(i)보다 더 높을경우
				//i번지의 등수를 1 증가시킵니다.
				if(scores[i][3]<scores[j][3])
				{
					scores[i][4]++;
				}
			}
		}
		//출력
		System.out.println("이름\t국어\t영어\t수학\t총점\t등수");
		System.out.println("=".repeat(35));
		for(int i=0;i<names.length;i++) {
			System.out.printf("%-10s",names[i]);
			for(int j=0;j<scores[i].length;j++) {
				System.out.printf("%5d",scores[i][j]);
				
			}
			System.out.println();
		}
	}

}
