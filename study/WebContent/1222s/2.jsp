<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	Cookie c1 = new Cookie("subject2", "태블릿");
	c1.setMaxAge(60*60); // 유지시간 단위: 초
	response.addCookie(c1); // 쿠키를 클라이언트 컴퓨터에 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="shoop.jsp">돌아가기</a>
</body>
</html>