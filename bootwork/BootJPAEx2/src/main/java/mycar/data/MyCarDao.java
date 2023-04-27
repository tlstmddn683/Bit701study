package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao{
	@Autowired
	MyCarDaoInter carDao;
	//전체갯수반환
	public Long getTotalCount()
	{
		return carDao.count();
	}
	//insert
	public void insertCar(MyCarDto dto)
	{
		carDao.save(dto);//num 값 유무에 따라 insert 또는 update 실행
		
	}
	//list
	public List<MyCarDto> getAllCars()
	{
		
		//return carDao.findAll();//입력 순서대로
		
		//가격이 비싼순서로 출력
		return carDao.findAll(Sort.by(Sort.Direction.DESC,"carprice"));
	}
	//detail
	public MyCarDto getMyCar(Long num)
	{
		return carDao.getReferenceById(num);
		
	}
	//update
	public void updateCar(MyCarDto dto)
	{
		carDao.save(dto);//이번엔 num이 포함이므로 수정을 해준다
	}
	//delete
	public void deleteCar(Long num)
	{
		carDao.deleteById(num);
	}
	//list
		public List<MyCarDto> getSortCars(int idx)
		{
			if(idx==1)
				return carDao.findAll(Sort.by(Sort.Direction.DESC,"carprice"));
			else if(idx==2)
				return carDao.findAll(Sort.by(Sort.Direction.ASC,"carprice"));
			else
				return carDao.findAll();	
			}
}
