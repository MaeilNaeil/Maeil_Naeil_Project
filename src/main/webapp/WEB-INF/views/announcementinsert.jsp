<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto mem = (MemberDto)session.getAttribute("login");

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css">
<style type="text/css">
.center{
	margin: 10px 10px 10px 10px;  	
}
.row1{
	height: 20px;
}
textarea{
	width: 100%;
	resize: none;
}
table{
	width: 100%;
}
th{
	text-align: center;
	width: 100px;
}
th,td{
	padding: 15px;
	
}
.row1{
	width: 90%;	
}
.row2{
	width:9.3% ;
}
.row3{
	width: 100%;
}
.btnbox{
	text-align: center;
}
</style>
</head>
<body>
<div width="100%" height="100%" class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
<div id="mainContent" class="contentWrap">
	<div class="center">
       	<form method=post id="frm">
       		<table class="tablebox">
	       		<tr>
	       			<th>작성자</th>
		       		<td>
		       				<input type="hidden" size=15 name=employee_id id="employee_id" style="height: 30px" value="<%=mem.getEmployee_id() %>">
		       				<input type="text" readonly="readonly"   class="row1" name=employee_name id="employee_name" style="height: 30px" value="<%=mem.getEmployee_name() %>">
		       				<select name=type id="type" class="row2">
		       					<option value="공지">공지</option>
		       					<option value="행사">행사</option>
		       					<option value="채용">채용</option> 
		       				</select>
		       		</td>
	       		</tr>
       			<tr>
       			<th>제목</th>
	       			<td>
	       				<input type=text name=title class="input-sm row3" id="title" >	     	
	       			</td>
       			</tr>
       			<tr>
       			<th>내용</th>
	       			<td>
	       				<textarea rows="20" cols="30" name=content id="content"></textarea>
	       			</td>
       			</tr>       			
       			<tr>
	       			<td colspan="2">
	       				<div class="btnbox">
	       					<input type="button" value="글쓰기" class="button" id="writeBtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       					<input type=button value="취소" class="button" onclick="javascipt:history.back()">
						</div>	       				
	       			</td>
       			</tr>
        	</table>
    	</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){
		// 제목이 비었는지?
			if( $("#title").val().trim() == ""){
				alert("제목을 기입해 주십시오");
				return;
			}				
			// 내용이 비었는지?
			if( $("#content").val().trim() == "" ){
				alert("내용을 기입해 주십시오");
				return;
			}
		
			$("#frm").attr("action", "announcementinsertAf.do").submit();		
		});
});
</script>

</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>