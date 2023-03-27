package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.MyCarDto;
import study.dto.PersonDto;

public class MyCarDao {
	DbConnect db = new DbConnect();

	// insert임당
	public void insertCar(MyCarDto dto)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="insert into mycar values(null,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩입니당
			pstmt.setString(1,dto.getCarname());
			pstmt.setInt(2,dto.getCarprice());
			pstmt.setString(3,dto.getCarphoto());
			pstmt.setString(4,dto.getGuipday());
			//실행임당
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
			db.dbClose(pstmt,conn);
		}
	}
		//delete임당
	public void deleteCar(int num)
	{
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		String sql="delete from mycar where num="+num;
		try {
			pstmt=conn.prepareStatement(sql);
			//실행임다
			pstmt.execute();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	//get data
		
	
	public List<MyCarDto> getAllCars()
	{
		List<MyCarDto> list= new Vector<>();
		Connection conn=db.getMysqlConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from mycar order by num asc";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MyCarDto dto=new MyCarDto();
				//dto에 데이터를 넣습니당
				dto.setNum(rs.getInt("num"));
				dto.setCarname(rs.getString("carname"));
				dto.setCarprice(rs.getInt("carprice"));
				dto.setCarphoto(rs.getString("carphoto"));
				dto.setGuipday(rs.getString("guipday"));
				//dto를 list에 추가해보자
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
