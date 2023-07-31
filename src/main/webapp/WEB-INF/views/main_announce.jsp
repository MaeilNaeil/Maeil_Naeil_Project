<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="ssg.com.maeil.dto.AnnouncementSearch"%>
<%@page import="java.util.List"%>
<%@page import="util.AnnouncementUtil"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AnnouncementDto> list = (List)request.getAttribute("announcementList");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.center{
	text-align: center;
}
th{
	width: 20px;
	text-align: center;
} 

td{
	text-align: center;
	align-content:center;
	padding-right: 0px;
}
</style>
</head>
<body>
<table class="table table-hover">
<col width="20"><col width="40">

<%
if(list == null || list.size() == 0){
%>
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	for(int i = 0;i < list.size(); i++){
		AnnouncementDto ann = list.get(i);
		String date = ann.getWriting_period().substring(0, 10);
		%>
		<tr>
				<th><%=ann.getType() %></th>			
				<td style="text-align: left;">				
					<a href="announcementdetail.do?seq=<%=ann.getSeq() %>">
						<%=AnnouncementUtil.titleDot1(ann.getTitle()) %>
					</a>			
				</td>
		</tr>
				<% 
	}
}
		%>
</table>
</body>
</html>