<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto dto = (MemberDto)session.getAttribute("login");

	List<HashMap<String, Object>> statusList = (List)request.getAttribute("statusList");
	
	for(HashMap<String, Object> item : statusList ) {
		System.out.println("jsp!!!!! >> "+item.get("employeeId"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test.css">
<title>working status1</title>

<style>
	.table{
		width: 100%;
		height: 500px;
		margin: 10px auto;
		text-align: center;
	}
	.table tbody{
		height: 50px;
	}
</style>
</head>
<body>

<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	<div id="mainContent" class="contentWrap">
		<h2>일별 근무 현황</h2>
	<table class="table">
  		<thead class="thead-dark">
			<tr>
				<th scope="col">부서명</th>
				<th scope="col">이름</th>
				<th scope="col">근무상태</th>
				<th scope="col">출근시간</th>
				<th scope="col">퇴근시간</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(HashMap<String, Object> status : statusList){
					// String startWorkTime = (String)status.get("startWorkTime");
			%>
				<tr>
					<th scope="row"><%=status.get("departmentName") %></th>
					<td><%=status.get("employeeName") %></td>
					<td>
					<%
						if(status.get("workingStatus") == null){
					%>
							<div class="absent">
								미출근
							</div>				
					<%
							
						}else{
							switch((String)status.get("workingStatus")){
								case "in" :
						%>
								<div class="work">
									근무중
								</div>
						<%
									break;
								case "leave" :
						%>
								<div class="leave">
									퇴근
								</div>
						<%
									break;
								case "vacation" : 
						%>
								<div class="vacation">
									휴가중
								</div>
						<%
									break;
								case "absent" :
						%>
								<div class="absent">
									미출근
								</div>
						<%
									break;
								default : 
						%>
								<div class="absent">
										미출근
								</div>
						<%			
									break;
							}
						}
					%>
					</td>
					<!-- “VACATION”, “ABSENT”  -->
					<td>
					<%
						if(status.get("startWorkTime") == null){
					%>
						-
					<%
						}else{
					%>
						<%=status.get("startWorkTime") %>	
					<%		
						}					 
					%>
					</td>
					
					<td>
					<%
						if(status.get("leaveWorkTime") == null){
					%>
						-
					<%
						}else{
					%>
						<%=status.get("leaveWorkTime") %>	
					<%		
						}					 
					%>
					</td>
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>