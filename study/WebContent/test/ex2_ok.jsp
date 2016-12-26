<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이름: <input type="text" name = "name"><br>
패스워드: <input type="password" name = "pwd"><br>
나이: <input type="text" name = "age"><br>
성별: <input type="radio" name = "gender" value="M"> 남자
	  <input type="radio" name = "gender" value="F"> 여자 <br>
이상형: <input type="checkbox" name = "style" value="이이이"> 이이이
		<input type="checkbox" name = "style" value="가가가"> 가가가
		<input type="checkbox" name = "style" value="나나나"> 나나나
		<input type="checkbox" name = "style" value="무무무"> 무무무
		<input type="checkbox" name = "style" value="후후후"> 후후후 <br>
 -->
<% 
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	// String style = request.getParameter("style");
	String [] ss = request.getParameterValues("style");
	String s = "";
	if(ss!=null) {
		for(String n:ss)
		{
			s+=n+" ";
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
이름: <%= name %> <br>
패스워드: <%= pwd %> <br>
나이: <%= age %> <br>
성별: <%= gender %> <br>
이상형: <%= s %> <br>
</body>
</html>