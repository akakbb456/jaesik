<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!	// 선언부(필드, 맴버변수, 인스턴스 변수): 스크립트 릿이나 표현식에서 사용할 수 있는 함수 작성 시 사용
	int a; 

	public int sum(int n) { // 이런 연산은 JSP가 아닌 JAVA에서 하는것이 좋다!!
		int s = 0;
		for(int i=1; i<=n; i++)
			s+=i;
		return s;
	}
%>
    
<% // 스크립트 릿: JSP에 자바코드를 기술, service메소드안에 있으므로 새로고침 할 때마다 실행된다.
	int b=0;

	a++;
	b++;
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

a: <%=a %> <br> <!-- 표현식: HTML문서 결과 값에 포함시키고자 할 때 사용 -->
b: <%=b %> <br>	

합: <%=sum(100) %> <br>



</body>
</html>