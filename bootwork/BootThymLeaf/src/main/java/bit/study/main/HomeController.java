package bit.study.main;

import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.springframework.boot.autoconfigure.info.ProjectInfoProperties.Build;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	List<ShopDto>list=new Vector<>();
	@GetMapping("/")
	public String home(Model model)
	{
		model.addAttribute("message","HappyDay!!");
		
		ShopDto dto=ShopDto.builder()
			.sang("복숭아")
			.su(5)
			.dan(1200)
			.build();
			model.addAttribute("dto",dto);
			model.addAttribute("today",new Date());
		return "home";
	}
	@GetMapping("/list")
	public String list(Model model)
	{
		list.clear();
		list.add(new ShopDto("상품1","1.png",1,20000));
		list.add(new ShopDto("상품2","1 (1).gif",2,21000));
		list.add(new ShopDto("상품3","1 (3).gif",3,22000));
		list.add(new ShopDto("상품4","1 (3).jpg",4,23000));
		list.add(new ShopDto("상품5","11.gif",5,24000));
		
		model.addAttribute("list",list);
		return "list";
	}
	@GetMapping("/detail")
	public String detail(int index,Model model,HttpSession session)
	{
		session.setAttribute("loginid", "user");
		model.addAttribute("dto",list.get(index));
		return "detail";
	}
}
