<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String cp=request.getContextPath();
	request.setCharacterEncoding("utf-8");
	
	int rows=10;
	int cols=15;
	
	int width=cols*30+20*(cols/5)+30;
	if(cols/5==0)
		width-=20;
	
	String cc[]={"2:3","2:4", "5:6", "5:7", "8:2", "8:3"}; // 선택 못하게 막은 위치
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
</style>

<script type="text/javascript">
function send() {
	var f=document.forms[0];
	
	var cnt=0;
	
	//  객체가 disabled 속성을 가지고 있으면 서버로 전송되지 않는다.
	//  객체가 readonly 속성을 가지고 있으면 서버로 전송된다.
	for(var i=0; i<f.chks.length; i++) {
		if(f.chks[i].disabled)
			continue;
	
		if(f.chks[i].checked)
			cnt++;
	}
	
	if(cnt<1||cnt>4) {
		alert("좌석을 4개까지만 선택 가능합니다.");
		return false;
	}
	
	f.submit();
}
</script>

</head>
<body>

<form action="reserveEx_ok.jsp" method="post">
<table style=" margin:30px auto 5px; width:<%=width%>px;">
<tr height="30" align="center">
	<td bgcolor="#e4e4e6">스크린</td>
</tr>
</table>

<table style=" margin:0px auto 5px; width: <%=width%>px; border-spacing: 0; ">
<tr height="30" align="center">
<%
	out.print("<td width='30'>&nbsp;</td>");
	for(int i=1; i<=cols; i++) {
		if(i!=1 && i%5==1)
			out.print("<td width='20'>&nbsp;</td>"); // 중간에 공백들
		out.print("<td width='30'>"+i+"</td>");
	}
%>
</tr>
<%
	String s;
	for(int i=1; i<=rows; i++) {
		out.print("<tr height='25' align='center'>");
		out.print("<td>"+i+"</td>");
		
		for(int j=1; j<=cols; j++) {
			if(j!=1 && j%5==1)
				out.print("<td bgcolor='#e4e4e6'>&nbsp;</td>");

			s=i+":"+j;
			boolean b=false;
			for(int k=0; k<cc.length; k++) {
				if(s.equals(cc[k])) {
					b=true;
					break;
				}
			}
			
			out.print("<td>");
			if(b)
				out.print("<input type='checkbox' name='chks' value='"+s+"' checked='checked' disabled='disabled'>");
			else
				out.print("<input type='checkbox' name='chks' value='"+s+"'>");
				
			out.print("</td>");
		}
		out.print("</tr>");
	}
%>
</table>

<table style="margin:5px auto 0; width:<%=width%>px;">
<tr height="35" align="right">
	<td>
		<input type="button" value=" 좌석예약 " onclick="send();" class="btn">
	</td>
</tr>
</table>

</form>

</body>
</html>