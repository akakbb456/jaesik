<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	out.println("request로 넘어온 데이터 ...<br>");
	BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(),"ISO-8859-1"));
	String str;
	while((str=br.readLine())!=null) {
		out.print(new String(str.getBytes("ISO-8859-1"),"utf-8"));
	}
%>


</body>
</html>