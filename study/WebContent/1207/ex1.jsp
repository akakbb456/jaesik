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

<h1> 제목1 </h1>   <!-- 제목 글자 크기 -->
<h2> 제목2 </h2>
<h3> 제목3 </h3>
<h4> 제목4 </h4>
<h5> 제목5 </h5>
<h6> 제목6 </h6>

<p>문단1</p>  <!-- 문단 간격 -->
<p>문단1</p>

<hr>   <!-- 선그리기 -->

<p>우     리</p> <!-- 띄어쓰기는 무조건 한번만 적용된다. -->
<p>우&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;리</p>



<pre> <!-- 자유롭게 작성이 가능 -->
우리       나라
대한민국
</pre>


</body>
</html>