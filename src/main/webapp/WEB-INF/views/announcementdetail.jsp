<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AnnouncementDto ann = (AnnouncementDto)request.getAttribute("ann");
	MemberDto mem = (MemberDto)session.getAttribute("login");
	
	String currentURL = request.getRequestURL().toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="jquery/jquery.twbsPagination.min.js"></script>
</head>
<body>
	
	
	<div align="center">
		<h1>디테일</h1>
		<hr>
	<form id="frm" method="post">
	<table>
		<tr>
			<td>
				<input type="hidden" name=seq value="<%=ann.getSeq() %>">
				<input type="text" name="title" readonly="readonly" value="[<%=ann.getType() %>]<%=ann.getTitle() %>">
			</td>
		</tr>
		<tr>
			<td>
				
				<input type="text" name="writing_period" value="<%=ann.getWriting_period() %>" readonly="readonly">
			</td>
		</tr>

		<tr>
			
			<td>
				<textarea rows="20" cols="30" name="content" readonly="readonly"><%=ann.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<span id="urlText"><%=currentURL %></span>
					<span class="button gray medium"><a href="#" onclick="clip(); return false;">URL주소복사</a></span>
			</td>
		</tr>
		<tr>
			<td>
			<%
				if(mem.getAuth()==3){
					%>
					<button type="submit" id="update">수정하기</a>
					<button type="submit" id="delete">삭제</button>
					<%
				}
			%>
				<a href="announcementmain.do">공지사항 보기</a>
			</td>
		</tr>
	</table>
	</form>
	
	
	
	
	</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#update").click(function(){
	
		$("#frm").attr("action", "announcementupdate.do?seq="+<%=ann.getSeq() %>).submit();
	});
	
	$("#delete").click(function(){
		$("#frm").attr("action", "announcementdelete.do").submit();
	});
	
	
	
});


</script>
<script type="text/javascript">

function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

</script>
	
	
<script type="text/javascript">


</script>	
</body>
</html>