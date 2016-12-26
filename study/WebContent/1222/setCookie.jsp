<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	// 쿠키설정
	
	Cookie c1 = new Cookie("subject", "JAVA");
	c1.setMaxAge(60*60); // 유지시간 단위: 초
	response.addCookie(c1); // 쿠키를 클라이언트 컴퓨터에 저장
	
	// 한글은 반드시 인코딩이 필요
	Cookie c2 = new Cookie("city", URLEncoder.encode("서울", "UTF-8"));
	c2.setMaxAge(-1); // 브라우저가 종료되면 제거(기본)
	response.addCookie(c2);
	
	
	Cookie c3 = new Cookie("tel","010-1111-1111");
	c3.setPath("/"); // 모든 경로에서 쿠키접근 가능.
	 				 // 쿠키는 기본적으로 설정한 폴더에서만 접근가능
	response.addCookie(c3);
	
	Cookie c4 = new Cookie("age","20");
	c4.setMaxAge(0); // 쿠키생성과동시에 제거
	response.addCookie(c4);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>쿠키 설정 완료</h3>
<a href = "cookieTest.jsp">돌아가기</a>







</body>
</html>