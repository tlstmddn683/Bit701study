<%@page import="study.dao.MyBoardDao"%>
<%@page import="study.dto.MyBoardDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
    MultipartRequest mulRequest=null;
 	//저장경로
 	ServletContext context=getServletContext();
 	String realPath=context.getRealPath("/save");
 	System.out.println(realPath);
 	int uploadSize=1024*1024*3;//3mb
 	
 	try{
 		mulRequest=new MultipartRequest(request,realPath,uploadSize,"utf-8"
 				,new DefaultFileRenamePolicy());
 		//데이터 읽기
 		int num=Integer.parseInt(mulRequest.getParameter("num"));
 		String writer=mulRequest.getParameter("writer");
 		String title=mulRequest.getParameter("title");
 		String content=mulRequest.getParameter("content");
 		String category=mulRequest.getParameter("category");
 		String photo=mulRequest.getFilesystemName("upload");//실제업로드된 파일명이다
 		System.out.println(photo);
 		
 		//dto 담기
 		MyBoardDto dto=new MyBoardDto(writer,title,content,photo,category);
 		
 		dto.setNum(num);
 		//dao 선언
 		MyBoardDao dao=new MyBoardDao();
 		//update
 		dao.updateMyBoard(dto);
		//목록
		response.sendRedirect("mydetailboard.jsp?num="+num);
 	
 	
 	
 	}catch(Exception e)
 	{
 		out.print("업로드 중 오류발생"+e.getMessage());
 	}
 %>