package study.day0321;

import java.util.List;
import java.util.Vector;

public class animalList {

	private List<AnimalDTO> list=new Vector<>();
	
	public animalList() {
		list.add(new AnimalDTO("영수",23,"C1"));
		list.add(new AnimalDTO("철수",20,"C3"));
		
		AnimalDTO dto1=new AnimalDTO();
		dto1.setAnimalName("순자");
		dto1.setAnimalAge(19);
		dto1.setAnimalPhoto("C5");
		list.add(dto1);
		
		list.add(new AnimalDTO("검둥",32,"C8"));
		list.add(new AnimalDTO("흰둥",32,"C2"));
		
	}
	public List<AnimalDTO> getAllanimals()
	{
		return list;
	
	
		
	}
}
