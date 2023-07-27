<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="ssg.com.maeil.controller.MainResponse"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// MemberDto dto = (MemberDto)session.getAttribute("login");
	MainResponse mainResponse = (MainResponse)request.getAttribute("mainResponse");
	System.out.println("mainResponse.getStartWorkTime >>> " + mainResponse.getStartWorkTime());
	System.out.println("mainResponse.getLeaveWorkTime >>> " + mainResponse.getLeaveWorkTime());
	
	boolean hasStartWorkTime = mainResponse.getStartWorkTime() != null;
	boolean hasLeaveWorkTime = mainResponse.getLeaveWorkTime() != null;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>Is Best를 방문해주셔서 감사합니다.</title>
</head>
<body>

	<div align="center">
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

<a href="workingStatus.do">일별 근무 현황</a>
<a href="monthlyMyWork.do">월별 나의 근무</a>
	
	<script>
		
/* 			const startWork = (employee_id) => {
			const date = new Date();
			const hours = date.getHours();
			const minutes = date.getMinutes();
			const seconds = date.getSeconds();
			const time = hours+":"+minutes+":"+seconds;
			
			alert("start btn click => " + time);

			location.href = "startWork.do";
		}  


        var result = confirm("실행하시겠어요 ?");
        if(result){
            document.write("<h1> 실행합니다. </h1>")
        }else{
            document.write("<h1> 실행하지 않습니다. </h1>")
        } 
*/

	
		const startWorkBtn = document.querySelector(".startWorkBtn");
		const startWorkBtnWrap = document.querySelector(".startWorkBtnWrap");
		const leaveWorkBtn = document.querySelector(".leaveWorkBtn");
		const leaveWorkBtnWrap = document.querySelector(".leaveWorkBtnWrap");
		
		const startWork = () => {
		$(document).ready(function(){			
			$.ajax({
				url:"startWork.do",
				type:"post",
				data:{ employeeId:2 },
				<%-- data:{ employeeId:<%=dto.getEmployee_id() %> }, --%>
				success:function(result){
	/* 			alert(JSON.stringify(result)); */
				
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
		
		
		const leaveWork = () => {
			$(document).ready(function(){
				$.ajax({
					url:"leaveWork.do",
					type:"post",
					data:{ employeeId:2 },
					<%-- data:{ employeeId:<%=dto.getEmployee_id() %> }, --%>
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
	</script>
</body>
</html>