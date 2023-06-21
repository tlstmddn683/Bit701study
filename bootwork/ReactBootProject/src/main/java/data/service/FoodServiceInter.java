package data.service;


import java.util.List;

import data.dto.FoodDto;

public interface FoodServiceInter {
	public void insertFood(FoodDto dto);
	public List<FoodDto> getAllDatas();
	public FoodDto getData(int num);
	public void updatePhoto(String fphoto,int num);
	public void updateFood(FoodDto dto);
	public void deleteFood(int num);
}
