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
font-size: 10pt;
}

#box{
width: 700px;
margin: 10px auto;
}

.row{
border-bottom: 1px solid #ccc;
height: 30px;
}

.row dt, .row dd{
float: left;
width: 100%;
height: 30px;
text-align: center;
line-height: 30px

}

.row dt.num, .row dt.jo,.row dd.num, .row dd.jo {
width: 50px;
}

.row dt.title,.row dd.title {
width: 300px;
text-align: left;
}

.row dt.editer, .row dt.day,.row dd.editer, .row dd.day {
width: 150px;
}



</style>



</head>
<body>


<h3 style="margin: 0px 370px auto"><img src = "../img/arrow.png"> 게시판</h3>

<select name="search" style="margin: 0px 5px 0px 370px">
    <option value="제목" selected="selected">제목</option>
    <option value="작성자">작성자</option>
</select>

<input type="search">

<input type="submit" value="검색" name = "search">
<input type="submit" value="글쓰기" name = "edit" style="margin: 0px 5px 0px 390px">

<div id="box">
	<dl class="row"  style="background: #507CD1;">
		<dt class="num" style="color:white;">번호</dt>
		<dt class="title" style="color:white; text-align: center;">제목</dt>
		<dt class="editer" style="color:white;">작성자</dt>
		<dt class="day" style="color:white; ">작성일</dt>
		<dt class="jo" style="color:white; ">조회수</dt>
	</dl>
	
	<dl class="row">
		<dd class="num" >2</dd>
		<dd class="title" >제목2...</dd>
		<dd class="editer" >스프링</dd>
		<dd class="day" >2015-10-10</dd>
		<dd class="jo" >10</dd>
	</dl>
	
	<dl class="row">
		<dd class="num" >1</dd>
		<dd class="title">제목1...</dd>
		<dd class="editer" >홍길동</dd>
		<dd class="day" >2015-10-10</dd>
		<dd class="jo" >5</dd>
	</dl>
</div>

</body>
</html>