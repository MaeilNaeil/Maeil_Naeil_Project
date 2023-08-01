<%@page import="ssg.com.maeil.dto.CalendarParam"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.mybatis.spring.SqlSessionTemplate"%>
<%@page import="ssg.com.maeil.dto.CalendarDto"%>
<%@page import="ssg.com.maeil.dao.CalendarDao"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="java.util.List"%>

<%@page import="util.CalendarUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	 	

	int employee_id = ((MemberDto)session.getAttribute("login")).getEmployee_id();
		
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	
	String yyyyMMdd = year + CalendarUtil.two(month) + CalendarUtil.two(day);
			
	CalendarParam param = (CalendarParam)request.getAttribute("param");	
	
	String pymd= param.getYyyyMMdd();
	
	List<CalendarDto> list = (List)request.getAttribute("caldaylist");
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정목록</title>

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

th {text-align: center;}

.calday {
		text-align: center;				
		border-top: 1px solid rgb(216, 217, 218);
		border-bottom: 1px solid rgb(216, 217, 218);
		border-left: none;
		border-right: none;	
		}
		
#detailA {
		  text-decoration: none;		 	  
		 }

</style>

</head>
<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	  <div id="mainContent" class="contentWrap">

<div align="center">
	<form>
		<table  class="calday">
		<col width="100"><col width="450"><col width="300">
			<thead align="center">
				<tr>
					<th>번호</th><th>제목</th><th>시간</th>
				</tr>
				<%
					if(list == null || list.size() <= 0){
				%>		
				 <tr>
					<td colspan="3">작성된 일정이 없습니다.</td>
				</tr>				
				<%
					} else {
						for(int i = 0; i < list.size(); i++) {						
							CalendarDto dto = list.get(i);					
				%>
				<tr>
					<th><%=(i+1) %></th>
						<td>
							<a href="caldetail.do?seq=<%=dto.getSeq() %>" id="detailA">
								<%=CalendarUtil.daylistdot3(dto.getTitle()) %>
							</a>
						</td>
						<td><%=CalendarUtil.toDates(dto.getRdate()) %></td>
				</tr>
				<%						
					}}
				%>			
			</thead>
			<tbody>			
			</tbody>
		</table>
	</form>	
	<br/>
	<a href="calendarlist.do" class="btn btn-primary">일정목록</a>		
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>











