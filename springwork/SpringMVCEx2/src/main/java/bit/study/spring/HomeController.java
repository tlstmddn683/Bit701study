package bit.study.spring;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//자동으로 xml에 bean을 등록
@Controller
public class HomeController {
//	@RequestMapping(value = "/",method = RequestMethod.GET)
//	@RequestMapping("/")// 생략가능
	
	@GetMapping("/") // 스프링 5.0 버전 부터 사용 가능
	public String home(Model model,HttpSession session)
	{
		//session에 저장
		session.setAttribute("myid", "angel");
		//request에 저장
		model.addAttribute("message","Have a Good Day!!!");
		model.addAttribute("today",new Date());
		
		return "home"; //포워드할 파일명 /WEB-INF/views/home.jsp
	}
//	@GetMapping("/myshop")
	@GetMapping({"/myshop","/yourshop"})//매핑 여러개 적용시
	public ModelAndView goshop()
	{
		//request에 저장
		ModelAndView model=new ModelAndView();
		model.addObject("sangpum","벤츠");
		model.addObject("price","9천만원");
		model.addObject("color","white");
		model.addObject("carphoto","mycar1.png");
		model.addObject("sangpum2","아우디");
		model.addObject("price2","8천만원");
		model.addObject("color2","white");
		model.addObject("carphoto2","mycar2.png");
		//포워드
		model.setViewName("myshop");
		return model;
		
	}
	
}
