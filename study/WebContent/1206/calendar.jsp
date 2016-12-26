<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> <!-- 공백을 제거!! -->
<!-- 1년 1월 1일: 월요일
29: 년도가 4의 배수이고 100의 배수가 아니거나 400의 배수
28 -->
<%
	request.setCharacterEncoding("utf-8");
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;

	String sy=request.getParameter("year");
	String sm = request.getParameter("month");
	
	if(sy!=null)
		year=Integer.parseInt(sy);
	if(sm!=null)
		month=Integer.parseInt(sm);
	
	cal.set(year, month-1,1);  // year년 month월 1일 (12월 위로 더이상 나오지 않음..왜??)
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int week=cal.get(Calendar.DAY_OF_WEEK); // 1~7로 나옴
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="width: 210px; margin: 20px auto 10px" >  
<!-- margin: 20px auto --객체를 가운대로 보내도록 설정하는법! -->
<!-- 4개: margin은 12시, 3시, 6시, 9시방향 순서대로 설정 -->
<!-- 2개: margin은 왼쪽, 오른쪽 -->
<!-- 3개: margin은 위, 양옆, 밑에 -->
<tr align="center" height="30"> <!-- 행을 만든다!! -->
	<td> <!-- 열을 만든다!! -->
		<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a> <!-- a태그: 링크를 만드는 태그! -->
		<%=year %>年<%=month %>月
		<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▶</a> 
	</td>
</tr>
</table>

<table style="width: 210px; margin: 10px auto; border-collapse: collapse;" 
		border="1">  
		
<tr height="30" align="center">
	<td bgcolor="#e4e4e6" style="color:red;">일</td>
	<td bgcolor="#e4e4e6">월</td>
	<td bgcolor="#e4e4e6">화</td>
	<td bgcolor="#e4e4e6">수</td>
	<td bgcolor="#e4e4e6">목</td>
	<td bgcolor="#e4e4e6">금</td>
	<td bgcolor="#e4e4e6" style="color:blue;">토</td>
</tr>

<%
	int col=0;

	out.print("<tr height='30' align='center'>");
	// 1일 앞 공백처리
	for(int i=1;i<week;i++){
		out.print("<td>&nbsp;</td>");
		col++;
	}
	
	String color;
	int e = cal.getActualMaximum(Calendar.DATE);
	for(int i=1;i<=e;i++) {  // 해당되는 날짜의 최대값~(그 달의 마지막 날까지!!)
		color=col==0?"red":(col==6?"blue":"black");
		out.print("<td style='color:"+color+";'>"+i+"</td>");
		col++;
		if(col==7&&i!=e) {
			out.print("</tr>");
			out.print("<tr height='30' align = 'center'>");
			col=0;
		}
	}
	
	//마지막 날짜 다음 처리
	while(col>0&&col<7) {
		out.print("<td>&nbsp;</td>");
		col++;
	}
	out.print("</td>");
	
%>


</table>


</body>
</html>