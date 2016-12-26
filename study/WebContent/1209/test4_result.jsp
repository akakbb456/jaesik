<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");

	// redirect 된 경우에는 request,response객체가 초기화됩니다. 따라서 아래값은 모두 NULL!!!!
	 
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
클라이언트 주소에는 이 페이지의 주소로 표시된다.<br>
이름: <%=name%><br>
나이: <%=age%><br>
<%=s%>
</body>
</html>