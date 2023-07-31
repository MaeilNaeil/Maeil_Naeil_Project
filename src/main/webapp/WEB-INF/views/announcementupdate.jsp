<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AnnouncementDto ann = (AnnouncementDto)request.getAttribute("ann");
	System.out.println("ann 확인 : " + ann);
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
	border: none;
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
td{
	width: 100%;
}
.btncl{
	padding-right: 30px;
	padding-bottom: 30px;
}
</style>
</head>
<body>
<div width="100%" height="100%" class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
<div id="mainContent" class="contentWrap">
	<div class="center">
<form action="announcementupdateAf.do" method="post">
	<table>
	<col width="50"><col width="300">
		<tr>
			<td>
				<input type="text" class="titlebox" name="title"  value="<%=ann.getTitle() %>">
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
			<td colspan="2">
				<input type="hidden" name=seq value="<%=ann.getSeq() %>">
				<input type="hidden" name=employee_id value="<%=ann.getEmployee_id() %>">
				<input type="hidden" name=auth value="<%=ann.getAuth() %>">
				<input type="hidden" name=del value="<%=ann.getDel() %>">
				<input type="text" name="writing_period" value="<%=ann.getWriting_period() %>" readonly="readonly">
			</td>
		</tr>
		<tr>	
			<td colspan="2">
				<textarea rows="20" cols="30" name="content"><%=ann.getContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="btncl">
				<button type="submit">수정완료</button>
			</td>
		</tr>
	</table>
	</form>
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</div>
</body>
</html>