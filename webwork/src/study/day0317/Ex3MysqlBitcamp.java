package study.day0317;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Scanner;

public class Ex3MysqlBitcamp {
	final static String MYSQL_DRIVER = "com.mysql.cj.jdbc.Driver";
	final static String MYSQL_URL = "jdbc:mysql://localhost:3306/bit701?serverTimezone=Asia/Seoul";

	public Ex3MysqlBitcamp(){
		try {
			Class.forName(MYSQL_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Mysql 드라이버 실패: " + e.getMessage());
			
		}
	}
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(MYSQL_URL, "angel", "1234");
//			System.out.println("로컬 Mysql 연결 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("로컬 Mysql 연결 실패: " + e.getMessage());
		}
		return conn;
	}
	public void writeBitcamp() {
		Connection conn = this.getConnection();
		String sql ="select * from bitcamp";
		Statement stmt = null;
		ResultSet rs = null;
		Scanner sc=new Scanner(System.in);
		int count, menu;
		System.out.println("**메뉴**");
		System.out.println("1.전체출력");
		System.out.println("2.이름검색");
		System.out.println("3.평균검색");
		System.out.println("4.종료");
		System.out.println("=".repeat(30));
		menu=Integer.parseInt(sc.nextLine());
		count=0;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			
			while(rs.next())
			{
				
				int num=rs.getInt("num");
				String name=rs.getString("name");
				int java=rs.getInt("java");
				int spring=rs.getInt("spring");
				Timestamp today = rs.getTimestamp("today");
				
				switch(menu) {
				case 1:
					 
					System.out.println("시퀀스번호: " + num);
					System.out.println("이름: "+name);
					System.out.println("자바점수: "+java);
					System.out.println("스프링점수: "+ spring);
					System.out.println("글쓴날짜: "+today);
					System.out.println("=".repeat(40));
					
					break;
					
				case 2:
					while (true) {
					System.out.println("검색할 이름을 입력해주세요.");
					name=sc.nextLine();
					
					
					
				break;
			}
			
			
				}
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
	}	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex3MysqlBitcamp ex3=new Ex3MysqlBitcamp();
		ex3.writeBitcamp();
		
	}

}
