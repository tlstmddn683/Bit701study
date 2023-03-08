package study.day0303;

import java.util.Scanner;

public class Ex14ArrayInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		int[]score;
		int[]rank;
		int count;
		int total=0;
		double avg;
		
		/*
		 * 
		 * 입력할 점수의 갯수를 입력받아 그 갯수만큼 배열을 할당받은후
		 * 점수를 입력받아 합계와 평균을 구해보자.
		 * 
		 */
		
		//count 입력
		System.out.println("배열 할당할 크기는?");
		count=sc.nextInt();
		
		//count 갯수만큼 score,rank 할당
		score=new int[count];
		rank=new int[count];
		
		
		
		//배열갯수만큼 점수입력, 총점 ,평균 구하기
		for(int i=0;i<score.length;i++) {
			System.out.println((i+1)+":");
			score[i]=sc.nextInt();
			total+=score[i];
		}
		avg=(double)total/count;
		//등수 구하기-다중for문
		for(int i=0;i<score.length;i++) {
			rank[i]=1;
			for(int j=0;j<score.length;j++) {
				if(score[i]<score[j]) {
					rank[i]++;
				}
			}
		}
		// 출력
		System.out.println("점수\t등수");
		System.out.println("=".repeat(30));
		for(int i=0;i<score.length;i++) {
			System.out.println(score[i]+"\t"+rank[i]);
			
		}
		System.out.println("=".repeat(30));
		System.out.println("총 점: " +total);
		System.out.printf("평 균:%5.1f ",avg);
	}

}
