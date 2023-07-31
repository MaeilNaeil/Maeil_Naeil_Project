<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@page import="ssg.com.maeil.dto.AnnouncementSearch"%>
<%@page import="java.util.List"%>
<%@page import="util.AnnouncementUtil"%>
<%@page import="ssg.com.maeil.dto.AnnouncementDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AnnouncementDto> list = (List)request.getAttribute("announcementList");
	int annPage = (Integer)request.getAttribute("annPage");
	
	AnnouncementSearch Annsearch = (AnnouncementSearch)request.getAttribute("Annsearch");
	int pageNumber = Annsearch.getPageNumber();
	String choice = Annsearch.getChoice();
	String search = Annsearch.getSearch();
	MemberDto mem = (MemberDto)session.getAttribute("login");
	

	if(mem == null || (mem.getEmployee_id()+"") == "" ||(mem.getEmployee_id()+"") == null) {
		%>
		<script>
		alert("다시 로그인해주세요.");
		location.href="login.do";
		</script>
		<%
	} 
	
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonGrid.css">


<style type="text/css">
.center{
	margin: 10px 10px 10px 10px;  
	text-align: center;
	
}
th{
	background: royalblue;
	color: white;
} 
tr {
   line-height: 12px;   
}
#searchT{
	margin-left:25px;
	margin-bottom:30px;
	font-size: 30px;
}
.wrap{
	align-content: center;
}
#numbox{
	padding-top: 30px;
}
#searchbox{
	margin-top: 30px;
}
.form-row{
	margin: 0px;

}
.insert-a{
	justify-content: center;
}
</style>
</head>
<body>
<div class="wrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
	  <div id="mainContent" class="contentWrap">
	  
<div class="center">
<h2>공지사항</h2>
<div align="left" id="searchT">
	<a href="announcementmain.do">전체</a>
	<a href="announcementmain.do?choice=type&search=공지">공지</a>
	<a href="announcementmain.do?choice=type&search=행사">행사</a>
	<a href="announcementmain.do?choice=type&search=채용">채용</a>
</div>
<table class="table table-hover">
<col width="50"><col width="500"><col width="80"><col width="100">

<%
if(list == null || list.size() == 0){
%>
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	for(int i = 0;i < list.size(); i++){
		AnnouncementDto ann = list.get(i);
		String date = ann.getWriting_period().substring(0, 10);
		%>
	
		<tr>
				<td><%=ann.getType() %></td>			
				<td style="vertical-align: middle; text-align: left;"">				
					<a href="announcementdetail.do?seq=<%=ann.getSeq() %>">
						<%=AnnouncementUtil.titleDot(ann.getTitle()) %>
					</a>			
				</td>
				<td><%=ann.getEmployee_name() %></td>
				<td><%=date %></td>		
		</tr>
		<% 		
	}
}
	%>
</table>

<div class="form-row align-items-center d-flex justify-content-center align-items-center container" id="numbox">
	<div id="pagination" align="center"></div>
</div>
					<div align="right">
       					<%
       					if(mem.getAuth()==3){
       						%>
       						<h5><a class="insert-a"href="announcementinsert.do">새글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h5>
       						<%
       					}
       					%>		
					</div>
<br>
<div class="form-row align-items-center d-flex justify-content-center align-items-center container" id="searhchbox">
<select id="choice" class="form-control" style="width:auto;">
	<option value="start">검색</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>
<div class="search-box">
	<input type="text" id="search" class="form-control" value="<%=search %>">
</div>
<button type="button" onclick="searchBtn()" class="btn btn-primary">검색</button>
</div>
</div>
<script type="text/javascript">
function searchBtn() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	location.href = "announcementmain.do?choice=" + choice + "&search=" + search;
}

$("#pagination").twbsPagination({
	startPage:<%=pageNumber+1 %>,
	totalPages:<%=annPage %>,
	visiblePages:10,
	first:'<span srid-hidden="true">«</span>',		
	prev:"이전",
	next:"다음",
	last:'<span srid-hidden="true">»</span>',
	initiateStartPageClick:false,				
	onPageClick:function(event, page){
		let choice = $("#choice").val();
		let search = $("#search").val();

		location.href = "announcementmain.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page - 1);
	}
});

</script>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>
</body>
</html>