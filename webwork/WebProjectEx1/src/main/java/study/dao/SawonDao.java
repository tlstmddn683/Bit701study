package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.SawonDto;

public class SawonDao {
	DbConnect db = new DbConnect();

	public void insertSawon(SawonDto dto)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into sawon values(null,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			//ㅂㅇㄷ
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2,dto.getScore());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4,dto.getBuseo());
			//ㅅㅎ
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
		//delete
	public void deleteSawon(int num)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="delete from sawon where num="+num;
		try {
			pstmt=conn.prepareStatement(sql);
			//ㅅㅎ
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	public List<SawonDto> getSelectSawons(int select)
	{
		List<SawonDto> list= new Vector<>();
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="";
		if(select==1)
			sql="select * from sawon order by num asc";
		else if(select==2)
			sql="select * from sawon where gender='남자' order by num asc";
		else
			sql="select * from sawon where gender='여자' order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				SawonDto dto=new SawonDto();
				//dto에 데이터 삽입
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setScore(rs.getInt("score"));
				dto.setGender(rs.getString("gender"));
				dto.setBuseo(rs.getString("buseo"));
				//dto를 리스트에 추가
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
			db.dbClose(rs,pstmt,conn);
		}
		return list;
	}
	
}