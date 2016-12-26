<%@page import="java.net.URLDecoder"%>
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
<a href="1.jsp">노트북</a><br>
<a href="2.jsp">태블릿</a><br>
<a href="3.jsp">스마트폰</a><br>

<h4>설정된 쿠키...</h4>
<%
	Cookie[]cc = request.getCookies();
	String key, value;
	if(cc!=null) {
		for(Cookie c:cc) {
			key = c.getName();
			value = c.getValue();
			if(key.equals("city"))
				value=URLDecoder.decode(value, "UTF-8");
			out.print(key+":"+value+"<br>");
		}
	}
%>
</body>
</html>