<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	// forward 된 경우에는 request,response객체가 그대로 넘어옵니다.
	 
	// 파라미터를 받습니다!!!
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	
	// setAttribute한 정보!!
	String s = (String)request.getAttribute("msg"); // getAttribute의 리턴타입은 object형!
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
클라이언트 주소에는 이 페이지의 주소가 노출되지 않는다.<br>
이름: <%=name%><br>
나이: <%=age%><br>
<%=s%>
</body>
</html>