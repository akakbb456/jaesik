<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 지시어, 디렉티브 -->
    
<%
    Calendar cal = Calendar.getInstance(); /* lang패키지는 컴파일러가 임포트를 해준다! 하지만 util은 임포트 해줘야함 */
	
    String s = String.format("%tF %tT", cal, cal); 
    // String의 format이라는 메소드로 서식에 맞추어서 해당 내용을 변환해서 문자열로 리턴할때 사용한다.
    
    
%>  <!-- 자바를 코딩하는 방법!! -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
</head>
<body>
 하이용!!!!!~<br>
 
 지금은 <%= s%> 입니다.


</body>
</html>