package study.day0309;

import java.io.File;

public class Ex10File {
	static final String FILENAME1 = "d:/Bit701Naver/memo.txt";
	static final String FILENAME2 = "d:/Bit701Naver/score.txt";
	static final String DIR = "d:/Bit701Naver";
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//File 객체 공부하기
		File file1=new File(FILENAME1);
		File file2=new File(FILENAME2);
		File file3=new File(DIR);
		
		System.out.println("file1의 크기:"+file1.length()+"바이트");
		System.out.println("file2의 크기:"+file2.length()+"바이트");
		
		System.out.println("file1은 파일인가요?"+file1.isFile());
		System.out.println("file1은 디렉토리인가요?"+file1.isDirectory());
		
		System.out.println("file2은 파일인가요?"+file2.isFile());
		System.out.println("file2은 디렉토리인가요?"+file2.isDirectory());
		
		System.out.println("file3은 파일인가요?"+file3.isFile());
		System.out.println("file3은 디렉토리인가요?"+file3.isDirectory());
		
		if(file3.isDirectory())
		{
			String []list=file3.list();
			for(String a:list) {
				System.out.println(a);
			}
		System.out.println(file1.getAbsolutePath());//경로포함 파일명을 얻을수 있음
		System.out.println(file1.getName());//파일명만 얻을수있음
		System.out.println(file1.exists());//file1이 실제로 존재하는지의 여부를 알수있음
		//파일 삭제
		file1.delete();//memo.txt삭제
		
		
		
		
		
		}
		
		
	}

}
