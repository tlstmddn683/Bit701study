package smart.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.dao.SmartDao;
import study.dto.SmartDto;

@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//data 읽어서 dto
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		String writer=request.getParameter("writer");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		
		SmartDto dto=new SmartDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setSubject(subject);
		dto.setContent(content);
		
		SmartDao dao=new SmartDao();
		
		//수정 메서드 호출
		dao.updateSmart(dto);
		//수정후 목록으로
		//response.sendRedirect("list");
		//수정후 상세페이지로
		response.sendRedirect("detail?num="+num);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
