package data.service;

import java.util.List;

import org.springframework.stereotype.Service;

import data.dto.MemoDto;
import data.mapper.MemoMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemoService implements MemoServiceInter{

	MemoMapper memoMapper;
	
	@Override
	public void insertMemo(MemoDto dto) {
		// TODO Auto-generated method stub
		memoMapper.insertMemo(dto);
	}

	@Override
	public List<MemoDto> getAllMemos() {
		// TODO Auto-generated method stub
		return memoMapper.getAllMemos();
	}

	@Override
	public void updateMemo(MemoDto dto) {
		// TODO Auto-generated method stub
		memoMapper.updateMemo(dto);
	}

	@Override
	public void deleteMemo(int num) {
		// TODO Auto-generated method stub
		memoMapper.deleteMemo(num);
		
	}

	@Override
	public List<MemoDto> searchMemos(String searchQuery) {
		// TODO Auto-generated method stub
		return memoMapper.searchMemos(searchQuery);
	}

}