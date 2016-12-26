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
<style type="text/css">
*{font-family: 굴림;
 
  margin: 0px; padding: 0px}
  div{
font-size: 15pt;
}

#box{
width: 400px;
margin: 10px auto;
}

.row{
border-bottom: 1px solid #ccc;
height: 30px;
}

.row dt, .row dd{
float: left;
width: 100px;
height: 30px;
text-align: center;
line-height: 30px
}
</style>



</head>
<body>

<div id="box">
	<dl class="row" style="border-top: 1px solid #ccc;">
		<dt>이름</dt>
		<dt>국어</dt>
		<dt>영어</dt>
		<dt>수학</dt>
	</dl>
	
	<dl class="row">
		<dd>홍길동</dd>
		<dd>80</dd>
		<dd>90</dd>
		<dd>70</dd>
	</dl>
	<dl class="row">
		<dd>박길동</dd>
		<dd>81</dd>
		<dd>91</dd>
		<dd>71</dd>
	</dl>
	<dl class="row">
		<dd>김길동</dd>
		<dd>88</dd>
		<dd>99</dd>
		<dd>77</dd>
	</dl>
</div>

</body>
</html>