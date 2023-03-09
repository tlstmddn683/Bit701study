package study.day0309;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Ex5FileReaderException {

	static final String FILENAME = "d:\\Bit701Naver\\member12.txt";

	public static void memberRead() {
		FileReader fr = null;
		BufferedReader br = null;

		try {
			fr = new FileReader(FILENAME);
			System.out.println("파일이 존재함");

			// 한줄 단위로 파일에서 읽기 위해서 BufferedReader로 변환
			br = new BufferedReader(fr);
			while (true) {
				String name = br.readLine();
				if (name == null || name.length() == 0)
					break;
				String addr = br.readLine();
				String hp = br.readLine();
				System.out.println("이름:" + name + ",주소:" + addr + ",전화번호:" + hp);

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("파일이 없습니다" + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			// 파일이 없을 경우 br이 생성되기 전에 catch로 가면서
//				br이 널포인터 익셉션이 발생
			// 방법1
//			try {
//				System.out.println("자원들 모두 닫힘");
//				br.close();
//				fr.close();
//			} catch (IOException|NullPointerException e) {
//				// TODO Auto-generated catch block
////				e.printStackTrace();
//			}
			// 방법2
			System.out.println("자원들 모두 닫힘");
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
		memberRead();
		System.out.println("**정상 종료**");
	}

}
