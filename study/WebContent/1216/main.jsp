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
<c:if test="${empty sessionScope.id}">
	<a href="login.jsp">로그인</a>|
	<a href="#">회원가입</a>|
</c:if>

<c:if test="${not empty sessionScope.id}">
	 ${sessionScope.name}님|
	 <a href="logout.jsp">로그아웃</a>
</c:if>
<br>
메인화면 <br>

<a href="info.jsp">세션정보</a>
</body>
</html>