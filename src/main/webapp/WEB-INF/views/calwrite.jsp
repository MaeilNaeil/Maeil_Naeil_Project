
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonGrid.css">

<style type="text/css">

th, td {		
		border-bottom: 1px solid rgb(216, 217, 218);
		border-left: none;
		padding: 8px;		
		}

th {text-align: center;	/* background-color: rgb(216, 217, 218); */}

/* input&textarea 투명하게*/
.insty {
		 outline: none;
		 border: none;
		 background-color:transparent;
		 resize: none;
		}

.calwritetable {
				text-align: center;				
				border-top: 1px solid rgb(216, 217, 218);
				border-bottom: 1px solid rgb(216, 217, 218);
				border-left: none;
				border-right: none;				
				}

#caldate, #calshare, #caltitle {text-align: left;}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css">

</head>
<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	  <div id="mainContent" class="contentWrap">
	
<div align="center">
	<form action="calwriteAf.do" method="post">
		<table  class="calwritetable">
		<col width="100"><col width="800">
			<thead>
				<tr>
					<th>작성자</th>
					<td>							
						<%=login.getEmployee_id() %>					
						<input type="hidden" name="employee_id" value="<%=login.getEmployee_id() %>">
					</td>
				</tr>
				<tr>
					<th>일정</th>
					<td id="caldate">
						<input type="date" name="date" id="date">&emsp;
						<input type="time" name="time" id="time">
					</td>
				</tr>
				<tr>
					<th>공유</th>
					<td id="calshare">				
						<input type="radio" name="share" class="radio" id="first_radio" value="1" checked="checked">공개&emsp;&emsp;
						<input type="radio" name="share" id="second_radio" value="2">비공개
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" size="100" maxlength="50" name="title" class="insty" id="caltitle">
					</td>
				</tr>
				<tr>					
					<td colspan="2">
						<textarea rows="19" cols="95" maxlength="4000" name="content" class="insty" id="scrhidden"></textarea>
					</td>
				</tr>				
			</thead>
			<tbody></tbody>		
		</table>
		<br/>
		<button type="button" onclick="calendarlist()" class="btn btn-primary">일정목록</button>
		<input type="submit" value="일정추가" class="btn btn-primary">
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


function calendarlist() {	
	location.href = "calendarlist.do";
}

</script>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>

















