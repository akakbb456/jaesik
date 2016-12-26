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

<c:set var = "s" value="1"/>
<c:forEach var="n" begin="1" end="10">
	<c:set var="s" value="${s*2 }"/>
</c:forEach>
2의 10승은 ${s }입니다.

<br>
<c:forEach var="n" begin="1" end="9">
  3*${n} = ${3*n }<br>
</c:forEach>




</body>
</html>