package bit.study.spring;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//�ڵ����� xml�� bean�� ���
@Controller
public class HomeController {
//	@RequestMapping(value = "/",method = RequestMethod.GET)
//	@RequestMapping("/")// ��������
	
	@GetMapping("/") // ������ 5.0 ���� ���� ��� ����
	public String home(Model model,HttpSession session)
	{
		//session�� ����
		session.setAttribute("myid", "angel");
		//request�� ����
		model.addAttribute("message","Have a Good Day!!!");
		model.addAttribute("today",new Date());
		
		return "home"; //�������� ���ϸ� /WEB-INF/views/home.jsp
	}
//	@GetMapping("/myshop")
	@GetMapping({"/myshop","/yourshop"})//���� ������ �����
	public ModelAndView goshop()
	{
		//request�� ����
		ModelAndView model=new ModelAndView();
		model.addObject("sangpum","����");
		model.addObject("price","9õ����");
		model.addObject("color","white");
		model.addObject("carphoto","mycar1.png");
		model.addObject("sangpum2","�ƿ��");
		model.addObject("price2","8õ����");
		model.addObject("color2","white");
		model.addObject("carphoto2","mycar2.png");
		//������
		model.setViewName("myshop");
		return model;
		
	}
	
}
