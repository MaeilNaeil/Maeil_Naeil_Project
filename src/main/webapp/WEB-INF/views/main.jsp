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
	
	String content = (String) request.getAttribute("content");
	if(content == null) {
		content = "/WEB-INF/views/include/content";	
	} else {
		content = "/WEB-INF/views/"+content;
	}
%>

<%-- 
<%
	if(dto == null || (dto.getEmployee_id()+"") == "" ||(dto.getEmployee_id()+"") == null) {
		%>
		<script>
		alert("로그인해주세요");
		location.href="login.do";
		</script>
		<%
	} else {
	
	}
%>
 --%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	<jsp:include page='<%=content + ".jsp" %>'></jsp:include>
  	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
 
</div>
</body>
<script type="text/javascript">
function printTime() {
	var clock = document.getElementById("clock");
	var now = new Date();

	clock.innerHTML =
	(now.getMonth()+1) + "/" +
	now.getDate() + " " +
	now.getHours() + "시 " +
	now.getMinutes() + "분";
	/* + now.getSeconds() + " "; */

	setTimeout("printTime()", 1000);
	}

	window.onload = function() {
	printTime();  
	};

	
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


</html>