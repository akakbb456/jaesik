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
<form action="login_ok.jsp" method="post">
아이디: <input type="text" name="id"><br>
패스워드: <input type="password" name="pwd"><br>
<input type="submit" value="로그인">
</form>

</body>
</html>