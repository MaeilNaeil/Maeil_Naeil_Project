<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="ssg.com.maeil.controller.MainResponse"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto dto = (MemberDto)session.getAttribute("login");
	String lowerFileName;
	
	if(dto == null || (dto.getEmployee_id()+"") == "" ||(dto.getEmployee_id()+"") == null) {
		%>
		<script>
		alert("로그인해주세요");
		location.href="login.do";
		</script>
		<%
	}
	
		if(dto.getNewfilename() != null && !dto.getNewfilename().isEmpty()) {
			lowerFileName = dto.getNewfilename().toLowerCase();
		} else {
			lowerFileName = "base.PNG"; 
		}

	
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
<title>Is Best를 방문해주셔서 감사합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<<<<<<< HEAD
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">  --%>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css">
=======
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>
.imgfile {
	width:75px;
	height:100px;
}

</style>

>>>>>>> 9e566dd019a7e563e0a6a49a9d1690f530bc6ab0
</head>
<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	
	
	<!-- TODO : 로고 조절 / nav margin / 달력<->공지 / 태깅꾸미기 -->
	
  
  <div align="center" class="item content-1">
  	<%-- <p>어서오세요 <%=dto.getEmployee_name() %> 님</p> --%>
		<img src="http://localhost:9300/springSamples/upload/<%=lowerFileName %>" alt="프로필 이미지" class="imgfile">
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
  <div class="item content-2"><a href="announcementmain.do">공지사항</a></div>
  <div class="item content-3"><p>달력</p></div>
  
  <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
 
</div>
</body>
<script type="text/javascript">

	
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
			if(confirm("출근 등록하시겠습니까?")){
				$(document).ready(function(){			
					$.ajax({
						url:"startWork.do",
						type:"post",
						data:{ employeeId:2 },
						<%-- data:{ employeeId:<%=dto.getEmployee_id() %> }, --%>
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
		}
</script>


</html>