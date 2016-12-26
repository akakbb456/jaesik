<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.NumberFormat"%>
<%
	request.setCharacterEncoding("utf-8");

    // 1 (닭)  2(개)  3(돼지)  4(쥐)  5(소)  6(호랑이)  7(토끼 )  8(용)  9(뱀)  10(말)  11(양)  12(원숭이)
	String []tt={"원숭이", "닭","개","돼지","쥐","소","호랑이","토끼","용","뱀","말","양"};

	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String phone=request.getParameter("phone");
	int pay=Integer.parseInt(request.getParameter("pay"));
	String _sudang=request.getParameter("sudang");
	int sudang=0;
	if(_sudang.length()!=0)
		sudang=Integer.parseInt(_sudang);
	
	int y=Integer.parseInt(birth.substring(0, 4));
	int m=Integer.parseInt(birth.substring(5, 7));
	int d=Integer.parseInt(birth.substring(8, 10));
	
	int idx=y%12;
	String t=tt[idx];
	
	int tpay=pay+sudang;
	int tax=0;
	if(tpay>=3000000) {
		tax=(int)(tpay*0.03);
	}else if(tpay>=2000000) {
			tax=(int)(tpay*0.02);
	} 
	int spay=tpay-tax;

	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
	Calendar cal=Calendar.getInstance();
    cal.set(Calendar.YEAR, y);
    cal.set(Calendar.MONTH, m-1);
    cal.set(Calendar.DATE, d);
    
    Calendar now = Calendar.getInstance ();
    
    int age = now.get(Calendar.YEAR) - cal.get(Calendar.YEAR);
    if ( (cal.get(Calendar.MONTH) > now.get(Calendar.MONTH))
            || (cal.get(Calendar.MONTH) == now.get(Calendar.MONTH) 
              && cal.get(Calendar.DAY_OF_MONTH) > now.get(Calendar.DAY_OF_MONTH))) {
        age--;
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
</style>

</head>
<body>

<table border="1" style="width: 400px; margin:30px auto 5px; border-spacing: 0px;border:1px solid #cccccc; border-collapse: collapse;">
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">이름</td>
	   <td width="300" style="padding-left: 10px">
	         <%=name%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">생년월일</td>
	   <td width="300" style="padding-left: 10px">
	         <%=birth%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">띠</td>
	   <td width="300" style="padding-left: 10px">
	         <%=t%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">나이</td>
	   <td width="300" style="padding-left: 10px">
	         <%=age%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">전화번호</td>
	   <td width="300" style="padding-left: 10px">
	         <%=phone%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">기본급</td>
	   <td width="300" style="padding-left: 10px">
	         <%=nf.format(pay)%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">수당</td>
	   <td width="300" style="padding-left: 10px">
	         <%=nf.format(sudang)%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">세금</td>
	   <td width="300" style="padding-left: 10px">
	         <%=nf.format(tax)%>
	   </td>
	</tr>
	<tr height="25">
	   <td width="100" align="right" style="padding-right: 5px">실급여</td>
	   <td width="300" style="padding-left: 10px">
	         <%=nf.format(spay)%>
	   </td>
	</tr>
</table>

</body>
</html>