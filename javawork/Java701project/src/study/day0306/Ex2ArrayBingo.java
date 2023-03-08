package study.day0306;

import java.util.Scanner;

public class Ex2ArrayBingo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		int[][]puzzle=new int[3][3];
		int bingo;
		
		while(true) {
			//3행3열에 1-3의 난수를 구해서 넣는다
			for(int i=0;i<puzzle.length;i++) {
				for(int j=0;j<puzzle[i].length;j++) {
					puzzle[i][j]=(int)(Math.random()*3)+1;
					
				}
			}
			//출력
			for(int i=0;i<puzzle.length;i++) {
				for(int j=0;j<puzzle[i].length;j++) {
					System.out.printf("%4d",puzzle[i][j]);
					
				}
				System.out.println();
			}
			//행렬 for문 사용해보기
			bingo=0;
			for(int row=0;row<puzzle.length;row++) {
				if(puzzle[row][0]==puzzle[row][1]&&puzzle[row][1]==puzzle[row][2]) {
					bingo++;
				}
			}
			for(int col=0;col<puzzle.length;col++) {
				if(puzzle[0][col]==puzzle[1][col]&&puzzle[1][col]==puzzle[2][col]) {
					bingo++;
				}
			}
			//대각선
			
			if(puzzle[0][2]==puzzle[1][1]&&puzzle[1][1]==puzzle[2][0]) 
				bingo++;
			
			if(puzzle[0][0]==puzzle[1][1]&&puzzle[1][1]==puzzle[2][2])
				bingo++;
			
			System.out.println();
			
			if(bingo==0)
				System.out.println("꽝!!");
			else
			System.out.println("빙고:" +bingo+"개");
				
			
				
			
			System.out.println("=".repeat(30));
			String ch=sc.nextLine();
			if(ch.equals("q")) {
				System.out.println("게임 종료");
				break;
			}
		}
		
		
	}

}




