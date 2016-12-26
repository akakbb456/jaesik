<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.test.TestVO"/> <!-- useBean: 객체를 생성하는것과 유사한 성격을 지닌 태그 -->
<jsp:setProperty property="*" name="vo"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름: <%=vo.getName() %> <br>
내용: <%=vo.getContent().replaceAll("\n", "<br>") %>
</body>
</html>