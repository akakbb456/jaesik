<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name=(String)request.getAttribute("name");
	int age=(Integer)request.getAttribute("age");
	String tel=(String)request.getAttribute("tel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름: <%=name%><br>
나이: <%=age%><br>
전화: <%=tel%><br>
<hr>

이름: ${name}<br>
나이: ${age}<br>
전화: ${tel}<br>
<hr>
${dto.num }<br>
${dto.name }<br>
${dto.content }<br> <!-- 대소문자 구분한다!! -->
</body>
</html>

