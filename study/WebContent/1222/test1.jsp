<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%-- <%@ page errorPage="error.jsp" %> --%> <!-- 해당링크로 에러를 띄웁니다! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	int age = Integer.parseInt(request.getParameter("age"));
	String s = "성인";
	if(age<19){
		s = "미성년자";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=s %>
</body>
</html>