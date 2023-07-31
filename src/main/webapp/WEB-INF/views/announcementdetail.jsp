<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AnnouncementDto ann = (AnnouncementDto)request.getAttribute("ann");
	MemberDto mem = (MemberDto)session.getAttribute("login");
	
	String currentURL = request.getRequestURL().toString();
	
	if(mem == null || (mem.getEmployee_id()+"") == "" ||(mem.getEmployee_id()+"") == null) {
		%>
		<script>
		alert("다시 로그인해주세요.");
		location.href="login.do";
		</script>
		<%
	} 
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonGrid.css">
<style type="text/css">

.center{
	margin: 10px 10px 10px 10px;  
	text-align: right;
	
}
.titlebox{
	width: 100%;
	height: 100px;
	padding-left:30px;
}
input{
	border: none;
}
textarea{
	width: 100%;	
	resize: none;
	padding: 30px;
}
.wrap{
	align-content: center;
}
table {
	width: 100%;
	border: none;
}
.indel{
	padding-right: 250px;
}
.spanbox{
	padding-right: 40px;
	padding-bottom: 30px;
}
#update,#delete{
	width: 80px;
	height:40px;
}
</style>
</head>
<body>
	<div width="100%" height="100%" class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
<div id="mainContent" class="contentWrap">
	<div class="center">
	<form id="frm" method="post">
	<table>
		<tr>
			<td>
				<input type="text" class="titlebox" name="title" readonly="readonly" value="[<%=ann.getType() %>]<%=ann.getTitle() %>">
			</td>
		</tr>
		<tr>
			<td>
				
				<input type="text" class="periodbox" name="writing_period" value="<%=ann.getWriting_period() %>" readonly="readonly">
			</td>
		</tr>
		<tr>	
			<td>
				<textarea rows="20" cols="30" style="height: 480px" name="content" readonly="readonly"><%=ann.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td class="spanbox">
				<span id="urlText" style="font-size: 17px"><%=currentURL %></span>
					<span class="button gray medium"><a href="#" onclick="clip(); return false;">URL주소복사</a></span>
			</td>
		</tr>
		<tr>
			<td class="indel">
			<%
				if(mem.getAuth()==3){
					%>
					<input type="hidden" name="seq" value="<%=ann.getSeq() %>"/>
					<input type="button" id="update" value="수정" />&nbsp;&nbsp;&nbsp;            
					<input type="button" id="delete" value="삭제" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
				}
			%>
				<a href="announcementmain.do">공지사항</a>
			</td>
		</tr>
	</table>
	</form>	
</div>
<script type="text/javascript">

$(document).ready(function(){
	$("#update").click(function(){
		var seq = <%=ann.getSeq() %>;
		location.href = "announcementupdate.do?seq="+ seq;
		
	});
	
	$("#delete").click(function(){
		var seq = <%=ann.getSeq() %>;
		location.href = "announcementdelete.do?seq=" + seq;
	});
	
	
});

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
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>