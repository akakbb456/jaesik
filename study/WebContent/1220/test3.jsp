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


<form action="test3_ok.jsp" method="post" enctype="multipart/form-data">
제목: <input type="text" name="subject"><br>
파일: <input type="file" name="upload"><br>
<input type="submit" value="등록하기">
</form>



</body>
</html>