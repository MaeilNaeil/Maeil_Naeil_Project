<%@page import="ssg.com.maeil.controller.MonthlyWorkInfo"%>
<%@page import="ssg.com.maeil.dto.MonthlyWorkDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Monthly My Work</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css">
	<style type="text/css">
		.fa-solid{
			font-size: 24px;
		}
	</style>
</head>
<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	

<!-- 		<a href="main.do">main</a> -->
<%
	LocalDate date = (LocalDate) request.getAttribute("inquireDate");
	List<MonthlyWorkInfo> monthlyWorkList = (List)request.getAttribute("monthlyWorkList");
	
	
    LocalDate calendarDay = date; //해당 년도와 달의 달력을 가져옴
    int day = calendarDay.getDayOfWeek().getValue(); // 해당 달이 시작하는 요일을 가져옴 (월1-일7)
    int lastDay = calendarDay.lengthOfMonth(); // 해당 달의 일수를 가져옴
    
    // 조회월 마지막일의 요일
    int lastDayTest = LocalDate.of(calendarDay.getYear(), calendarDay.getMonth(),lastDay).getDayOfWeek().getValue();
    // System.out.println(LocalDate.of(calendarDay.getYear(), calendarDay.getMonth(),lastDay));
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월");
    String calendarDayFormat = calendarDay.format(formatter);
    
%>
	<div id="mainContent" class="contentWrap">
		<div >
			<table border="1">
				<col width="120"><col width="120"><col width="120"><col width="120"><col width="120"><col width="120"><col width="120">
				<tr height="80">
					<td colspan="7" align="center">
						<span><i class="fa-solid fa-angles-left" onclick="minusYear()"></i></span>
						<span><i class="fa-solid fa-angle-left" onclick="minusMonth()"></i></span>
						<span><%=calendarDayFormat %></span>
						<span><i class="fa-solid fa-angle-right" onclick="plusMonth()"></i></span>
						<span><i class="fa-solid fa-angles-right" onclick="plusYear()"></i></span>
					</td>
				</tr>
				
				<tr height="30" style="background-color:#000; color:white;">
					<th>sun</th>
					<th>mon</th>
					<th>tus</th>
					<th>wed</th>
					<th>thu</th>
					<th>fri</th>
					<th>sat</th>
				</tr>
				
				<tr height="100" align="left" valign="top">
					<%
					// 첫 주 빈칸 구하는 공식
					if(day<7){
						for(int i=0; i<day; i++){
					%>
					 <td style="background-color: #eeeeee"></td> 
					<%
						}
					}
					
					// 날짜 (월의 마지막날)
					for(int i=1; i<=lastDay; i++){
					%>
						<td style="color:#3c3c3c; padding-top:5px">
							<%=i %>
							<%
							// TODO : server에서 월 전체 리스트(null이면 null인대로)
							// 		  총 데이터 보내주기 
							//      -> ui는 최대한 데이터 가공 없이 출력하는 용도로만 바꾸기 
							if(monthlyWorkList.size() != 0){
								System.out.println("in!!");
								
								for(MonthlyWorkInfo item : monthlyWorkList){
									//System.out.println(item.getWorkingDate().getDayOfMonth());
									
									if(i == item.getWorkingDate().getDayOfMonth()){
										DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
			    						
										if(item.getStartWorkTime()!=null){
											String startTimeFormat = item.getStartWorkTime().format(timeFormatter);
										%>
											<div>출근 : <%=startTimeFormat %></div>
										<%
										if(item.getLeaveWorkTime()!=null){
											String leaveTimeFormat = item.getLeaveWorkTime().format(timeFormatter);
											%>
												<div>퇴근 : <%=leaveTimeFormat %></div>
											<%
											}else{
											%>
												<div>-</div>
											<%	
											}
										}
									}
								}
							} 
							
							
							%>
						</td>
					<%	
					// 7칸씩 row 끊어주기 
					// i와 lastday가 같으면 개행 하지 않는다. 
						if((i+day) % 7 == 0 && i != lastDay){
					%>
						</tr><tr height="100" align="left" valign="top">
					<%	
						}
					 }
					// 아래쪽 빈칸
					int drawGrayCount = 0;
					if(lastDayTest == 7) {
						drawGrayCount = 6;
					} else {
						drawGrayCount = 6-lastDayTest ;				
					}
					 for(int i = 0; i < drawGrayCount; i++ ){
					%>	
					 <td style="background-color: #eeeeee"></td> 
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
<script>
	const minusYear = () => {
		<%LocalDate minusOneYear = calendarDay.minusYears(1); %>
		location.href = "monthlyMyWork.do?inputDate=<%=minusOneYear %>"
	}
	const minusMonth = () => {
		<%LocalDate minusOneMonth = calendarDay.minusMonths(1); %>
		location.href = "monthlyMyWork.do?inputDate=<%=minusOneMonth %>"
	}
	const plusMonth = () => {
		<%LocalDate plusOneMonth = calendarDay.plusMonths(1); %>
		location.href = "monthlyMyWork.do?inputDate=<%=plusOneMonth %>"
	}
	const plusYear = () => {
		<%LocalDate plusOneYear = calendarDay.plusYears(1); %>
		location.href = "monthlyMyWork.do?inputDate=<%=plusOneYear %>"
	}
</script>
</html>