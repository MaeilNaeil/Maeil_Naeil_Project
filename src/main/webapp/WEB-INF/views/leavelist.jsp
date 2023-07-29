<%@page import="java.util.ArrayList"%>
<%@page import="util.CalendarUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="util.LeaveUtil"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.maeil.dto.LeaveDto"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import= "java.text.ParseException"%>
<%@page import= "java.text.SimpleDateFormat"%>
<%@page import= "java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%


	MemberDto mem = (MemberDto)session.getAttribute("login");	
	
	List<LeaveDto> list = (List)request.getAttribute("leavelist");

	for (LeaveDto leaveDto : list) {
		int seq = leaveDto.getSeq();	    
	}	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave List</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript" src="jquery/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style type="text/css">

.trlist:hover {
				color: rgb(255, 255, 255);
				font-weight: bold;
				background-color: rgba(95, 85, 205, 0.5);		
				}

	
option:checked{background-color:rgba(95, 85, 205, 0.2);}
input[type="checkbox"]:checked{width: 17px; height: 17px;}


:root	{
			accent-color: rgb(255, 255, 255);
		}


.table {
			text-align: center;
		}

#delb {
		margin-right: 85px;
	  }
</style>

</head>
<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>

	  <div id="mainContent" class="contentWrap">

<h1>Leave List</h1>
<br/>
<br/>
<a href = "main.do">메인화면</a>
<br/>
<br/>

<%=mem.getEmployee_id() %>님
<br/>
<br/>

<div align="right">
<button type="button" class="btn btn-primary" id="delb" onclick="Leavedel()">삭제</button>
</div>
<br/>
<br/>
<div align="center">
	<form action="leaveaddAf.do" method="post">		
		<table border="1" class="table">		
		<col width="50"><col width="200"><col width="200"><col width="150"><col width="118"><col width="100">
			<thead class="thead-dark">
				<tr>
					<th>No.</th>
					<th>종류</th>										
					<th>시작일</th>
					<th>종료일</th>											
					<th>기간(일)</th>							
					<th>상태</th>
				</tr>						
			</thead>
			<tbody id="tbody">														
				<tr>
					<td><input type="hidden" value="check"></td>
					<td>
 						<select id="type" name="leave_type"> 							
 							<option name="leave_type">선택</option>
 							<option name="leave_type">연차</option>
 							<option name="leave_type">오전반차</option>
 							<option name="leave_type">오후반차</option> 																		
 							<option name="leave_type">공가</option>
 							<option name="leave_type">병가</option>
 						</select>
 					</td> 					
					<td><input type="date" onchange="period()" id="leave_start" name="leave_start" ></td>
 					<td><input type="date" onchange="period()" id="leave_end" name="leave_end" ></td> 								
 					<td><input type="text" size="10" onchange="period()" id="lperiod" readonly="readonly" name="leave_period"> 						
 					</td>
					<td><button type="submit" name="status" class="btn btn-primary" value="save">저장</button></td>
				</tr>
				<tr>		
					<%=LeaveUtil.leavelist(session, list) %>
				</tr>							
			</tbody>
		</table>		
	</form>				
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>





<script type="text/javascript">


function Leavedel(){	
	
	var checkRows = $(".chkbox:checked");				
					
	var seqArray = [];
		
	checkRows.each(function() {
	    seqArray.push($(this).val());
	});

	if (seqArray.length > 0 && seqArray.length < 2) {
			
		var seqStr = seqArray.join(",");
			
		location.href = "leavedel.do?seq=" + seqStr;
		} else {
		     alert("삭제할 행을 하나만 선택해주세요.");
		     return;
		}
		
	checkRows.closest('tr').remove();
		
}
	
	
			
function period(){ 		 
	
	var type = document.getElementById("type").value;
	
	if(type=="선택"){
		alert("종류를 선택해 주세요!");
		return;
	} 	
	
	
	
	var start = document.getElementById("leave_start").value;
	var end = document.getElementById("leave_end").value;	
					
	if(start == "" || end == ""){
		return;
	} 	
				
	var leave_start = start.replaceAll("-", "/");
	var leave_end = end.replaceAll("-", "/");
	
	
	
	if(type == "오전반차" || type == "오후반차"){
		type = "half";
			
	} else if(type == "연차" || type == "병가" || type == "공가"){
		type = "type";
			
	}
			
	
	
	if(type == "half") {
		var lp = "0.5";  		
		$("#lperiod").val(lp);	
	} else {
		const dateA = new Date(leave_start);
		const dateB = new Date(leave_end);
		const diffMSec = dateB.getTime() - dateA.getTime();
		const diffDate = diffMSec / (24 * 60 * 60 * 1000);
	   
		var lp = diffDate + 1 + ""; 
		
		$("#lperiod").val(lp);
	}
			
		
}




</script>


</body>
</html>


