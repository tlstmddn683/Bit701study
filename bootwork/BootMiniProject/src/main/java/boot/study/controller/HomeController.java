package boot.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping({"/","/home1"})
	public String home1()
	{
		return "/main";
		}
	@GetMapping({"/home2"})
	public String home2()
	{
		return "/sub";
	}
}
