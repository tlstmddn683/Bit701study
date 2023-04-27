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
		// 로그인 여부를 판단할 세션 -없을 경우 null값
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
		//이메일과 비밀번호가 맞는지 체크
		int count=memberDao.isEqualPassEmail(email, pass);
		if(count==1)//이메일과 비밀번호가 맞다면 1반환
		{	
			//세션시간
			session.setMaxInactiveInterval(60*60*5);//5시간 유효
			
			//로그인 성공시 세션에 저장하기
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginemail",email);
			session.setAttribute("saveemail",saveemail==null?"no":"yes");
			
			//로그인을 성공한 사람의  num값을 얻어서 세션에 저장하기
			int num=memberDao.selectOneOfEmail(email).getNum();
			session.setAttribute("loginnum", num);
			
			return "redirect:../board/list";//로그인 성공시 게시판 목록으로
		}else
			//로그인실패시 loginfail로 이동해서 자바스크립트 코드 실행
			return  "login/loginfail";
	}
	@GetMapping("/login/logout")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		return "redirect:form";
	}
}
