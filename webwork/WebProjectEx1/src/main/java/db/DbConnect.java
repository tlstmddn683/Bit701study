package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnect {
	final static String MYSQL_DRIVER="com.mysql.cj.jdbc.Driver";
	static final String MYSQL_URL="jdbc:mysql://localhost:3306/bit701?serverTimezone=Asia/Seoul";
	
	static final String ORACLE_DRIVER="oracle.jdbc.driver.OracleDriver";
	static final String ORACLE_URL="jdbc:oracle:thin:@localhost:1521:xe";
	
	public DbConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(ORACLE_DRIVER);
			//System.out.println("오라클 드라이버 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 실패:"+e.getMessage());
		}
		try {
			Class.forName(MYSQL_DRIVER);
			//System.out.println("오라클 드라이버 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("MYSQL 드라이버 실패:"+e.getMessage());
		}
	}
	
	public Connection getOracleConnection()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ORACLE_URL, "angel", "a1234");
			//System.out.println("로칼 오라클 연결 성공");
		} catch (SQLException e) {
			System.out.println("로칼 오라클 연결 실패:"+e.getMessage());
		}
		return conn;
	}
	
	public Connection getMysqlConnection()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(MYSQL_URL, "angel", "1234");
			//System.out.println("로칼 Mysql 연결 성공");
		} catch (SQLException e) {
			System.out.println("로칼 Mysql 연결 실패:"+e.getMessage());
		}
		return conn;
	}
	public void dbClose(PreparedStatement pstmt,Connection conn) 
	{
		try {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn) 
	{
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
