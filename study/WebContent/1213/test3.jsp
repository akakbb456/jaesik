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
<title>jstl이 뭔지 확인해보자!</title>
</head>
<body>
	<form method="post">
	  수: <input type="text" name="num">
	  <input type="submit" value="확인"> <br>
	</form>
	
	<c:if test="${not empty param.num}"> <!-- 파라미터로 넘어온 데이터가 있으면!! -->
		<c:choose>
		 <c:when test="${param.num%12==0 }">
		  ${param.num }은 3과 4의 배수입니다.
		 </c:when>
		 <c:when test="${param.num%4==0 }">
		  ${param.num }은 4의 배수입니다.
		 </c:when>
		 <c:when test="${param.num%3==0 }">
		  ${param.num }은 3의 배수입니다.
		 </c:when>
		 <c:otherwise>
		  ${param.num }은 3 또는 4의 배수가 아닙니다.
		 </c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>                   