<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function check() {
    //var f = document.myForm;
    var f = document.forms[0];
    if(f.style.length<=4) { 
       alert("4명 이하로..");
       return; // false가 리턴되면 서버로 전송이 되지 않는다.
    }  
   
    f.submit();
}
</script>


</head>
<body>
	<form name = "myForm" action="movie_ok.jsp" method="post">
	<table style="width: 800px; margin: 20px auto" >
		<tr align="center" height="30"> 
			<td bgcolor="#A6A6A6">스크린</td>
		</tr>
	</table>
	<table style="width: 800px; margin: 20px auto" >
		<tr align="center" height="30"> 
		<td width=50px>&nbsp;</td>
		<%
		for(int i=1;i<=15;i++) {
			out.println("<td width=50px>"+i+"</td>");
		}
		%>
		</tr>
	</table>
	
	<table style="width: 800px; margin: 20px auto" >
	
	<!-- <tr align="center" height="30">
		<td width=50px>&nbsp;</td> -->
		<%
		for(int j=1;j<=10;j++) {
			out.println("<tr align='center' height='30'>");
			for(int i=0;i<=15;i++) {
				if(i==0)
					out.print("<td width=50px>"+j+"</td>");
				else
					out.println("<td width=50px><input type='checkbox' name = 'style' value='"+j+","+i+"'></td>");
			}
		}
		out.println("</tr>");
		%>
		
	</table>
	<input type="button" value = "보내기" onclick="check();">
	</form>
</body>
</html>




