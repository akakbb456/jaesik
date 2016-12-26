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
<title>자바 빈즈</title>
</head>
<body>
<form action="test5_ok.jsp" method="post">
 <input type="text" name = "num1">
 <select name = "oper">
 	<option value="add">더하기</option>
 	<option value="sub">빼기</option>
 	<option value="mul">곱하기</option>
 	<option value="div">나누기</option>
 </select>
 <input type="text" name = "num2">
 <input type="submit" name = "=">
</form>
</body>
</html>