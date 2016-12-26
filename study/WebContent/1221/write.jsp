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
<title>파일 업로드!!</title>
</head>
<body>
<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
	제목: <input type="text" name="subject"><br>
	파일: <input type="file" name="file"><br>
	<button>등록하기</button>	
</form>
</body>
</html>