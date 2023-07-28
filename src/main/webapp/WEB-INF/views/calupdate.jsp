<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.maeil.dto.CalendarDto"%>
<%@page import="ssg.com.maeil.dao.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int seq = Integer.parseInt(request.getParameter("seq"));

	System.out.println("calupdate = " + seq);	
	
	CalendarDto dto = (CalendarDto)request.getAttribute("caldto");
	
	MemberDto mem = (MemberDto)session.getAttribute("login");
		
	
	
%>

 
        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정수정</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>

<%

	String year = dto.getRdate().substring(0, 4);
	String month = dto.getRdate().substring(4, 6);
	String day = dto.getRdate().substring(6, 8);

	String date = year + "-" + month + "-" + day;

	String hour = dto.getRdate().substring(8, 10);
	String min = dto.getRdate().substring(10);

	String time = hour + ":" + min;


%>
	 

<h1>일정수정</h1>
<br/>
<br/>
<div align="center">
	<form action="calupdateAf.do" method="post">
		<table border="1" class="table">
		<col width="200"><col width="500">
			<thead class="thead-dark">
				<tr>
				<th>작성자</th>
				<td>
					<%=mem.getEmployee_id() %>
					<input type="hidden" name="seq" value="<%=dto.getSeq() %>">				
				</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<input type="date" name="date" value="<%=date %>">
					<input type="time" name="time" value="<%=time %>">
				</td>
			</tr>
			<tr>
				<th>공유</th>
				<td>				
					<input id="first_radio" class="radio" type="radio" name="share" value="1">공개
					<input id="second_radio" type="radio" name="share" value="2">비공개
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="<%=dto.getTitle() %>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<input type="text" name="content" value="<%=dto.getContent() %>">
				</td>
			</tr>			
			</thead>
			<tbody></tbody>
		</table>
		<br/>
		<br/>
		<button type="submit" class="btn btn-primary">수정완료</button>
	</form>
</div>


 

</body>
</html>
















