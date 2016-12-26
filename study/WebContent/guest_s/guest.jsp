<%@page import="com.util.MyUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.guest.GuestDAO"%>
<%@page import="com.guest.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	GuestDAO dao = new GuestDAO();
	MyUtil util = new MyUtil();
	String pageNum=request.getParameter("page");
	int current_page=1; // 넘어온 파라미터가 없으면 1페이지 출력
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	int dataCount;
	int numPerPage=10;
	dataCount=dao.dataCount(); 
	int total_page;
	total_page=util.pageCount(numPerPage, dataCount);
	
	
	if(current_page>total_page)
		current_page = total_page;
	int start=(current_page-1)*numPerPage+1; // 5면 41
	int end = current_page*numPerPage; // 5면 50
	List<GuestDTO> list = dao.listGuest(start, end);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function deleteScore(num) {
	if(confirm("게시물을 삭제 하시겠습니까?")) {
		var url = "delete.jsp?num="+num+"&page=<%=current_page%>";
		location.href=url;
	}
}
</script>

</head>
<body>
      <tr height="30">
         <td align="center"><b>방명록</b></td>
      </tr><br>


 <form name="guestForm" method="post" action="guest_ok.jsp">
	  	<tr height="30">
	 		<td width="200" align="left">이름: </td> 
	 		<td width="100" align="center"><input type="text" name="name"></td> 
	  	</tr><br>
  		<tr height="30">
	 		<td width="200" align="left">내용: </td> 
	 		<td width="100" align="center"> <textarea rows="10" cols="30" name="content"></textarea></td> <br>
	 		<td width="100" align="center"><input value="등록하기" type="submit"></td> 
	  	</tr>
	  	
	  	<table style="width: 700px; margin: 5px auto 10px; border-spacing: 0; border-collapse: collapse" border="1">
	  	<tr height="30" align="center">
	  	<td>번호</td>
	  	<td>이름</td>
	  	<td>내용</td>
	  	<td width= "100">날짜</td>
	  	<td>풉풉</td>
	  	</tr> 
	  	
	  	<%for(GuestDTO dto:list) {%>
		<tr height="30" align="center">
		  <td><%=dto.getNum() %></td>
		  <td><%=dto.getName() %></td>
		  <td><%=dto.getContent() %></td>
		  <td ><%=dto.getCreated() %></td>
		  <td width="100">
		    <a href="javascript:deleteScore('<%=dto.getNum()%>');">삭제</a>
		  </td>
		</tr>
		<%} %>
		</table>
</form>



</body>
</html>