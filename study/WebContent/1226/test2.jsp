<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

기본 locale: <%=response.getLocale()%><br>
기본 locale: ${pageContext.response.locale}<br>

number: <fmt:formatNumber value="12345.6789" type="number"/><br>
currency: <fmt:formatNumber value="12345.6789" type="currency"/><br> 

set locale: ja<fmt:setLocale value="ja_JP"/><br>
number: <fmt:formatNumber value="12345.6789" type="number"/><br>
currency: <fmt:formatNumber value="12345.6789" type="currency"/><br> 

set locale: en<fmt:setLocale value="en_US"/><br>
number: <fmt:formatNumber value="12345.6789" type="number"/><br>
currency: <fmt:formatNumber value="12345.6789" type="currency"/><br> 

set locale: ko<fmt:setLocale value="ko_KR"/><br>
number: <fmt:formatNumber value="12345.6789" type="number"/><br>
currency: <fmt:formatNumber value="12345.6789" type="currency"/><br> 



currency: <fmt:formatNumber value="12345.6789" type="currency" currencySymbol="W"/><br>
percent: <fmt:formatNumber value="0.756" type="percent"/><br> 
number: <fmt:formatNumber value="12345.6789" pattern=".0"/><br>
number: <fmt:formatNumber value="12345.6789" pattern="#,##0.0"/><br>
number: <fmt:formatNumber value="0.6789" pattern="#,###.0"/><br>
number: <fmt:formatNumber value="0.6789" pattern="#,##0.0"/><br>
number: <fmt:formatNumber value="12345.6789" pattern="￦#,##0.0"/><br>

<c:set var = "now" value = "<%= new java.util.Date() %>" />
<fmt:formatDate value="${now}"/><br>
<fmt:formatDate value="${now}" type = "date"/><br>
<fmt:formatDate value="${now}" type = "time"/><br>
<fmt:formatDate value="${now}" type = "both"/><br>
<fmt:formatDate value="${now}" type = "both" dateStyle = "full" timeStyle="full"/><br>

</body>
</html>