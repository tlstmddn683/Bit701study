package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;
import java.util.Vector;

import db.DbConnect;
import study.dto.MyBoardDto;
import study.dto.SimpleBoardDto;

public class MyBoardDao {
	DbConnect db = new DbConnect();

	// insert
	public void insertMyBoard(MyBoardDto dto) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into myboard (title,content,writer,photo,category) values(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getCategory());
			// 실행
			pstmt.execute();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	//getSearch
	public ArrayList<MyBoardDto> getSearchArrayList(String searchField, String searchText){
		ArrayList<MyBoardDto> list = new ArrayList<MyBoardDto>();
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL= "select * from myboard where"+searchField.trim();
		try {
			if(searchText != null && ! searchText.equals("")) {
				SQL+="LIKE'%"+searchText.trim()+"%' order by writer desc limit 10";
			}
			pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
		while(rs.next()) {
			MyBoardDto dto=new MyBoardDto();
			dto.setNum(rs.getInt(1));
			dto.setTitle(rs.getString(2));
			dto.setWriter(rs.getString(3));
			dto.setPhoto(rs.getString(4));
			dto.setReadcount(rs.getInt(5));
			dto.setWriteday(rs.getTimestamp(6));
			dto.setCategory(rs.getString(7));
			dto.setLike(rs.getInt(8));
			list.add(dto);
		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
	// all select
	public List<MyBoardDto> getMyAllDatas() {
		List<MyBoardDto> list = new Vector<>();
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from myboard order by num desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String photo = rs.getString("photo");
				int readcount = rs.getInt("readcount");
				Timestamp writeday = rs.getTimestamp("writeday");
				String category=rs.getString("category");
				int like=rs.getInt("like");

				MyBoardDto dto = new MyBoardDto(num, title, content, writer, photo, readcount, writeday,category,like);
				// list에 추가
				list.add(dto);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	// readcount 증가
	public void updateMyReadCount(int num) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;

		String sql = "update myboard set readcount=readcount+1 where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setInt(1, num);
			// 실행
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	//like 증가
	public void updateMyLike(int num) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;

		String sql = "update myboard set like=like+1 where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setInt(1, num);
			// 실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	// detail view
	public MyBoardDto getMyData(int num) {
		MyBoardDto dto = null;
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from myboard where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			// ㅂㅇㄷ
			pstmt.setInt(1, num);
			// ㅅㅎ
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String photo = rs.getString("photo");
				int readcount = rs.getInt("readcount");
				Timestamp writeday = rs.getTimestamp("writeday");
				String category=rs.getString("category");
				int like=rs.getInt("like");

				dto = new MyBoardDto(num, title, content, writer, photo, readcount, writeday,category,like);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return dto;

	}

	// delete
	public void deleteMyBoard(int num) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from myboard where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			// ㅂㅇㄷ
			pstmt.setInt(1, num);
			// ㅅㅎ
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// update
	public void updateMyBoard(MyBoardDto dto) {
		Connection conn = db.getMysqlConnection();
		Statement stmt = null;

		String sql = "update myboard set title='" + dto.getTitle() + "',content='" + dto.getContent() + "',writer='"
				+ dto.getWriter() + "',photo='" + dto.getPhoto() +"',cartegory='"+dto.getCategory()+ "' where num=" + dto.getNum();
		String sql2 = "update myboard set title='" + dto.getTitle() + "',content='" + dto.getContent() + "',writer='"
				+ dto.getWriter() +"',cartegory='"+dto.getCategory()+ "' where num=" + dto.getNum();
		try {
			stmt = conn.createStatement();
			if (dto.getPhoto() == null) {
				stmt.execute(sql2);

			} else
				stmt.execute(sql);

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();

			} catch (SQLException e) {

			}
		}
	}
}
