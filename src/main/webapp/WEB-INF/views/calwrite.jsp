
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="util.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%


	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
		
	month = CalendarUtil.two(month);
	day = CalendarUtil.two(day);

	MemberDto login = (MemberDto)session.getAttribute("login");

	if(login == null || (login.getEmployee_id()+"") == "" ||(login.getEmployee_id()+"") == null) {
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
<title>Department Calendar Write</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css">

</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	  <div id="mainContent" class="content">

<h1>일정작성</h1>
<br/>
<br/>
<div align="center">
	<form action="calwriteAf.do" method="post">
		<table border="1" class="table">
		<col width="200"><col width="500">
			<thead class="thead-dark">
				<tr>
					<th>작성자</th>
					<td>							
						<%=login.getEmployee_id() %>					
						<input type="hidden" name="employee_id" value="<%=login.getEmployee_id() %>">
					</td>
				</tr>
				<tr>
					<th>일정</th>
					<td>
						<input type="date" name="date" id="date">&nbsp;
						<input type="time" name="time" id="time">
					</td>
				</tr>
				<tr>
					<th>공유</th>
					<td>				
						<input id="first_radio" class="radio" type="radio" name="share" value="1" checked="checked">공개
						<input id="second_radio" type="radio" name="share" value="2">비공개
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" size="80">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="20" cols="80" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="일정추가" class="btn btn-primary">
					</td>
				</tr>	
			</thead>
			<tbody></tbody>		
		</table>
	</form>
</div>

<script type="text/javascript">


let year = "<%=year %>";
let month = "<%=month %>";
let day = "<%=day %>";

// 2023-07-05
document.getElementById("date").value = year + "-" + month + "-" + day; 

let d = new Date();
document.getElementById("time").value = d.getHours() + ":" + d.getMinutes();


</script>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>

















