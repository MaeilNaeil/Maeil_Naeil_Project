<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto dto = (MemberDto)session.getAttribute("login");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경하기</title>

<style>

.box {
	height: 20px;
	margin-top: 10px;
	border-radius: 5px;
	font-size: 1em;
}

.save {
	border-radius: 10px;
	margin-left: 50px;
	margin-top: 20px;
	height: 30px;
	width: 70px;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
<div align="center">
<h1>비밀번호 변경</h1>
<p>비밀번호는 8자 이상 ~ 16자 이내로 입력하세요.</p><hr/>
</div>
<form action="changepwdAf.do" method="post">
<table>
	<tr>
		<td>
			현재 비밀번호&nbsp;&nbsp;&nbsp;&nbsp; <input type="password" class="box" id="nowpwd" name="employee_password"><br/>
		</td>
	</tr>
	<tr>
		<td>
			변경할 비밀번호&nbsp;&nbsp;<input type="password" class="box" id="newpwd" name="newpwd"><br/>
		</td>
	</tr>
	<tr>
		<td>
			비밀번호 재입력&nbsp; <input type="password" class="box" id="newpwd2"><br/>
		</td>
	</tr>
				<input type="hidden" value="<%=dto.getEmployee_id() %>" name="employee_id">
				
	<tr align="center">
		<td>
			<input type="button" value="완료" class="save" onclick="send()">
		</td>
	</tr>
</table>
</form>

</body>

<script type="text/javascript">

function send() {
	if($("#nowpwd").val().trim() == "" ) {
		alert("현재 비밀번호를 입력하세요.");
		return;
	}
	
	if( $("#newpwd").val().trim().length <= 3 || $("#newpwd").val().trim().length >= 9) {
		alert("4자이상 8자이하를 입력하세요.");
		return;
	}
	
	if($("#nowpwd").val().trim() == $("#newpwd").val().trim()) {
		alert("현재 비밀번호와 같습니다. 다시 입력해주세요")
		return;
	}
	
	if($("#newpwd").val().trim() != $("#newpwd2").val().trim()) {
		alert("재입력 비밀번호를 확인하세요.")
		return;
	}
	
	$("form").submit();
}

</script>


</html>