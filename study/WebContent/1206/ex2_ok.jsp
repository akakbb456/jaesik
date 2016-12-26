<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String age = request.getParameter("age");
	String birth = request.getParameter("birth");
	String hak = request.getParameter("hak");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름: <%= name%><br>
패스: <%= pwd%><br>
나이: <%= age%><br>
생일: <%= birth%><br>
학력: <%= hak %><br>
</body>
</html>