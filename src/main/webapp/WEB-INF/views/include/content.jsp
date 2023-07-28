 <%@page import="java.time.format.DateTimeFormatter"%>
 <%@page import="java.time.LocalDateTime"%>
 <%@page import="ssg.com.maeil.controller.MainResponse"%>
 <%@page import="ssg.com.maeil.dto.MemberDto"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
	MainResponse mainResponse = (MainResponse)request.getAttribute("mainResponse");
	System.out.println("mainResponse.getStartWorkTime >>> " + mainResponse.getStartWorkTime());
	System.out.println("mainResponse.getLeaveWorkTime >>> " + mainResponse.getLeaveWorkTime());
	
	boolean hasStartWorkTime = mainResponse.getStartWorkTime() != null;
	boolean hasLeaveWorkTime = mainResponse.getLeaveWorkTime() != null;

	MemberDto dto = (MemberDto)session.getAttribute("login");
	String content = (String) request.getAttribute("content");
	if(content == null || content.equals("")) {
		content = "include/content";
	}
%>
 <div align="center" class="item content-1">
  	<%-- <p>어서오세요 <%=dto.getEmployee_name() %> 님</p> --%>
		my profile
		<br>
			<%
				LocalDateTime responseStartTime = mainResponse.getStartWorkTime();
				String startWorkTime = hasStartWorkTime ? responseStartTime.format(DateTimeFormatter.ofPattern("HH:mm:ss")) : null;
				LocalDateTime responseLeaveTime = mainResponse.getLeaveWorkTime();
				String leaveWorkTime = hasLeaveWorkTime ? responseLeaveTime.format(DateTimeFormatter.ofPattern("HH:mm:ss")) : null;
				
				if(hasStartWorkTime && hasLeaveWorkTime){
			%>		
				<div class="startWorkBtnWrap">	
					<%=startWorkTime %>
				</div>			
				<div class="leaveWorkBtnWrap">
					<%=leaveWorkTime %>
				</div>
			<%		
				}else if(!hasStartWorkTime && !hasLeaveWorkTime){
			%>
				<div class="startWorkBtnWrap">	
					<button class="startWorkBtn" onclick="startWork()"> 출근</button>
				</div>	
				<div class="leaveWorkBtnWrap">
					<button class="leaveWorkBtn" onclick="leaveWork()" disabled="disabled">퇴근</button>
				</div>
			<%		
				}else if(hasStartWorkTime && !hasLeaveWorkTime){
			%>
				<div class="startWorkBtnWrap">	
					<%=startWorkTime %>
				</div>
				<div class="leaveWorkBtnWrap">
					<button class="leaveWorkBtn" onclick="leaveWork()">퇴근</button>
				</div>
			<%
				}
			%>
  	
  </div>
 
 <div class="item content-2">
	<a href="announcementmain.do">공지사항</a>
  	<jsp:include page="/WEB-INF/views/main_announce.jsp"></jsp:include>
 </div>
 
 <div class="item content-3"><p>달력</p></div>
