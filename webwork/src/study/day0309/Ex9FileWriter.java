package study.day0309;

import java.io.FileWriter;
import java.io.IOException;

public class Ex9FileWriter {
	static final String FILENAME = "d:/Bit701Naver/memo.txt";
	public static void memoWrite()
	{
		FileWriter fw=null;
		
		try {
//			fw=new FileWriter(FILENAME);//memo.txt가 없을경우 새로 만들고,
			fw=new FileWriter(FILENAME ,true);//이미있을경우 기존의 것을 덮어쓴다
			fw.write("이름:이수근\n");
			fw.write("주소:경기도 안양시\n");
			fw.write("전화번호:1577-1577\n");
			fw.write("=======================\n");
			
			System.out.println("파일 탐색기에서 memo.txt 를 확인하십시오. ");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		memoWrite();
	}

}
