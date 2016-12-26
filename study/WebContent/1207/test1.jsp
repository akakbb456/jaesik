<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
console.log("예제...");  /* console.log는 익스플로러9부터 작동한다 */ // 대부분 로그를 남기기 위해 사용한다

var a;
a=typeof("java");
document.write(a); // string(자료형 출력)

a=typeof(123);
document.write("<br>"+a); //number

a=typeof(true);
document.write("<br>"+a); // boolean

a=typeof(function(){});
document.write("<br>"+a); // function

a=typeof({});
document.write("<br>"+a); //object(객체)

a=typeof(null);
document.write("<br>"+a); // object

var b;
document.write("<br>"+b); // undefined(정의되지 않음)
document.write("<br>"+typeof(b));

</script>
</head>
<body>

</body>
</html>