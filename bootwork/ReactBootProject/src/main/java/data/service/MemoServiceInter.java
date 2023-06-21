package data.service;

import java.util.List;

import data.dto.MemoDto;

public interface MemoServiceInter {
	public void insertMemo(MemoDto dto);
	public List<MemoDto> getAllMemos();
	public void updateMemo(MemoDto dto);
	public void deleteMemo(int num);
	public List<MemoDto> searchMemos(String searchQuery);
}