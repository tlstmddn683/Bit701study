package study.form;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Form4Controller {
		@GetMapping("/form4")
		public String form4()
		{
			return"myform/form4";
		}
		@PostMapping("/read4")
		public String read4(
				@RequestParam String message,
				HttpServletRequest request,
				@RequestParam("oneupload") MultipartFile one,
				@RequestParam("multiupload") ArrayList<MultipartFile>multi,
				Model model)
		{
			//���� ���ε� �� ���� ���
			String realPath=request.getSession().getServletContext().getRealPath("/resources/image");
			System.out.println(realPath);
			
			String onefile="";
			String multifile="";
			//���ε�
			try {
				one.transferTo(new File(realPath+"/"+one.getOriginalFilename()));
				//1�� ���ε��� ���ϸ� ����
				onefile=one.getOriginalFilename();
				
				//������ ���ε�
				for(MultipartFile mfile:multi)
				{
					mfile.transferTo(new File(realPath+"/"+mfile.getOriginalFilename()));
					//3�� ���ε�� >> a.jpg,b.jpg,c.jpg,.....
					multifile+=mfile.getOriginalFilename()+",";
					
				}
					//������ �ĸ� ����
				multifile=multifile.substring(0,multifile.length()-1);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//model�� �ʿ��� ������ ����
			model.addAttribute("message",message);
			model.addAttribute("onefile",onefile);
			model.addAttribute("multifile",multifile);
			
			return"result/readdata4";
		}
}
