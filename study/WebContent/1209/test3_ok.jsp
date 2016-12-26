<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));

String result="성인";

if(age<19)
 result="미성년장";

request.setAttribute("msg", result); // test3_result로 보내기 위해 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

이부분은 출력되지 않습니다/.<br>

<jsp:forward page="test3_result.jsp"/>

</body>
</html>