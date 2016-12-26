<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");

	int cnt=Integer.parseInt(request.getParameter("cnt"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int []num=new int[6];
	
	Random rnd=new Random();
	for(int n=1; n<=cnt; n++) {
		
		for(int a=0; a<num.length; a++) {
			num[a]=rnd.nextInt(45)+1;
			for(int b=0; b<a; b++) {
				if(num[a]==num[b]) {
					a--;
					break;
				}
			}
		}
		
		Arrays.sort(num);
		
		out.print(n+"번째 : ");
		for(int a=0; a<num.length; a++) {
			out.print(num[a]+" ");
		}
		out.print("<br>");
	}

%>

</body>
</html>