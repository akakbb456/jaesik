<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.calc.CalcVO"/> <!-- useBean: 객체를 생성하는것과 유사한 성격을 지닌 태그 -->
<jsp:setProperty property="*" name="vo"/> 
<!-- setProperty: 클라이언트가 보낸 정보를 받는 get파라미터 역할을 수행한다 -->
<!-- useBean의 id와 setProperty의 name은 일치해야한다 -->
<!-- property는 test5.jsp의 <input type="text" name = "num1">에서 name을 CalcVO의 같은 이름의 변수를 찾아서 적용한다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=vo.getNum1()%>
<%=vo.getOper()%>
<%=vo.getNum2()%> =
<%=vo.result()%>
</body>
</html>