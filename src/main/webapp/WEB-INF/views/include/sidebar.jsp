<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<% MemberDto dto = (MemberDto)session.getAttribute("login"); %>
<div class="item sidebar-1">
	<p id="clock"></p>

	<form action="logout.do">
		<button type="submit">로그아웃</button>
	</form>
</div>
<div class="item sidebar-2" align="center">
	<form action="mypage.do">
		<button type="submit">마이페이지</button>
	</form>
	<form action="calendarlist.do">
		<button type="submit">부서일정관리</button>
	</form>
	<a href="workingStatus.do">일별 근무 현황</a>
	<a href="monthlyMyWork.do">월별 나의 근무</a>
	
	<form action="announcementmain.do" id="frm">
		<button type="submit">공지사항</button>
	</form><br>
	<%
		if(dto.getAuth()==3){
	%>
	<a href="newemployee.do">사원 추가</a>
	<%
		}
	%>
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
</script>
	
</div>