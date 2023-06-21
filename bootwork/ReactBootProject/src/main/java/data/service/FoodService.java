package data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import data.dto.FoodDto;
import data.mapper.FoodMapper;
import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class FoodService implements FoodServiceInter {
	private FoodMapper foodMapper;
	
	@Override
	public void insertFood(FoodDto dto) {
		// TODO Auto-generated method stub
		foodMapper.insertFood(dto);
	}

	@Override
	public List<FoodDto> getAllDatas() {
		// TODO Auto-generated method stub
		return foodMapper.getAllDatas();
	}

	@Override
	public FoodDto getData(int num) {
		// TODO Auto-generated method stub
		return foodMapper.getData(num);
	}

	@Override
	public void updatePhoto(String fphoto, int num) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<>();
		map.put("fphoto", fphoto);
		map.put("num", num);
		foodMapper.updatePhoto(map);
	}

	@Override
	public void updateFood(FoodDto dto) {
		// TODO Auto-generated method stub
		foodMapper.updateFood(dto);
	}

	@Override
	public void deleteFood(int num) {
		// TODO Auto-generated method stub
		foodMapper.deleteFood(num);
	}

	

}
