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


<c:out value="<b>안녕</b>" escapeXml="false"/>
<hr>

<c:import url = "user.jsp" var = "url"/>  
소스화면...<br>
<c:out value = "${url }"/>
<hr>

결과화면...<br>
<c:out value = "${url }" escapeXml="false"/>
<hr>

<c:import url = "http://www.google.com" var = "url"/>
<c:out value="${url }" escapeXml="false"/>

<c:import url = "http://www.naver.com" var = "url"/>
<c:out value="${url }" escapeXml="false"/>
</body>
</html>