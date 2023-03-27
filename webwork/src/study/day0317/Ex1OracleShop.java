package study.day0317;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Scanner;

public class Ex1OracleShop {
	static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
	static final String ORACLE_URL = "jdbc:oracle:thin:@localhost:1521:xe";

//	static final String ORACLE_URL="jdbc:oracle:thin:@192.168.0.24:1521:xe";//강사pc
	Ex1OracleShop() {
		try {
			Class.forName(ORACLE_DRIVER);
//			System.out.println("오라클 드라이버 성공!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클 드라이버 실패" + e.getMessage());
		}
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(ORACLE_URL, "angel", "a1234");
//			System.out.println("로컬 오라클 연결 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("로컬 오라클 연결 실패: " + e.getMessage());
		}
		return conn;
	}

	public void writeShop() {
		Connection conn = this.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from shop order by num";

		try {
			stmt = conn.createStatement();
			// 데이터를 가져오는 select문은 무조건 executeQuery() 로 sql문을 실행한다.
			rs = stmt.executeQuery(sql);
			// rs.next() 는 다음 레코드로 이동, 다음데이터가 있으면 true 반환, 없으면 false
			while (rs.next()) {
				int num = rs.getInt(1);// 컬럼번호로 가져와도 되고 컬럼명도 가능하다
				String sangpum = rs.getString(2);

				int su = rs.getInt("su");
				int dan = rs.getInt("dan");
				String color = rs.getString("color");
//				String today=rs.getString("today");
				Timestamp today = rs.getTimestamp("today");
//				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd EEEE");
//				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");//H:24시간
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm");// h:12시간 a:오전/오후
				System.out.println(
						num + "\t" + sangpum + "\t" + su + "\t" + dan + "\t" + color + "\t" + dateFormat.format(today));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql오류" + e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

			}
		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex1OracleShop ex1 = new Ex1OracleShop();
//		ex1.writeShop();
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("검색할 상품명을 입력해주세요(종료:exit)");
			String sang = sc.nextLine();
			if (sang.equalsIgnoreCase("exit")) {
				System.out.println("프로그램 종료!");
				break;
			}
			int totalCount=ex1.searchCount(sang);
			if(totalCount==0){
				System.out.println(sang+ "이라는 상품은 없습니다");
				continue;//while문 처음으로
			}
			ex1.searchSangpum(sang);
		}

	}

	private int searchCount(String sang) {
		// TODO Auto-generated method stub
		int total=0;
		Connection conn = this.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql="select count(*) from shop where sangpum like '%"+sang+"%'";
		System.out.println(sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				total=rs.getInt(1);//열번호로 가져오기
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql오류"+e.getMessage());
			
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

			}

		}
		return total;
	}

	private void searchSangpum(String sang) {
		// TODO Auto-generated method stub
		Connection conn = this.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String sql="select * from shop where sangpum like '%"+sang+"%'";
		System.out.println(sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("\""+sang+"\"상품 검색 결과");
			System.out.println();
			System.out.println("상품명       색상          수량    단가    날짜");
			System.out.println("=".repeat(50));
			while(rs.next()) {
				String sangpum=rs.getString("sangpum");
				int su=rs.getInt("su");
				int dan=rs.getInt("dan");
				String color=rs.getString("color");
				Timestamp today=rs.getTimestamp("today");
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				System.out.printf("%-10s%-10s%7d%8d%15s\n",sangpum,color,su,dan,sdf.format(today));
			
			}
			
			System.out.println("=".repeat(50));
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("sql오류"+e.getMessage());
			
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

			}

		}
	}
}
