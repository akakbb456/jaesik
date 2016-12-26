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

<h3> div 태그 예제</h3>
<div style="background: red">A</div>
<div style="background: blue">B</div><br>

<div style="border: 1px solid red;">C</div><br>

<div style="border: 1px solid blue; width: 500px; height: 50px; padding: 10px;">
<div style="background: red; width: 300px; height: 50px; float: left;"></div>
<div style="background: green; width: 200px; height: 50px; float: left;"></div>
</div>

<br>
border, padding, margin도 width, height에 포함 되어야 한다!!
<div style="border: 1px solid blue; width: 504px; height: 50px;">
<div style="border: 1px solid red; width: 300px; height: 50px; float: left;"></div>
<div style="border: 1px solid green; width: 200px; height: 50px; float: left;"></div>
</div>

<br>
<div style="border: 1px solid blue; width: 504px; height: 50px;">
<div style="background: green; width: 100px; height: 50px; float: right;"></div>
<div style="background: red; width: 100px; height: 50px; float: right;"></div>

<br>
<br>

<br>
<!-- <div style="border: 1px solid blue; width: 500px; height: 500px;">
<div style="background: green; width: 500px; height: 50px; float: right;"></div>
<div style="background: black; width: 50px; height: 20px; float: left;"></div>
<div style="background: yellow; width: 450px; height: 20px; float: left;"></div>

<div style="background: red; width: 50px; height: 60px; float: left;"></div>
<div style="background: gray; width: 450px; height: 380px; float: left;"></div>
<div style="background: blue; width: 50px; height: 450px; "></div>
<div style="background: black; width: 500px; height: 50px; "></div> -->

<div style="width: 800px;">
<div style="background: black; height: 50px;"></div>

<div>
	<div style="background: green; height: 30px; width: 100px; float: left;"></div>
	<div style="background: blue; height: 30px; width: 700px; float: left;"></div>
</div>

<!-- <div>
	<div>
		<div style="float: left; width: 100px">
		<div style="height: 50; background: gray"></div>
		<div style="height: 450; background: red"></div>
		</div>
		
	</div>
	
	<div style="float: left; width: 700px; height: 500px;"></div>
</div>

<div>
	<div style="background: green; height: 30px; width: 100px; float: left;"></div>
</div> -->


<div style="background: black; height: 100px; width: 700px"></div>

   <div style="width: 700px; height: 50px;">
      <div style="background: orange; width: 150px; height: 50px; float: left;"></div>
      <div style="background: yellow; width: 550px; height: 50px; float: right;"></div>
   </div>
   
   <div style=" width:700px; height:500px;">  
      <div style="width:150px; height:500px; float:left">
         <div style="background: red; width: 150px; height: 150px; float: top;"></div>
         <div style="background: purple; width: 150px; height: 350px; float: bottom;"></div>
      </div>
      <div style=" background: lightgray; width:550px; height:500px; float: right"></div>      
   </div>
   
   <div style="background: blue; height: 50px; width: 700px"></div>
</body>
</html>