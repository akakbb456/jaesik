<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String pathname="c:"+File.separator+"web"+File.separator+"uploads"; // File.separator는 경로를 구분하는 역할이다
	File f = new File(pathname);
	if(! f.exists())
		f.mkdirs(); // 폴더가 없으면 해당 경로에 만들어준다
	
	String encType = "utf-8";
	int maxSize=5*1024*1024;
	
	MultipartRequest mreq = null;
	mreq = new MultipartRequest(request, pathname, maxSize, encType, new DefaultFileRenamePolicy());
	
	String subject = mreq.getParameter("subject");
	String saveFilename=mreq.getFilesystemName("file");
	String originalFilename = mreq.getOriginalFileName("file");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드!!</title>
</head>
<body>
	제목: <%=subject %><br>
	저장된파일명: <%=saveFilename %><br>
	올린파일명: <%=originalFilename %><br>
	<hr>
	<a href="down.jsp?save=<%=saveFilename%>&original=<%=originalFilename%>">다운로드</a>
	





</body>
</html>