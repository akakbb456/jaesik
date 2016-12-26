<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="com.guest.GuestDAO"%>

<%
	request.setCharacterEncoding("utf-8");

	GuestDAO dao=new GuestDAO();
	MyUtil util=new MyUtil();

	// 변수명 page는 JSP 예약어
	String pageNum=request.getParameter("page");
	int current_page=1;
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	
	int dataCount=dao.dataCount();
	
	int numPerPage=5;
	int total_page=util.pageCount(numPerPage, dataCount);
	
	if(current_page>total_page)
		current_page=total_page;
	
	int start=(current_page-1)*numPerPage+1;
	int end=current_page*numPerPage;
	
	List<GuestDTO> list=dao.listGuest(start, end);
	
	String listUrl="guest.jsp";
	String paging=util.paging(current_page, total_page, listUrl);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>
<style type="text/css">
*{
	margin: 0px; padding: 0px;
}
body {
	font-size: 9pt; font-family: 돋움;
}
a{
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: tomato;
}
.title {
	font-weight: bold;
	font-size:13pt;
	margin-bottom:10px;
	font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
}
.btn {
	 font-size: 12px;
	 color:#333;
 	 font-weight:500;
	 font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
	 border:1px solid #ccc;
	 background-color:#FFF;
	 vertical-align:middle;
	 text-align:text-align;
	 cursor:cursor;
	 padding:4px 8px;
	 border-radius:4px;
	 margin-bottom: 3px;
}
.btn:active, .btn:focus, .btn:hover {
	 background-color:#e6e6e6;
	 border-color: #adadad;
	 color: #333;
}
.boxTF {
	border:1px solid #999;
	padding:4px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: 나눔고딕, 맑은 고딕, 돋움, sans-serif;
	font-size: 9pt;
}
.boxTA {
	border:1px solid #999;
	height:150px;
	padding:3px 6px;
	border-radius:4px;
	background-color:#ffffff;
	font-family: 나눔고딕, "맑은 고딕", 돋움, sans-serif;
	font-size: 9pt;
}
</style>


<script type="text/javascript">
function sendGuest() {
    var f = document.guestForm;

    var str = f.name.value;
    if(!str) {
        alert("이름을 입력하세요. ");
        f.name.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "guest_ok.jsp";
    f.submit();
}

function deleteGuest(num)  {
	if (confirm("위 자료를 삭제하시겠습니까 ?")) {
		var url="delete.jsp?num="+num;
		url+="&page=<%=current_page%>";
		
		location.href=url;
	}
}
</script>

</head>

<body>

<table style="width: 560px; margin: 0px auto; margin-top: 30px; border-spacing: 0px;">
<tr height="40">
	<td align="left" class="title">
		■ 방명록
	</td>
</tr>
</table>
<br>

<form name="guestForm" method="post" action="">
  <table style="width: 560px; margin: 0px auto; border-spacing: 0px;">

  <tr><td colspan="2" height="2" bgcolor="#ccc"></td></tr>

  <tr> 
      <td width="20%" height="40" bgcolor="#eee" style="padding-left:20px;" align="left">작성자</td>
      <td width="80%" style="padding-left:10px;" align="left"> 
        <input type="text" name="name" size="35" maxlength="20" class="boxTF">
      </td>
  </tr>

   <tr><td colspan="2" height="1" bgcolor="#ccc"></td></tr>

  <tr> 
      <td width="20%" bgcolor="#eee" style="padding-left:20px; padding-top:5px;" valign="top" align="left">내&nbsp;&nbsp;용</td>
      <td width="80%" valign="top" style="padding:5px 0px 5px 10px;" align="left"> 
        <textarea name="content" cols="72" rows="12" class="boxTA" style="height: 70px;"></textarea>
      </td>
  </tr>

  <tr><td colspan="2" height="1" bgcolor="#ccc"></td></tr>
  </table>

  <table style="width: 560px; margin: 0px auto; border-spacing: 0px;">
     <tr align="right"> 
      <td height="45">
        <input type="button" value=" 등록하기 " onclick="sendGuest();" class="btn">
      </td>
    </tr>
  </table>
</form>

<table style="width: 560px; margin: 10px auto 0px; table-layout:fixed; word-break:break-all; border-spacing: 0px;">
<%
	for(GuestDTO dto : list) {
%>
		<tr><td colspan='2' bgcolor='#ccc' height='2'></td></tr>
		<tr height="30"><td width='260' style='padding-left:10px;' align="left">
		              작성자 | <%=dto.getName()%>
		       </td>
		       <td width='300' align='right' style='padding-right:10px;'>
			          <%=dto.getCreated()%>  | <a href="javascript:deleteGuest('<%=dto.getNum()%>');">삭제</a>
		       	</td>
		 </tr>
		 <tr><td colspan='2' bgcolor='#ccc' height='1'></td></tr>

		 <tr><td colspan='2' height='50' valign="top" style='white-space: pre;  padding:5px 10px 5px 10px;' align="left"><%=dto.getContent() %></td></tr>
<%
	}
%>
		<tr><td colspan='2' bgcolor='#ccc' height='1'></td></tr>

        <tr height="35">
              <td colspan="2" align="center">
                 <%=paging%>
              </td>
        </tr>
</table>

</body>
</html>
