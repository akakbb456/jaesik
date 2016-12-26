<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study</title>

<link rel="stylesheet" href="<%=cp%>/res/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/res/css/layout/layout.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/res/js/util.js"></script>

<script type="text/javascript">

</script>

</head>
<body>

<div class="layoutMain">
	<div class="layoutHeader">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	</div>
	
	<div class="layoutBody">
	
		<div style="min-height: 450px;">
				<div style="width:100%;	height: 40px; line-height:40px;clear: both; border-top: 1px solid #DAD9FF;border-bottom: 1px solid #DAD9FF;">
				    <div style="width:600px; height:30px; line-height:30px; margin:5px auto;">
				        <img src="<%=cp%>/res/images/arrow.gif" alt="" style="padding-left: 5px; padding-right: 5px;">
				        <span style="font-weight: bold;font-size:13pt;font-family: 나눔고딕, 맑은 고딕, 굴림;">게시판</span>
				    </div>
				</div>
				
				<div style="margin: 10px auto; margin-top: 20px; width:600px; min-height: 400px;">
					<table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
					<tr><td colspan="4" height="3" bgcolor="#507CD1"></td></tr>
					
					<tr height="35">
					    <td colspan="4" align="center">
						   ${dto.subject}
					    </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#507CD1" ></td></tr>
					
					<tr height="30">
					    <td width="80" bgcolor="#EEEEEE" align="center">작성자</td>
					    <td width="220" align="left" style="padding-left:10px;">
					       ${dto.name}
					    </td>
					    <td width="80" height="30" bgcolor="#EEEEEE" align="center">줄&nbsp;&nbsp;수</td>
					    <td width="220" align="left" style="padding-left:10px;">
					         ${lingsu}
					     </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>
					
					<tr height="30" >
					    <td width="80" bgcolor="#EEEEEE" align="center">등록일</td>
					    <td width="220" align="left" style="padding-left:10px;">
					        ${dto.created}
					    </td>
					    <td width="80" bgcolor="#EEEEEE" align="center">조회수</td>
					    <td width="220" align="left" style="padding-left:10px;">
					        ${dto.hitCount }
					    </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>
					
					<tr>
					  <td colspan="4" align="left" style="padding: 15px 30px 15px 30px;" valign="top" height="150">
					        ${dto.content }
					   </td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#507CD1"></td></tr>
					
					<tr height="30">
					    <td width="80" bgcolor="#EEEEEE" align="center">이전글</td>
					    <td width="520" align="left" style="padding-left:10px;" colspan="3">
							<c:if test="${not empty preDto}">
								<a href="<%=cp%>/bbs/article.do?${params}&num=${preDto.num}">${preDto.subject}</a>
							</c:if>			
						</td>
					</tr>
					<tr><td colspan="4" height="1" bgcolor="#DBDBDB"></td></tr>
					
					<tr height="30">
					    <td width="80" bgcolor="#EEEEEE" align="center">다음글</td>
					    <td width="520" align="left" style="padding-left:10px;" colspan="3">
							<c:if test="${not empty nextDto}">
								<a href="<%=cp%>/bbs/article.do?${params}&num=${nextDto.num}">${nextDto.subject}</a>
							</c:if>	
					    </td>
					</tr>
					<tr><td colspan="4" height="3" bgcolor="#507CD1" align="center"></td></tr>
					
					<tr height="25">
						<td colspan="4" align="right">
						${dto.ipAddr}
						</td>
					</tr>
					</table>
					
					<table style="width: 600px; margin: 0px auto; border-spacing: 0px;">
					<tr height="35">
					    <td width="50%" align="left">
		          
					          <input type="image" src="<%=cp%>/res/images/btn_modify.gif" onclick="javascript:location.href='<%=cp%>/bbs/pwd.do?mode=update&num=${dto.num}&page=${page}&boardNum=${dto.boardNum}';">
				     				
					          <input type="image" src="<%=cp%>/res/images/btn_delete.gif" onclick="javascript:location.href='<%=cp%>/bbs/pwd.do?mode=delete&num=${dto.num}&page=${page}';">
					    </td>
					
					    <td align="right">
					           <input type="image" src="<%=cp%>/res/images/btn_list.gif" onclick="javascript:location.href='<%=cp%>/bbs/list.do?${params}';">
					           <!-- ${param }: 검색을 하면나오고 안하면 안나오게 하기위해 넣었다. -->
					           	<!-- 바로 위에있는건 목록키!! -->
					    </td>
					</tr>
					</table>
		
				</div>
		</div>
		
    </div>
	
	<div class="layoutFooter">
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>