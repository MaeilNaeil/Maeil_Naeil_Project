<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto mem = (MemberDto)session.getAttribute("login");
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
	<h2>공지사항 작성하기</h2>
		<hr/>
       	<div>
       	<form method=post id="frm">
       		<table>
       			
	       		<tr>
	       		<th width=10%>작성자</th>
		       			<td width=80%>
		       				<input type="hidden" size=15 name=employee_id id="employee_id" style="height: 30px" value="<%=mem.getEmployee_id() %>">
		       				<input type="text" readonly="readonly"  size=15 name=employee_name id="employee_name" style="height: 30px" value="<%=mem.getEmployee_name() %>">
		       				<select name=type id="type">
		       					<option value="공지">공지</option>
		       					<option value="행사">행사</option>
		       					<option value="채용">채용</option> 
		       				</select>
		       			</td>
	       		</tr>
       			<tr>
       			<th width=20%>제목</th>
	       			<td width=80%>
	       				<input type=text name=title size=50 class="input-sm" id="title" >
	       				
	       			</td>
       			</tr>
       			<tr>
       			<th width=20%>내용</th>
	       			<td width=80%>
	       				<textarea rows="10" cols="50" name=content id="content"></textarea>
	       			</td>
       			</tr>       			
       			<tr>
	       			<td colspan="2">
	       				<div class="wrap">
	       					<input type="button" value="글쓰기" class="button" id="writeBtn">
	       					<input type=button value="취소" class="button" onclick="javascipt:history.back()">
						</div>
	       				
	       			</td>
       			</tr>
        	</table>
    	</form>
	</div>
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


</body>
</html>