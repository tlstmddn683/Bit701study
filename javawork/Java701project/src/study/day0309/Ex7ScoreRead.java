package study.day0309;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Ex7ScoreRead {
	static final String FILENAME = "d:/Bit701Naver/score.txt";

	public static void scoreRead() {
		/*
		 * 총10개의 점수 읽음 90 80 70....
		 * (한줄에 5개씩 출력) 
		 * 총점: xxxx 평균: xxx.x
		 */
		FileReader fr = null;
		BufferedReader br = null;
		int count = 0;
		int sum = 0;
		double avg = 0;

		try {
			fr = new FileReader(FILENAME);
			br = new BufferedReader(fr);
			
			int idx = 1;
			while (true)
			{
				String scores = br.readLine();//한줄씩 읽기
				if (scores == null || scores.length() == 0)
					break;//null값이나 값이 없을경우 빠져나옴
				try {
				sum += Integer.parseInt(scores);//합계
				//예외 발생시  try 안의 나머지 코드 실행안함
				
				System.out.printf("%5s", scores);
				
				if (idx++ % 4 == 0)//4행
					System.out.println();
				count++;
				}catch(NumberFormatException e) {
//					System.out.println("문자포함된 숫자가 발견됨");
				}
			}

			avg =  (double) sum / count;
			System.out.println();
			System.out.println("총갯수:" + count + "개");
			System.out.println("합계:" + sum);
			System.out.printf("평균: %5.1f\n ", avg);

		} catch (FileNotFoundException e) {
			// TODO: handle exception
			System.out.println("파일이 존재하지않음" + e.getMessage());
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {
			try {
				if (br != null)
					br.close();
				if (fr != null)
					fr.close();
			} catch (IOException e) {
				// TODO: handle exception
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		scoreRead();
	}

}
