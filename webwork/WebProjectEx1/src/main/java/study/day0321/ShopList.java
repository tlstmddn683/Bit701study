package study.day0321;

import java.util.ArrayList;
import java.util.List;

public class ShopList {
	private List<ShopDto> list=new ArrayList<>();
	
	
public ShopList() {
	list.add(new ShopDto("구두",50000,"red","14"));
	list.add(new ShopDto("청바지",30000,"blue","4"));
	list.add(new ShopDto("구두",60000,"green","11"));
	list.add(new ShopDto("구두",55000,"gray","12"));
	ShopDto dto1=new ShopDto();
	dto1.setSangpumName("조끼");
	dto1.setSangpumPrice(50000);
	dto1.setSangpumColor("black");
	dto1.setSangpumPhoto("6");
	list.add(dto1);
}
	public List<ShopDto> getAllsangpum()
	{
		return list;
	}
}

