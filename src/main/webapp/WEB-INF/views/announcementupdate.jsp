<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AnnouncementDto ann = (AnnouncementDto)request.getAttribute("ann");
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
<h1>수정할겁니다</h1>
<hr>
<form action="announcementupdateAf.do" method="post">
	<table>
		<tr>
		
		
			<td>
				<input type="text" name="title"  value="<%=ann.getTitle() %>">
			</td>
			<td>
				<select name=type id="type">
		       		<option value="공지">공지</option>
		       		<option value="행사">행사</option>
		       		<option value="채용">채용</option> 
		       	</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name=seq value="<%=ann.getSeq() %>">
				<input type="hidden" name=employee_id value="<%=ann.getEmployee_id() %>">
				<input type="hidden" name=auth value="<%=ann.getAuth() %>">
				<input type="hidden" name=del value="<%=ann.getDel() %>">
				<input type="text" name="writing_period" value="<%=ann.getWriting_period() %>" readonly="readonly">
			</td>
		</tr>

		<tr>
			
			<td>
				<textarea rows="20" cols="30" name="content"><%=ann.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit">수정완료</button>
			</td>
		</tr>
	</table>
	</form>
</div>
<script type="text/javascript">


</script>


</body>
</html>