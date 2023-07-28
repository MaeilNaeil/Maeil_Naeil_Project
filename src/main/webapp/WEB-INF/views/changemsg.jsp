<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String changepwd = (String)request.getAttribute("changemsg");


if(changepwd.equals("CHANGE_YES")){		
	%>
	<script>
	alert("비밀번호가 변경되었습니다.");
	window.close();
	</script>
	<%
}else{
	%>
	<script>
	alert("비밀번호 변경에 실패하셨습니다.");
	window.close();
	</script>
	<%	
	
}


%>