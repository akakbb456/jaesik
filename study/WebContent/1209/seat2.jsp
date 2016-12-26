<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();

	request.setCharacterEncoding("utf-8");
	
	int rows=0, cols=0;
	try{
		rows=Integer.parseInt(request.getParameter("rows"));
		cols=Integer.parseInt(request.getParameter("cols"));
	}catch(Exception e) {
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-size: 9pt;
	font-family: 맑은 고딕, 돋움;
}
.btn {
	 font-size: 12px;
	 color:#333;
 	 font-weight:500;
	 font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
	 border:1px solid #ccc;
	 background-color:#FFF;
	 vertical-align:middle;
	 text-align:text-align;
	 cursor:cursor;
	 padding:4px 8px;
	 border-radius:4px;
	 margin-bottom: 3px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333;
}
.boxTF {
	border:1px solid #999;
	padding:4px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
	font-size: 9pt;
}
</style>

<script type="text/javascript">
function check() {
	var f=document.forms[0];
	
	if(f.chks==undefined) {
		return false;
	}
	
	var cnt=0;
	for(var i=0; i<f.chks.length; i++) {
		if(f.chks[i].checked)
			cnt++;
	}
	
	if(cnt<1||cnt>4) {
		alert("좌석은 1~4개만 예약 가능 합니다.");
		return false;
	}
	
	f.action="seat3.jsp";
	f.submit();
}
</script>

</head>
<body>

<form method="post">
	<table  
	        style="width:<%=cols*30+20*(cols/5)+30%>px; margin: 35px auto 0; border-spacing: 0; ">
	<tr height="30" bgcolor="#e4e6e4">
		<td align="center">스크린</td>
	</tr>
	</table>

	<table  
	        style="width:<%=cols*30+20*(cols/5)+30%>px; margin: 5px auto 0; border-spacing: 0; ">
	<tr height="30">
    <%
		out.println("<td width='30'>&nbsp;</td>");
    	for(int i=1; i<=cols; i++) {
    		if(i!=1 && i%5==1)
    			out.println("<td width='20'>&nbsp;</td>");
    		out.println("<td width='30' align='center'>"+i+"</td>");
    	}
    %>
	</tr>
	
	<%
		String str;
		for(int i=1; i<=rows; i++) {
			out.println("<tr height='25'>");
			out.println("<td width='30'>"+i+"</td>");
			for(int j=1; j<=cols; j++) {
	    		if(j!=1 && j%5==1)
	    			out.println("<td width='20'>&nbsp;</td>");
	    		out.println("<td width='30' align='center'>");
	    		str=i+":"+j;
	    		out.println("<input type='checkbox' name='chks' value='"+str+"'>");
				out.println("</td>");
			}
			out.println("</tr>");
		}
	%>
	
	<tr height="35">
		<td align="right" colspan="<%=cols+(cols/5)%>">
		<input type="button" value=" 좌석예약 " onclick="check();" class="btn">
		</td>
	</tr>
	
	</table>
	
</form>

         
</body>
</html>