<%@page import="com.util.FileManager"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8"); // 다운받는거에는 밑에 태그들 다 지워
	String pathname="c:"+File.separator+"web"+File.separator+"uploads";
	String saveFilename=request.getParameter("save");
	String originalFilename=request.getParameter("original"); 
	
	boolean result = FileManager.filedownload(saveFilename, originalFilename, pathname, response);
	
	if(!result) { // 다운을 실패했으면!
		out.print("<script>alert('다운실패');history.back();</script>");
	}
%>