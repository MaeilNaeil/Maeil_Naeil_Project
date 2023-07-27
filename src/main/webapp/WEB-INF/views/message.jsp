<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String login = (String)request.getAttribute("loginmsg");

if(login != null && login.equals("") == false){
	if(login.equals("LOGIN_NO")){		
		%>
		<script>
		alert("아이디나 비밀번호를 확인해 주십시오");
		location.href = "login.do";
		</script>
		<%	
	}else{
		%>
		<script>
		alert("로그인되었습니다");
		location.href = "main.do";
		</script>
		<%
	}
}


%>