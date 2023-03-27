package study.day0320;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex1DbMunje {
	final static String MYSQL_DRIVER="com.mysql.cj.jdbc.Driver";
	static final String MYSQL_URL="jdbc:mysql://localhost:3306/bit701?serverTimezone=Asia/Seoul";

	Scanner sc=new Scanner(System.in);
	
	public Ex1DbMunje() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(MYSQL_DRIVER);
			//System.out.println("Mysql 드라이버 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql 드라이버 실패:"+e.getMessage());
		}
	}

	public Connection getConnection()
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
	
	//전체 출력
	public void writeData()
	{
		Connection conn=getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from bitcamp order by num asc";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("\t** 전체 데이타 출력 **");
			System.out.println();
			System.out.println("번호  이름      자바  스프링     합계    평균    날짜 ");
			System.out.println("=".repeat(60));
			
			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("name");
				int java=rs.getInt("java");
				int spring=rs.getInt("spring");
				String today=rs.getString("today");
				
				int sum=java+spring;
				double avg=sum/2.0;
				
				System.out.println(num+"   "+name+"\t"+java+"\t"+spring+"\t"+sum+"\t"+avg+"\t"+today);
			}			
			
		} catch (SQLException e) {
			System.out.println("writeData 오류:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}
	
	//이름 검색
	public void searchNameData()
	{
		System.out.println("검색할 이름을 입력하세요");
		String search=sc.nextLine();
				
		Connection conn=getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from bitcamp where name like '"+search+"%' order by name asc";
		//System.out.println(sql);
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("\t** \'"+search+"\' 검색 결과 **");
			System.out.println();
			System.out.println("번호  이름      자바  스프링     합계    평균    날짜 ");
			System.out.println("=".repeat(60));
			
			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("name");
				int java=rs.getInt("java");
				int spring=rs.getInt("spring");
				String today=rs.getString("today");
				
				int sum=java+spring;
				double avg=sum/2.0;
				
				System.out.println(num+"   "+name+"\t"+java+"\t"+spring+"\t"+sum+"\t"+avg+"\t"+today);
			}			
			
		} catch (SQLException e) {
			System.out.println("searchNameData 오류:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}
	
	//평균검색
	public void searchAvgData()
	{
		System.out.println("검색할 평균을 입력하세요(평균보다 높은 데이타 출력)");
		double searchAvg=Double.parseDouble(sc.nextLine());
				
		Connection conn=getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select num,name,java,spring,java+spring sum,(java+spring)/2 avg,today from bitcamp where (java+spring)/2>="+searchAvg+" order by avg desc";//평균이 높은데이타부터 출력
		//System.out.println(sql);
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("\t** 평균 "+searchAvg+"점 이상 검색 결과 **");
			System.out.println();
			System.out.println("번호  이름      자바  스프링     합계    평균    날짜 ");
			System.out.println("=".repeat(60));
			
			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("name");
				int java=rs.getInt("java");
				int spring=rs.getInt("spring");
				String today=rs.getString("today");
				
				int sum=rs.getInt("sum");
				double avg=rs.getDouble("avg");
				
				System.out.println(num+"   "+name+"\t"+java+"\t"+spring+"\t"+sum+"\t"+avg+"\t"+today);
			}			
			
		} catch (SQLException e) {
			System.out.println("searchAvgData 오류:"+e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}
	
	//데이타 추가
	public void insertData()
	{
		System.out.println("추가할 이름은?");
		String name=sc.nextLine();
		System.out.println("추가할 자바점수는?");
		int java=Integer.parseInt(sc.nextLine());
		System.out.println("추가할 스프링점수는?");
		int spring=Integer.parseInt(sc.nextLine());
		
		Connection conn=this.getConnection();
		Statement stmt=null;
		String sql="insert into bitcamp (name,java,spring,today) values ('"+name+"',"+java+","+spring+",now())";//mysql
		//String sql="insert into bitcamp values (seq1.nextval,'"+name+"',"+java+","+spring+",sysdate)";//oracle
		//System.out.println(sql);
		
		try {
			stmt=conn.createStatement();
			//실행
			stmt.execute(sql);
			System.out.println("데이타가 추가되었습니다");
		} catch (SQLException e) {
			System.out.println("insert 오류:"+e.getMessage());
		}finally {
			try {				
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}		
		
	}
	
	//메뉴 반환
	public int getMenu()
	{
		int menu=0;
		System.out.println("=".repeat(60));
		System.out.println(" ** DB Menu **");
		System.out.println("1.  데이타 추가");
		System.out.println("2.  전체 데이타 출력");
		System.out.println("3.  이름으로 검색");
		System.out.println("4.  평균으로 검색");
		System.out.println("5.  종 료");
		
		menu=Integer.parseInt(sc.nextLine());
		
		return menu;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex1DbMunje ex=new Ex1DbMunje();
		while(true)
		{
			switch (ex.getMenu()) {
			case 1:
				ex.insertData();
				break;
			case 2:
				ex.writeData();
				break;
			case 3:
				ex.searchNameData();
				break;
			case 4:
				ex.searchAvgData();
				break;
			default:
				System.out.println("** 프로그램 종료 **");
				System.exit(0);
			}
		}
	}

}

