<%@page import="java.io.PrintWriter"%>
<%@page import="study.dto.MyBoardDto"%>
<%@page import="study.dao.MyBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
					<%
						MyBoardDao dao = new MyBoardDao();
						ArrayList<MyBoardDto> list = dao.getSearchArrayList(request.getParameter("searchField"),
								request.getParameter("searchText"));
						if (list.size() == 0) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('검색결과가 없습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						for (int i = 0; i < list.size(); i++) {
							
					%>
					<tr>
						<td><%=list.get(i).getWriter()%></td>
						<%--현재 게시글에 대한 정보 --%>
						<td><a href="myboardlist.jsp?writer=<%=list.get(i).getWriter()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getNum()%></td>
						<td><%=list.get(i).getReadcount()%></td>
						<td><%=list.get(i).getCategory() %></td>
					
					</tr>
					<%
						}
					%>
				