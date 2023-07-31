<%@page import="util.CalendarUtil"%>
<%@page import="ssg.com.maeil.dto.CalendarParam"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="ssg.com.maeil.dto.CalendarDto"%>
<%@page import="ssg.com.maeil.dao.CalendarDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	int seq = Integer.parseInt(request.getParameter("seq"));

	CalendarDao dao = (CalendarDao)request.getAttribute("dao");
	CalendarDto cal = (CalendarDto)request.getAttribute("caldto");	
	
	MemberDto login = (MemberDto)session.getAttribute("login");	
	
	int calid = login.getEmployee_id();
	int calauth = login.getAuth();
	int writer = cal.getEmployee_id();
	
	// rdate 문자열 변환(202307250919 => 2023년07월25일09시19분)
	String rdate = cal.getRdate();
	String tordate = CalendarUtil.toDates(rdate);
	
	// share  문자열 변환(1/2 => 공개/비공개)
	int share = cal.getShare();
	String msg = "";
	if(share == 1){
		msg = "공개";
	} else if (share == 2) {
		msg = "비공개";
	}
	
		
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세일정</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonGrid.css">

<style type="text/css">

th, td {		
		border-bottom: 1px solid rgb(216, 217, 218);
		border-left: none;
		padding: 8px;		
		}

th {text-align: center;}

.insty {
		 outline: none;
		 border: none;
		 background-color:transparent;
		 resize: none;
		}

.caldetail {
			text-align: center;				
			border-top: 1px solid rgb(216, 217, 218);
			border-bottom: 1px solid rgb(216, 217, 218);
			border-left: none;
			border-right: none;				
			}

#detailcontent {
				text-align:justify;			
				padding-left: 20px;
				padding-right: 20px;
				height: 450px;
				line-height: 20pt;
				overflow: auto;
				}
				

/* 스크롤바 */
#detailcontent::-webkit-scrollbar {width: 10px;}
#detailcontent::-webkit-scrollbar-thumb {background-color: gray; border-radius: 10px;}
#detailcontent::-webkit-scrollbar-track {border-radius: 10px; box-shadow: inset 0px 0px 5px white;}

/* body 스크롤바 */
#bodyscr {overflow: auto;}
#bodyscr::-webkit-scrollbar {width: 5px;}
#bodyscr::-webkit-scrollbar {height: 5px;}
#bodyscr::-webkit-scrollbar-thumb {background-color: gray; border-radius: 10px;}
#bodyscr::-webkit-scrollbar-track {border-radius: 10px; box-shadow: inset 0px 0px 5px white;}

</style>

</head>
<body id="bodyscr">
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	  <div id="mainContent" class="contentWrap">


<div align="center">
	<form>
		<table class="caldetail">
		<col width="100"><col width="800">
			<thead>
				<tr>
					<th>작성자</th>
					<td>
						<%=cal.getEmployee_id() %>								
					</td>
				</tr>
				<tr>
					<th>일정</th>
					<td>
						<%=tordate %>
					</td>
				</tr>
				<tr>
					<th>공유</th>
					<td>
						<%=msg %>						
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<textarea rows="1" cols="95" class="insty" readonly="readonly"><%=cal.getTitle() %></textarea>
					</td>
				</tr>
				<tr>					
					<td colspan="2">
						<textarea rows="18" cols="95" class="insty" id="detailcontent" readonly="readonly"><%=cal.getContent() %></textarea>						
					</td>
				</tr>			
			</thead>
			<tbody></tbody>		
		</table>
			<br/>
			<button type="button" onclick="calendarlist()" class="btn btn-primary">일정목록</button>			
		<%
		if(calauth == 3 || calid == writer) {
		%>
			<button type="button" onclick="updateCal(<%=cal.getSeq() %>)" class="btn btn-primary">일정수정</button>
			<button type="button" onclick="deleteCal(<%=cal.getSeq() %>)" class="btn btn-primary">일정삭제</button>
		<%	
		}
		%>	
			
	</form>
</div>

<script type="text/javascript">

function calendarlist() {	
	location.href = "calendarlist.do";
}

function updateCal(seq) {	
	location.href = "calupdate.do?seq=" + seq;
}

function deleteCal(seq) {
	location.href = "caldelete.do?seq=" + seq;
}

</script>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>

















