<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String [] seat = request.getParameterValues("style");
	String s= "";
	if(seat!=null) {
		for(String n:seat)
		{
			s+=n+"좌석<br>";
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= s %><br>
예약 완료!!
</body>
</html>