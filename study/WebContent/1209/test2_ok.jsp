<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	String protocol=request.getProtocol();
	String serverName=request.getServerName();
	int serverPort=request.getServerPort();
	String ip = request.getRemoteAddr();
	String method=request.getMethod();
	String cp = request.getContextPath();
	String uri=request.getRequestURI();
	StringBuffer url = request.getRequestURL();
	String browser = request.getHeader("User-Agent");
	String referer = request.getHeader("Referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	프로토콜: <%=protocol%> <br>
	서버이름: <%=serverName%><br>
	포트: <%=serverPort%><br>
	클라이언트아이피: <%=ip%><br>
	메소드: <%=method%><br>
	cp: <%=cp%><br> <!-- study!! 프로젝트 명!! 사이트 이름!! -->
	uri: <%=uri%><br> <!-- cp부터 끝까지!! -->
	url: <%=url%><br> <!-- 사이트 주소 -->
	browser: <%=browser%><br>
	referer: <%=referer%><br> <!-- 전 사이트? -->
	
</body>
</html>