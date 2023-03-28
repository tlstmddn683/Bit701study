<%@page import="java.io.File"%>
<%@page import="study.dao.MyBoardDao"%>
<%@page import="study.dto.MyBoardDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//num읽기
int num= Integer.parseInt(request.getParameter("num"));
//dao
MyBoardDao dao=new MyBoardDao();
//글삭제시 업로드 했던 사진도 폴더에서 지우고자 할 경우
//업로드 했던 파일명을 얻어야된다!!

String photo=dao.getMyData(num).getPhoto();
//업로드 된 경로
String realPath=getServletContext().getRealPath("/save");
//파일 객체 생성
File file=new File(realPath+"/"+photo);
file.delete();
//delete
dao.deleteMyBoard(num);
//목록으로 가기
response.sendRedirect("myboardlist.jsp");
%>