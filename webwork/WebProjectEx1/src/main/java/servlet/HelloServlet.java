package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/Bit/Hello.do") //매핑주소는 임의로 지정가능
public class HelloServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
//	PrintWriter out=response.getWriter();
//	out.append("<h1>Servlet Exe</h1>");
		String msg="행복하세요";
		Date date=new Date();
		//request 에 저장하기
		request.setAttribute("msg",msg);
		request.setAttribute("today",date);
		//출력할 jsp로 포워드
		//forward: url주소 안바뀜, request 의 값을 그대로 전달한다
		//redirect:url주소 안바뀜, request 의 값 전달 안됨(왜냐하면 request가 새로 생성 되기 때문.)
		RequestDispatcher rd=request.getRequestDispatcher("../day0404_jstl/go.jsp");
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
