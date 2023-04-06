package smart.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.dao.SmartDao;
import study.dto.SmartDto;

@WebServlet("/board/updateform")
public class BoardUpdateFormServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//num
		int num=Integer.parseInt(request.getParameter("num"));
		//dao
		SmartDao dao=new SmartDao();
		//dto
		SmartDto dto=dao.getData(num);
		//request 저장
		request.setAttribute("dto",dto);
		
		RequestDispatcher rd= request.getRequestDispatcher("../day0405_smart/updateform.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
