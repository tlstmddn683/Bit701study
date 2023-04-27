package study.form;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import study.dto.ShopDto;
@Controller
public class Form2Cotroller {
	
	@GetMapping("/form2")
	public String form2()
	{
		return "myform/form2";
		
	}
	
	@PostMapping("/read2")
	//@ModelAttribute : ���� �̸��� �ڵ����� �о���� model���� ����
	//model �� ����Ǵ� �̸��� ShopDto�̸����� �𵨿� �����
	//�ٸ��̸����� �����ϰ� ���� ��� @ModelAttribute("�̸�")
	//@ModelAttribute ��������
//	public String read2(@ModelAttribute ShopDto dto,
//			@RequestParam int pagenum, Model model)
//	{
//		model.addAttribute("pagenum",pagenum);
//		return "result/readdata2";
//	}
	public String read2(ShopDto dto,int pagenum, Model model)
	{
		model.addAttribute("pagenum",pagenum);
		return "result/readdata2";
	}
}
