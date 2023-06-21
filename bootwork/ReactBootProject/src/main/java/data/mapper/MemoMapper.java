package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MemoDto;

@Mapper
public interface MemoMapper {
	public void insertMemo(MemoDto dto);
	public List<MemoDto> getAllMemos();
	public void updateMemo(MemoDto dto);
	public void deleteMemo(int num);	
	public List<MemoDto> searchMemos(String searchQuery);
}