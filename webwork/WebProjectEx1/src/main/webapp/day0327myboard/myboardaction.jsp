<%@page import="study.dto.MyBoardDto"%>
<%@page import="study.dao.MyBoardDao"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    MultipartRequest mulRequest=null;
    //저장되는 경로
    ServletContext context=getServletContext();
 	String realPath=context.getRealPath("/save");
 	System.out.println(realPath);
 	//사진의 최대 사이즈
 	int uploadSize=1024*1024*10;//10MB
 	
 	try{
    	mulRequest=new MultipartRequest(request,realPath,uploadSize,"utf-8"
 		,new DefaultFileRenamePolicy());
    	//데이터 읽기
 		String title=mulRequest.getParameter("title");
    	String content=mulRequest.getParameter("content");
    	String writer=mulRequest.getParameter("writer");
    	String category=mulRequest.getParameter("category");
    	String photo=mulRequest.getFilesystemName("upload");//실제업로드된 파일명이다
 		System.out.println(photo);
    	
 		//dto 담기
 		MyBoardDto dto=new MyBoardDto(title,content,writer,photo,category);
 		//dao 선언
 		MyBoardDao dao=new MyBoardDao();
 		//insert
 		dao.insertMyBoard(dto);
 		//목록으로 이동
 		response.sendRedirect("myboardlist.jsp");
 		
 	}catch (Exception e)
 	{
 		out.print("업로드중 문제 발생"+e.getMessage());
 	}
    %>