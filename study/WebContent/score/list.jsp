<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.score.ScoreDAO"%>
<%@page import="com.score.ScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	ScoreDAO dao = new ScoreDAO();
	MyUtil util = new MyUtil();
	
	// 파라미터로 넘어온 페이지번호
	String pageNum=request.getParameter("page");
	int current_page=1; // 넘어온 파라미터가 없으면 1페이지 출력
	if(pageNum!=null)
		current_page=Integer.parseInt(pageNum);
	
	int dataCount;
	int numPerPage=10; // 한페이지의 표시할 데이터 개수
	int total_page;
	// 전체 데이터 개수
	dataCount=dao.dataCount(); // DB속에 존재하는 전체 데이터 개수
	
	// 전체 페이지 개수
	total_page=util.pageCount(numPerPage, dataCount);
	
	if(current_page>total_page)
		current_page = total_page;
	
	//테이블에서 가져올 시작과 끝 위치
	int start=(current_page-1)*numPerPage+1; // 5면 41
	int end = current_page*numPerPage; // 5면 50
	
	// 테이블에서 게시물 가져오기
	List<ScoreDTO> list = dao.listScore(start, end);
	
	// 페이징 처리
	String listUrl = "list.jsp";
	String paging = util.paging(current_page, total_page, listUrl);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function deleteScore(hak) {
	if(confirm("게시물을 삭제 하시겠습니까?")) {
		var url = "delete.jsp?hak="+hak+"&page=<%=current_page%>";
		location.href=url;
	}
}


function check(){
    var f=document.listForm;
    if(f.chk==undefined) { // 하나도 존재하지 않는 경우
    	return;
    } 
    
    if(f.chk.length!=undefined) { // 두개 이상인 경우
    	for(var i=0;i<f.chk.length;i++) {
    		if(f.chkAll.checked) {
    			f.chk[i].checked=true;
    		} else {
    			f.chk[i].checked=false;
    		}
    	}
    } else { // 하나인 경우
    	if(f.chkAll.checked) {
			f.chk.checked=true;
		} else {
			f.chk.checked=false;
		}
	   }
}

function deleteList() {
	var f=document.listForm;
	
	if(f.chk==undefined) { 
		return;
	}
	
	var cnt=0;
	if(f.chk.length!=undefined) { // 데이터 두개 이상이 선택되어 있으면!
		for (var i = 0; i < f.chk.length; i++) {
			if(f.chk[i].checked)
				cnt++;
		}
	} else { // 한개인 경우
		if(f.chk.checked) 
			cnt++;
	}
	
	if(cnt>=1) {
		if(confirm("삭제하시겠습니까")) {
			f.action="deleteList.jsp";
			f.submit();
		}
	} else {
		alert("삭제할 게시물을 먼저 선택하세요...")
	}
}

</script>


</head>
<body>

<table style="width: 700px; margin: 20px auto 5px;">
<tr height="30">
 <td align="center" colspan="2"><b>성적처리</b></td>
</tr>

<tr height="25">
	<td>
 		<input type="button" value="삭제" onclick="deleteList();">
 	</td>
 	<td align="right">
 	 <input type="button" value="등록하기"
  	 onclick="javascript:location.href='write.jsp';">
   </td>
 </tr>
</table>
<form method="post" name=listForm>
	<table style="width: 700px; margin: 5px auto 10px; border-spacing: 0; border-collapse: collapse" border="1">
	<tr height="30" align="center">
		<td width="30">
			<input type="checkbox"
					name="chkAll" value = "all" onclick="check();">
		</td>
		<td width="60">학번</td>
		<td width="100">이름</td>
		<td width="100">생년월일</td>
		<td width="60">국어</td>
		<td width="60">영어</td>
		<td width="60">수학</td>
		<td width="60">총점</td>
		<td width="60">평균</td>
		<td width="60">수정</td>
	</tr>
	
	<%for(ScoreDTO dto:list) {%>
		<tr height="30" align="center">
		  <td>
		    <input type="checkbox" name="chk"
		    	value="<%=dto.getHak()%>">
		  </td>
		  <td><%=dto.getHak() %></td>
		  <td><%=dto.getName() %></td>
		  <td><%=dto.getBirth() %></td>
		  <td><%=dto.getKor() %></td>
		  <td><%=dto.getEng() %></td>
		  <td><%=dto.getMat() %></td>
		  <td><%=dto.getTot() %></td>
		  <td><%=dto.getAve() %></td>
		  <td width="100">
		    <a href="update.jsp?hak=<%=dto.getHak()%>&page=<%=current_page%>">수정</a> |
		    <a href="javascript:deleteScore('<%=dto.getHak()%>');">삭제</a>
		  </td>
		</tr>
	<%} %>
	</table>
</form>
<table style="width: 700px; margin:5px auto;">
<tr height="35" align="center">
 <td><%=paging %></td>
 </tr>
</table>

</body>
</html>


