package study.day0320;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex2MysqlSawonCRUD {
	final static String MYSQL_DRIVER="com.mysql.cj.jdbc.Driver";
	static final String MYSQL_URL="jdbc:mysql://localhost:3306/bit701?serverTimezone=Asia/Seoul";

	Scanner sc=new Scanner(System.in);

	public Ex2MysqlSawonCRUD() {
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

	//메뉴 반환
	public int getMenu()
	{
		int menu=0;
		System.out.println("=".repeat(60));
		System.out.println(" ** Sawon DB Menu **");
		System.out.println("1.  사원 추가");
		System.out.println("2.  전체 사원 출력");
		System.out.println("3.  이름으로 검색");
		System.out.println("4.  이름으로 삭제");
		System.out.println("5.  시퀀스번호로 수정");
		System.out.println("6.  남여 성별로 분석");
		System.out.println("7.  부서별 분석");
		System.out.println("8.  종 료");

		menu=Integer.parseInt(sc.nextLine());

		return menu;
	}

	//사원 추가
	public void addSawon()
	{
		
		System.out.println("추가할 사원명은?");
		String name=sc.nextLine();
		System.out.println("사원 점수는?");
		int score=Integer.parseInt(sc.nextLine());
		System.out.println("성별 선택  1.남자  2.여자");
		int gidx=Integer.parseInt(sc.nextLine());
		if(!(gidx==1 || gidx==2))
		{
			System.out.println("잘못 입력했습니다");
			return;//현재 메서드 종료
		}
		String gender=gidx==1?"남자":"여자";
		
		System.out.println("사원이 속한 부서명을 입력하세요");
		String buseo=sc.nextLine();
		
		Connection conn=getConnection();
		Statement stmt=null;
		String sql="";
		
		sql="insert into sawon values (null,'"+name+"',"+score+",'"+gender+"','"+buseo+"')";
		//System.out.println(sql);

		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			System.out.println("사원데이타가 추가되었습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {				
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}

	}

	//전체 사원 출력
	public void writeSawon()
	{
		Connection conn=getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from sawon order by num";

		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println(" ** 전체 사원 명단 **");
			System.out.println();
			System.out.println("번호\t사원명\t성별\t부서명\t점수");
			System.out.println("=".repeat(40));
			while(rs.next())
			{
				System.out.println(rs.getInt("num")+"\t"+
									rs.getString("name")+"\t"+
									rs.getString("gender")+"\t"+
									rs.getString("buseo")+"\t"+
									rs.getInt("score"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {	
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}

	//이름으로 검색
	public void searchSawonName()
	{
		System.out.println("검색할 사원명을 입력하세요");
		String searchName=sc.nextLine();
		
		Connection conn=getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from sawon where name='"+searchName+"'";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("\""+searchName+"\" 사원 검색 결과");
			
			while(rs.next())
			{
				System.out.println("---------------------");
				System.out.println("성별:"+rs.getString("gender"));
				System.out.println("부서명:"+rs.getString("buseo"));
				System.out.println("점수 :"+rs.getInt("score"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {				
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}

	//이름으로 삭제
	public void deleteSawonName()
	{
		System.out.println("삭제할 이름을 입력해주세요");
		String name=sc.nextLine();
		
		Connection conn=getConnection();
		Statement stmt=null;
		String sql="delete from sawon where name='"+name+"'";		

		try {
			stmt=conn.createStatement();
			int n=stmt.executeUpdate(sql);//반환타입: 성공적으로 삭제된 데이타의 갯수
			if(n==0)
				System.out.println("사원중 "+name+" 님은 없습니다");
			else
				System.out.println("총 "+n+"명의 "+name+" 님이 삭제되었습니다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {				
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}

	//시퀀스 번호로 수정
	public void updateSawonNum()
	{
		System.out.println("수정할 시퀀스 번호를 입력하세요");
		int num=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 이름은?");
		String name=sc.nextLine();
		System.out.println("수정할 부서는?");
		String buseo=sc.nextLine();
		
		Connection conn=getConnection();
		Statement stmt=null;
		String sql="update sawon set name='"+name+"',buseo='"+buseo+"' where num="+num;
		//System.out.println(sql);

		try {
			stmt=conn.createStatement();
			int n=stmt.executeUpdate(sql);
			if(n==0)
				System.out.println("해당 번호는 없습니다");
			else
				System.out.println("사원의 정보를 수정했습니다");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {				
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}

	//남여 분석
	public void analysisGender()
	{
		Connection conn=getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select gender,count(*) count,round(avg(score),1) avg from sawon group by gender";

		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			System.out.println("성별\t인원수\t평균점수");
			System.out.println("------------------------------");
			while(rs.next())
			{
				System.out.println(rs.getString("gender")+"\t"+
						rs.getInt("count")+"\t"+rs.getDouble("avg"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {		
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}

	//부서별 분석
	public void analysisBuseo()
	{
		Connection conn=getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select buseo,count(*) count,round(avg(score),1) avg from sawon group by buseo";

		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			System.out.println("부서별\t인원수\t평균점수");
			System.out.println("------------------------------");
			while(rs.next())
			{
				System.out.println(rs.getString("buseo")+"\t"+
						rs.getInt("count")+"\t"+rs.getDouble("avg"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {	
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}catch(SQLException e) {}
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex2MysqlSawonCRUD ex=new Ex2MysqlSawonCRUD();
		while(true)
		{
			switch (ex.getMenu()) {
			case 1:
				ex.addSawon();
				break;
			case 2:
				ex.writeSawon();
				break;
			case 3:
				ex.searchSawonName();
				break;
			case 4:
				ex.deleteSawonName();
				break;
			case 5:
				ex.updateSawonNum();
				break;
			case 6:
				ex.analysisGender();
				break;
			case 7:
				ex.analysisBuseo();
				break;
			default:
				System.out.println("** 사원 DB 프로그램을 종료합니다**");
				System.exit(0);
			}
		}
	}

}



