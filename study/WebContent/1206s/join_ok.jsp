<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- 이름:     <input type="text" name="name"><br>
	생년월일: <input type="date" name="birth"><br>
	전화번호: <input type="text" name = "tel"><br>
	기본급:   <input type="number" name = "pay"><br>
	수당:     <input type="number" name = "sudang"><br> -->
<%
	Calendar cal = Calendar.getInstance();
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String _pay = request.getParameter("pay");
	String _sudang = request.getParameter("sudang");

	int pay = Integer.parseInt(_pay);
	int sudang = Integer.parseInt(_sudang);
	int realPay = pay+sudang;
	int age = Integer.parseInt(cal.get(Calendar.YEAR)+"")-Integer.parseInt(birth.substring(0,4));
	//int age2 = cal.getTimeInMillis()-birth2.getTimeInMillis();
	double tax = 0;
	if(realPay>=2000000)
	{
		tax = realPay*0.02;
	 	if(realPay>=3000000)
	 		tax = realPay*0.03; 
	}
	
	int rrealPay = realPay-(int)tax;
	
	double dd = 213321413;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름: <%= name%><br>
생일: <%= birth%><br>
띠: <br>
생년월일: <%= birth%><br>
나이: <%=age+1 %> <br>
전화번호:<%=tel %><br>
기본급: <%= pay%><br>
수당: <%= sudang%><br>
세금:<%= tax %><br>
실급여:<%=rrealPay %><br>
</body>
</html>