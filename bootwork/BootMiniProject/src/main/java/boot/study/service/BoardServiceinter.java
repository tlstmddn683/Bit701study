package boot.study.service;

import java.util.List;

import boot.study.dto.BoardDto;

public interface BoardServiceinter {
	public int getMaxNum();
	public int getTotalCount();
	public void updateStep(int ref,int step);
	public void insertBoard(BoardDto dto);
	public List<BoardDto> getPagingList(int start,int perpage);
	public void updateReadcount(int num);
	public BoardDto getData(int num);
	public boolean isEqualPass(int num,String pass);
	public void deleteBoard(int num);
	public void updateBoard(BoardDto dto);
}
