<%@page import="com.tag.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<%@ taglib prefix="p" uri="/WEB-INF/paginate.tld" %>
<%
	request.setCharacterEncoding("UTF-8");

	List<User> list = new ArrayList<>();
	list.add(new User("자바",20));
	list.add(new User("스프링",20));
	list.add(new User("서블릿",20));
	list.add(new User("모바일",20));
	
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<my:hello/><br>
<hr>
1에서 100까지의 합: <my:sum num="100"/> <br>

<hr>
구구단: <br><my:gugu num="5"/> <br>

<hr>
<my:body>자바</my:body>

<hr>
<c:forEach var="a" begin="1" end="3" step="1">${a}</c:forEach>
<hr>
<my:forEach var="a" begin="1" end="3" step="1">${a}</my:forEach>
<hr>

<my:forEach2 items="${list}" var="vo">
${vo.name}|${vo.age}<br>
</my:forEach2>
<hr>
<p:page total_page="250" uri="exTag1.jsp" current_page="3"/>

</body>
</html>