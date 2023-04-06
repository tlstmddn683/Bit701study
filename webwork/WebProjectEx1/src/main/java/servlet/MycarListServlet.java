package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.dao.MyCarDao;
import study.dto.MyCarDto;

/**
 * Servlet implementation class SawonListServlet
 */
@WebServlet("/mycar/list")
public class MycarListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MyCarDao dao=new MyCarDao();
		List<MyCarDto>list=dao.getMyCarList("");
		//request에 모든 출력 정보 저장
		request.setAttribute("list",list);
		request.setAttribute("count",list.size());
			
		RequestDispatcher rd=request.getRequestDispatcher("../day0404_jstl/mycarlist.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
