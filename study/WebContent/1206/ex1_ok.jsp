<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	Map<String, String[]> map = request.getParameterMap();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Iterator<String> it = map.keySet().iterator();

	while(it.hasNext()) {
		String key = it.next();
		String [] ss = map.get(key);
	
		if(ss!=null) {
			for(String s:ss) {
				out.print(key+":"+s+" ");
			}
			out.print("<br>");
		}
	}
	
%>



</body>
</html>