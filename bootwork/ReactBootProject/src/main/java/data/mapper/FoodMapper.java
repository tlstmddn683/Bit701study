package data.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.FoodDto;

@Mapper
public interface FoodMapper {
	public void insertFood(FoodDto dto);
	public List<FoodDto> getAllDatas();
	public FoodDto getData(int num);
	public void updatePhoto(HashMap<String, Object>map);
	public void updateFood(FoodDto dto);
	public void deleteFood(int num);
}
