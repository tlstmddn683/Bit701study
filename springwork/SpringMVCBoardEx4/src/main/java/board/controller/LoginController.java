package board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.dao.MemberDao;

@Controller
public class LoginController {
	@Autowired
	MemberDao memberDao;
	@GetMapping("/login/form")
	public String form(HttpSession session) {
		// �α��� ���θ� �Ǵ��� ���� -���� ��� null��
		String loginok = (String) session.getAttribute("loginok");
		if (loginok == null)

			return "login/login";
		else
			return "login/logout";
	}
	@PostMapping("/login/loginaction")
	public String loginaction(
			@RequestParam String email,  
			@RequestParam String pass, 
			@RequestParam(required = false) String saveemail,
			//@RequestParam(defaultValue = "no") String saveemail,
			HttpSession session
			)
	{
		//System.out.println("saveemail="+saveemail);
		//�̸��ϰ� ��й�ȣ�� �´��� üũ
		int count=memberDao.isEqualPassEmail(email, pass);
		if(count==1)//�̸��ϰ� ��й�ȣ�� �´ٸ� 1��ȯ
		{	
			//���ǽð�
			session.setMaxInactiveInterval(60*60*5);//5�ð� ��ȿ
			
			//�α��� ������ ���ǿ� �����ϱ�
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginemail",email);
			session.setAttribute("saveemail",saveemail==null?"no":"yes");
			
			//�α����� ������ �����  num���� �� ���ǿ� �����ϱ�
			int num=memberDao.selectOneOfEmail(email).getNum();
			session.setAttribute("loginnum", num);
			
			return "redirect:../board/list";//�α��� ������ �Խ��� �������
		}else
			//�α��ν��н� loginfail�� �̵��ؼ� �ڹٽ�ũ��Ʈ �ڵ� ����
			return  "login/loginfail";
	}
	@GetMapping("/login/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		return "redirect:form";
	}
}
