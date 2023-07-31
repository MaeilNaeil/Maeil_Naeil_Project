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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonGrid.css">

<style type="text/css">

th, td {		
		border-bottom: 1px solid rgb(216, 217, 218);
		border-left: none;
		padding: 8px;		
		}

th {text-align: center;}


.insty {
		 outline: none;
		 border: none;
		 background-color:transparent;
		 resize: none;
		}

.calupdatetable {
				text-align: center;				
				border-top: 1px solid rgb(216, 217, 218);
				border-bottom: 1px solid rgb(216, 217, 218);
				border-left: none;
				border-right: none;
				}

#caldate, #calshare, #caltitle {text-align: left;}

#detailcontent {
				text-align:justify;			
				padding-left: 20px;
				padding-right: 20px;
				height: 450px;
				line-height: 20pt;
				overflow: auto;
				}

/* 스크롤바 */
#detailcontent::-webkit-scrollbar {width: 10px;}
#detailcontent::-webkit-scrollbar-thumb {background-color: gray; border-radius: 10px;}
#detailcontent::-webkit-scrollbar-track {border-radius: 10px; box-shadow: inset 0px 0px 5px white;}

/* body 스크롤바 */
#bodyscr {overflow: auto;}
#bodyscr::-webkit-scrollbar {width: 5px;}
#bodyscr::-webkit-scrollbar {height: 5px;}
#bodyscr::-webkit-scrollbar-thumb {background-color: gray; border-radius: 10px;}
#bodyscr::-webkit-scrollbar-track {border-radius: 10px; box-shadow: inset 0px 0px 5px white;}

</style>

</head>
<body id="bodyscr">
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	  <div id="mainContent" class="contentWrap">

<%

	String year = dto.getRdate().substring(0, 4);
	String month = dto.getRdate().substring(4, 6);
	String day = dto.getRdate().substring(6, 8);

	String date = year + "-" + month + "-" + day;

	String hour = dto.getRdate().substring(8, 10);
	String min = dto.getRdate().substring(10);

	String time = hour + ":" + min;


%>
	 

<div align="center">
	<form action="calupdateAf.do" method="post">
		<table class="calupdatetable">
		<col width="100"><col width="800">
			<thead>
				<tr>
				<th>작성자</th>
				<td>
					<%=mem.getEmployee_id() %>
					<input type="hidden" name="seq" value="<%=dto.getSeq() %>">				
				</td>
			</tr>
			<tr>
				<th>일정</th>
				<td id="caldate">
					<input type="date" name="date" value="<%=date %>">&emsp;
					<input type="time" name="time" value="<%=time %>">
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
					<input type="text" size="100" maxlength="50" name="title" class="insty" id="caltitle" value="<%=dto.getTitle() %>">
				</td>
			</tr>
			<tr>				
				<td colspan="2">					
					<textarea rows="18" cols="95" maxlength="4000" name="content" class="insty" id="detailcontent"><%=dto.getContent() %></textarea>
				</td>
			</tr>			
			</thead>
			<tbody></tbody>
		</table>		
		<br/>
		<button type="button" onclick="calendarlist()" class="btn btn-primary">일정목록</button>
		<button type="submit" class="btn btn-primary">수정완료</button>
	</form>
</div>

<script type="text/javascript">

function calendarlist() {	
	location.href = "calendarlist.do";
}

</script>

 </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>

</body>
</html>
















