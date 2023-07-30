<%@page import="ssg.com.maeil.dto.CalendarParam"%>
<%@page import="org.apache.ibatis.mapping.ResultMap"%>
<%@page import="org.mybatis.spring.SqlSessionTemplate"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="util.CalendarUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="ssg.com.maeil.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.maeil.dao.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    	MemberDto login = (MemberDto)session.getAttribute("login");
    
    	List<CalendarDto> list = (List)request.getAttribute("callist");
    	    	
    	CalendarParam param = (CalendarParam)request.getAttribute("param");
    		
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department Calendar</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonGrid.css">

<style type="text/css">
th{
  vertical-align : middle;
}

.sun{
	color: red;
}
.sat{
	color: blue;
}




</style>

</head>
<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	  <div id="mainContent" class="contentWrap">
 
<h1>Department Calendar</h1>
<!-- <a href = "main.do">메인화면</a> -->
<%-- <%=login.getEmployee_id() %>님 --%>

<%
	Calendar cal = Calendar.getInstance();
	cal.set(Calendar.DATE, 1);

	String syear = request.getParameter("year");
	String smonth = request.getParameter("month");
	
	
	int year = cal.get(Calendar.YEAR);
	if(CalendarUtil.nvl(syear) == false) {	
		year = Integer.parseInt(syear);
	}
	
	int month = cal.get(Calendar.MONTH)+1;	
	if(CalendarUtil.nvl(smonth) == false) {
		month = Integer.parseInt(smonth);
	}
	
	if(month < 1) {
		month = 12;
		year--;
	}
	
	if(month > 12) {
		month = 1;
		year++;
	}
	
	cal.set(year, month-1, 1);
	
	
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// <<	year--
	String pp = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/left.png' width='20px' height='20px' >"
								+ "</a>", year-1, month);
	
	// <	month--
	String p = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/prec.png' width='20px' height='20px' >"
								+ "</a>", year, month-1);
	
	// >	month++
	String n = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/next.png' width='20px' height='20px' >"
								+ "</a>", year, month+1);
	
	// >>	year++
	String nn = String.format("<a href='calendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
								+ "<img src='./images/last.png' width='20px' height='20px' >"
								+ "</a>", year+1, month);	   	
	
	
%>





<div align="center">
	<table border="1">
	<col width="120"><col width="120"><col width="120"><col width="120">
	<col width="120"><col width="120"><col width="120">
	
		<tr height="80">
			<td colspan="7" align="center">
				<%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;&nbsp;&nbsp;
			
				<font style="color: #3c3c3c; font-size: 40px; font-family: fantasy">
					<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
				</font>
			
				&nbsp;&nbsp;&nbsp;&nbsp;<%=n %>&nbsp;<%=nn %>
			</td>
		</tr>	
		<tr height="30" align="center" style="background-color: rgb(52, 58, 64); color: white;">
			<th class="sun">SUN</th>
			<th>MON</th>
			<th>TUS</th>
			<th>WED</th>
			<th>THU</th>
			<th>FRI</th>
			<th class="sat">SAT</th>
		</tr>

		<tr height="100" align="left" valign="top">
		<%	
		for(int i = 1; i < dayOfWeek; i++){
		%>	
			<td style="background-color: #eeeeee">&nbsp;</td>
		<%
		}
		
	
	
	
	
			int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			for(int i = 1; i <= lastday; i++) {
			%>
			<td style="color: #3c3c3c; padding-top: 5px">
				<%=CalendarUtil.daylist(year, month, i) %>&nbsp;&nbsp;<%=CalendarUtil.calwrite(year, month, i) %>
				<%=CalendarUtil.makeTable(year, month, i, list) %>			
			</td>
			<%
				if((i + dayOfWeek - 1)%7 == 0 && i != lastday){
			%>
					</tr><tr height="100" align="left" valign="top">
			<%
				}
			}
	
	
	
	
	
						cal.set(Calendar.DATE, lastday);
						int weekday = cal.get(Calendar.DAY_OF_WEEK);
						for(int i = 0; i < 7 - weekday; i++) {	
						%>
							<td style="background-color: #eeeeee">&nbsp;</td>
						<%
						}
						%>
						</tr>
	
	</table>	
	 	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>
	
	
	
	
	
	
	