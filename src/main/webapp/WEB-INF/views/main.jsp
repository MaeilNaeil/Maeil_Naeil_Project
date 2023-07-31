<%@page import="util.CalendarUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="ssg.com.maeil.dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.maeil.dto.CalendarParam"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="ssg.com.maeil.controller.MainResponse"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDto loginMember = (MemberDto) session.getAttribute("login");
String lowerFileName;

if (loginMember  == null || (loginMember .getEmployee_id() + "") == "" || (loginMember.getEmployee_id() + "") == null) {
%>
	<script>
	alert("다시 로그인해주세요.");
	location.href="login.do";
	</script>
<%
}

if (loginMember.getNewfilename() != null && !loginMember.getNewfilename().isEmpty()) {
	lowerFileName = loginMember.getNewfilename().toLowerCase();
	} else {
		lowerFileName = "base.PNG";
	}

MainResponse mainResponse = (MainResponse) request.getAttribute("mainResponse");
System.out.println("mainResponse.getStartWorkTime >>> " + mainResponse.getStartWorkTime());
System.out.println("mainResponse.getLeaveWorkTime >>> " + mainResponse.getLeaveWorkTime());

boolean hasStartWorkTime = mainResponse.getStartWorkTime() != null;
boolean hasLeaveWorkTime = mainResponse.getLeaveWorkTime() != null;
%>

<%
CalendarParam param = (CalendarParam)request.getAttribute("param");

List<CalendarDto> list = (List)request.getAttribute("callist");

List<CalendarDto> maincallist = (List)request.getAttribute("maincallist");

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
String pp = String.format("<a href='maincalendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
				+ "<img src='./images/left.png' width='20px' height='23px' >"
				+ "</a>", year-1, month);

// <	month--
String p = String.format("<a href='maincalendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
				+ "<img src='./images/prec.png' width='20px' height='23px' >"
				+ "</a>", year, month-1);

// >	month++
String n = String.format("<a href='maincalendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
				+ "<img src='./images/next.png' width='20px' height='23px' >"
				+ "</a>", year, month+1);

// >>	year++
String nn = String.format("<a href='maincalendarlist.do?year=%d&month=%d' style='text-decoration: none'>"
				+ "<img src='./images/last.png' width='20px' height='23px' >"
				+ "</a>", year+1, month);	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Is Best를 방문해주셔서 감사합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainGrid.css">


<style>
.imgfile {
	margin: 25px 10px 25px 25px;
	width: 200px;
	height: 200px;
}
.profile{
	margin: 25px auto;
	padding: 25px 0;
	font-size: 16px;
}
.startWorkBtnWrap, .leaveWorkBtnWrap{
	margin: 20px 0 0 0;
	height: 40px;
	line-height: 40px; 	
}
.startWorkBtn, .leaveWorkBtn{
	padding: 4px 20px;
	display: flex;
	align-items:center;
	border: none;
	border-radius: 5px;
	background-color:  dodgerblue;
	color: white;
}
.leaveWorkBtnDisabled{
	padding: 4px 20px;
	display: flex;
	align-items:center;
	border: none;
	border-radius: 5px;
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
		<div class="contentWrap mainContentWrap">
			<div align="center" class="item content-1">
				<img src="http://localhost:9100/Maeil_Naeil/upload/<%=lowerFileName %>"
						alt="프로필 이미지" class="imgfile">
				<div  class="profile">
					<div>
					어서오세요<br> 
					<%=loginMember.getEmployee_name() %> 님
					</div> 

					<%
					LocalDateTime responseStartTime = mainResponse.getStartWorkTime();
					String startWorkTime = hasStartWorkTime ? responseStartTime.format(DateTimeFormatter.ofPattern("HH:mm:ss")) : null;
					LocalDateTime responseLeaveTime = mainResponse.getLeaveWorkTime();
					String leaveWorkTime = hasLeaveWorkTime ? responseLeaveTime.format(DateTimeFormatter.ofPattern("HH:mm:ss")) : null;
		
					if (hasStartWorkTime && hasLeaveWorkTime) {
					%>
					<div class="startWorkBtnWrap" style="display: flex;">
						<p>출근 : &nbsp;</p>
						<p><%=startWorkTime%></p>
					</div>
					<div class="leaveWorkBtnWrap" style="display: flex;">
						<p>퇴근 : &nbsp;</p>
						<p><%=leaveWorkTime%></p>
					</div>
					<%
					} else if (!hasStartWorkTime && !hasLeaveWorkTime) {
					%>
					<div class="startWorkBtnWrap" style="display: flex;">
						<p>출근 : &nbsp;</p>
						<button class="startWorkBtn" onclick="startWork()">출근</button>
					</div>
					<div class="leaveWorkBtnWrap" style="display: flex;">
						<p>퇴근 : &nbsp;</p>
						<button class="leaveWorkBtnDisabled" onclick="leaveWork()"
							disabled="disabled">퇴근</button>
					</div>
					<%
					} else if (hasStartWorkTime && !hasLeaveWorkTime) {
					%>
					<div class="startWorkBtnWrap" style="display: flex;">
						출근 : &nbsp;
						<%=startWorkTime%>
					</div>
					<div class="leaveWorkBtnWrap" style="display: flex;">
						<p>퇴근 : &nbsp;</p>
						<button class="leaveWorkBtn" onclick="leaveWork()">퇴근</button>
					</div>
					<%
					}
					%>
				</div>
	
	
	
	
			</div>
			
			<div class="item content-2">
				<a href="announcementmain.do">공지사항</a>
				<jsp:include page="/WEB-INF/views/main_announce.jsp"></jsp:include>
			</div>
			
			<!-- TODO : 메인에 달력 -->
			<div class="item content-3">					
					<table width="100%" height="100%">
					<thead>			
						<tr height="20">
							<td colspan="7" align="center">
								<%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;			
								<font style="color: #3c3c3c; font-size: 15px; font-family: sans-serif;">
								<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
								</font>			
								&nbsp;&nbsp;<%=n %>&nbsp;<%=nn %>
							</td>
						</tr>	
						<tr height="5" align="center" style="background-color: rgb(68, 67, 88); color: white;">
							<th style="color:red;">SUN</th>
							<th>MON</th>
							<th>TUS</th>
							<th>WED</th>
							<th>THU</th>
							<th>FRI</th>
							<th style="color:blue;">SAT</th>
						</tr>
					</thead>
					<tbody>
						<tr height="40" valign="top">
						<%	
						for(int i = 1; i < dayOfWeek; i++){
						%>
							<td style="background-color: rgba(216, 217, 218, 0.3)">&nbsp;</td>
						<%
						}
	
						int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
						for(int i = 1; i <= lastday; i++) {
						%>
							<td style="background-color:rgb(255, 255, 255); padding-top: 5px">
							<%=CalendarUtil.daylist(year, month, i) %>&nbsp;&nbsp;<%=CalendarUtil.calwrite(year, month, i) %>
							<%=CalendarUtil.mainmakeTable(year, month, i, maincallist) %>			
							</td>
						<%
							if((i + dayOfWeek - 1)%7 == 0 && i != lastday){
						%>
						</tr>
						<tr height="40" valign="top">
						<%
							}
						}	
	
						cal.set(Calendar.DATE, lastday);
						int weekday = cal.get(Calendar.DAY_OF_WEEK);
						for(int i = 0; i < 7 - weekday; i++) {	
						%>
							<td style="background-color: rgba(216, 217, 218, 0.3)">&nbsp;</td>
						<%
						}
						%>
						</tr>
					</tbody>
					</table>	
			</div>
		
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>	
	</div>
</body>
<script type="text/javascript">
	
		const startWorkBtn = document.querySelector(".startWorkBtn");
		const startWorkBtnWrap = document.querySelector(".startWorkBtnWrap");
		const leaveWorkBtn = document.querySelector(".leaveWorkBtn");
		const leaveWorkBtnWrap = document.querySelector(".leaveWorkBtnWrap");
		
		const startWork = () => {
			if(confirm("출근 등록하시겠습니까?")){
				$(document).ready(function(){			
					$.ajax({
						url:"startWork.do",
						type:"post",
						data:{ employeeId:<%=loginMember.getEmployee_id() %> },
						success:function(result){
						/*alert(JSON.stringify(result)); */
						
						if(result.alreadyHasTime){
							alert('이미 출근되었습니다.');	
						}
						startWorkBtn.style.display = 'none';
						document.location.reload();
						},
						
						error:function(){
							alert('error');
						}		
					});	
				 })
			}
	  	}
		
		
		const leaveWork = () => {
			if(confirm("퇴근 등록하시겠습니까?")){
				$(document).ready(function(){
					$.ajax({
						url:"leaveWork.do",
						type:"post",
						data:{ employeeId:<%=loginMember.getEmployee_id() %> },
						success:function(result){
						/* alert(JSON.stringify(result)); */
						if(result.alreadyHasTime){
							alert('이미 퇴근되었습니다.');	
						}
						leaveWorkBtn.style.display = 'none';
						document.location.reload();
						},
						
						error:function(){
							alert('error');
						}		
					});	
				 })
			} 
		}
		
		
		
		
		
</script>


</html>