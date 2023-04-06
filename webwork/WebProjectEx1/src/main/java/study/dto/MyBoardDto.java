package study.dto;

import java.sql.Timestamp;

public class MyBoardDto {
	private int num;
	private String title;
	private String content;
	private String writer;
	private String photo;
	private int readcount;
	private Timestamp writeday;
	private String category;
	private int likes;
	private int unlikes;
	
	public MyBoardDto() {
		super();
	}

	public MyBoardDto(int num, String title, String content, String writer, String photo, int readcount,
			Timestamp writeday, String category ,int likes ,int unlikes) {
		super();
		
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.photo = photo;
		this.readcount = readcount;
		this.writeday = writeday;
		this.category= category;
		this.likes=likes;
		this.unlikes=unlikes;
	}
	

	public MyBoardDto(String title, String content, String writer, String photo, String category) {
		super();
		
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.photo = photo;
		this.category=category;
	}
	

	public int getUnlikes() {
		return unlikes;
	}

	public void setUnlikes(int unlikes) {
		this.unlikes = unlikes;
	}

	public int getlikes() {
		return likes;
	}

	public void setlikes(int likes) {
		this.likes = likes;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}