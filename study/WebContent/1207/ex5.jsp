<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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

<h3>  순서 없이 나열  </h3>

<ul>
		<li>자바</li>
		<li>안드로이드</li>
		<li>CSS</li>
		<li>스프링</li>
</ul>

<br>

<ul style="list-style: square;">
		<li>자바</li>
		<li>안드로이드</li>
		<li>CSS</li>
		<li>스프링</li>
</ul>
<br>

<ul style="list-style: none;">
		<li>자바</li>
		<li>안드로이드</li>
		<li>CSS</li>
		<li>스프링</li>
</ul>

<br>

<ul style="padding: 0">
		<li>자바</li>
		<li>안드로이드</li>
		<li>CSS</li>
		<li>스프링</li>
</ul>
<br>

<h3> 순서 있게 나열</h3>

<ol style="list-style: upper-roman;" start="1">   <!-- 안에 숫자는 몇번째 부터인지 -->
		<li>자바</li>
		<li>안드로이드</li>
		<li>CSS</li>
		<li>스프링</li>
</ol>

<br>
<ol style="list-style: upper-alpha;" start="1">
		<li>자바</li>
		<li>안드로이드</li>
		<li>CSS</li>
		<li>스프링</li>
</ol>

<h3>목록 나열</h3>
<dl>
	<dt>과목</dt>
	<dd>자바</dd>
	<dd>스프링</dd>
	<dd>웹</dd>
</dl>



</body>
</html>