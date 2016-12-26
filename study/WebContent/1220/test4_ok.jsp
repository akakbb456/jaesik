<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String root=pageContext.getServletContext().getRealPath("/");
	String pathname=root+File.separator+"uploads";
	File f = new File(pathname);
	if(! f.exists())
		f.mkdirs();
	
	String encType="utf-8";
	int maxSize=5*1024*1024;
	
	MultipartRequest mreq;
	mreq=new MultipartRequest(request, pathname, maxSize, encType, new DefaultFileRenamePolicy());
	
	String subject = mreq.getParameter("subject");
	String saveFilename=mreq.getFilesystemName("upload");
	String originalFilename=mreq.getOriginalFileName("upload");
	
	long size=0;
	File ff=mreq.getFile("upload");
	if(ff!=null)
		size=ff.length();
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

파일저장실제위치: <%=pathname %> <br>
<hr>
제목: <%=subject %><br>
서버에저장된파일명: <%=saveFilename %><br>
클라이언트가올린파일명: <%=originalFilename %><br>
파일길이: <%=size %><br>

</body>
</html>