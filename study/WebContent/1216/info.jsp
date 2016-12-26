<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	
	int inter=session.getMaxInactiveInterval();
	String id = session.getId();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:dd");
	Date date1= new Date(session.getCreationTime());
	Date date2= new Date(session.getLastAccessedTime());
	
	String s1=sdf.format(date1);
	String s2=sdf.format(date2);
	
	String userId=(String)session.getAttribute("id");
	String userName=(String)session.getAttribute("name");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
세션아이디: <%=id %> <br>  <!-- 각각의 사용자를 구분해주는 식별자(모든사람이 다르다) -->
세션생성일자: <%=s1 %><br>
세션마지막접속일자: <%=s2 %><br>
세션유지시간: <%=inter/60 %>분<br>
<br>
세션에 저장된 내용.....<br>

아이디: <%=userId %><br>
아이디: ${sessionScope.id }<br>
이름: <%=userName %><br>
이름: ${sessionScope.name }<br>

<a href="main.jsp">돌아가기</a><br>
</body>
</html>