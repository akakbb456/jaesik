<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.beans.editors.EnumEditor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.print("method: "+request.getMethod()+"<br>"); // 어떤 형식으로 보내는지!! : post
	out.print("query(get방식 파라미터):"+request.getQueryString()+"<br>"); // get방식이 아니므로 : null
	
	out.print("header....<br>");
	Enumeration<String> e = request.getHeaderNames();
	while(e.hasMoreElements()) {
		String key = e.nextElement();
		String value = request.getHeader(key);
		out.print(key+":"+value+"<br>");
	}
	out.print("<hr>");
	
	InputStream is = request.getInputStream(); // request없이 한번 받아보자!!
	byte[]b = new byte[1024];
	int size;
	String str;
	
	out.print("request로 넘어온데이터(body영역:post방식)...<br>"); 
	while((size=is.read(b))!=-1) {
		str = new String(b,0,size);
		out.print(str+"<br>");
		str = URLDecoder.decode(str, "UTF-8");
		out.print(str+"<br>");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>