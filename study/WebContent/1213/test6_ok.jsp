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

<c:forEach var="dto" items="${list}">
 ${dto.num} | ${dto.name} | ${dto.content} <br>
</c:forEach>
<br><br>

<c:forEach var="dto" items="${list}" varStatus="st">
 ${dto.num} | ${dto.name} | ${dto.content}
 | ${st.first}| ${st.last}| ${st.index}| ${st.count} <br>
</c:forEach>

</body>
</html>