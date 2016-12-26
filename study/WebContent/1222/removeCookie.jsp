<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");

	Cookie c1 = new Cookie("subject", null);
	c1.setMaxAge(0);
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("city", null);
	c2.setMaxAge(0);
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("tel", null);
	c3.setMaxAge(0);
	c3.setPath("/");
	response.addCookie(c3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>쿠키제거 완료</h4>
<a href="cookieTest.jsp">돌아가기</a>


</body>
</html>