<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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

<h1> redirect 예제</h1>

<form action="test4_ok.jsp" method="post">
이름  : <input type="text" name="name"><br>
나이  : <input type="text" name="age"><br>
<input type="submit" value="확인">
</form>

</body>
</html>