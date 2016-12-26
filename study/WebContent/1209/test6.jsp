<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<form action="test6_ok.jsp" method="post">
 이름: <input type="text" name = "name"><br>
 내용: <textarea rows="5" cols="30" name="content"></textarea><br>
 <input type="submit" value = "보내기">
 <input type="reset" value = "다시입력">
</form>
</body>
</html>