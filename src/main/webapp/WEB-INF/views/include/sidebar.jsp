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
	<ul class="nav_list_wrap">
		<li class="nav_list"><a href="mypage.do" class="nav_item">마이페이지</a></li>
		<li class="nav_list"><a href="calendarlist.do">부서일정관리</a></li>
		<li class="nav_list"><a href="workingStatus.do">일별 근무 현황</a></li>
		<li class="nav_list"><a href="monthlyMyWork.do">월별 나의 근무</a></li>
		<li class="nav_list"><a href="announcementmain.do">공지사항</a></li>
	<%
	if(dto.getAuth()==3){
	%>
		<li class="nav_list"><a href="newemployee.do">사원 추가</a></li>
	<%
	}
	%>
	</ul>
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