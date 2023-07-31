<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<style>

input {
	margin-top: 5px;
}
.image-box {
	    /* width: 2100px;
	    height: 600px; */
	    width: 2100px;
	    height: 1000px;
	    overflow:hidden;
	    margin:0 auto;
}
.image-thumbnail {
	    width:100%;
	    height:100%;
	    object-fit:cover;
}
table {
  border-collapse: separate;
  border-spacing: 0 10px;
  margin-left: 500px;
  margin-top: 550px;
}

th {
	color: white;
}
.inputTable {
	
}
</style>


</head>

<body style="background-image:url('https://images.unsplash.com/photo-1523565543073-bf9608b265ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80')">

<form action="loginAf.do" method="post">

<div class="inputTable">
	<table>
		<tr>
			<th>사원번호&emsp;</th>
			<td>
				<input type="text" id="employee_id" style="padding-left: 10px;" name="employee_id" class="form-control" placeholder="아이디를 입력하세요">
			</td>
		</tr>
		<tr>	
			<th>패스워드&emsp;</th>
			<td>
				<input type="password" id="employee_password" style="padding-left: 10px;" name="employee_password" class="form-control">
			</td>
		</tr>
		<tr class="space"></tr>
		<tr>
			<td colspan="2">
			<input type="button" class="btn btn-outline-dark" onclick="find()" value="사원번호 / 비밀번호 찾기">
			&emsp;<input type="button" class="btn btn-outline-dark" onclick="login()" value="로그인">
				
				
			</td>
		</tr>
	</table>
</div>
</form>

<script>

function login() {
	
	if($("#employee_id").val().trim() == "") {
		alert("아이디를 입력하세요");
		return;
	}

	if($("#employee_password").val().trim() == "") {
		alert("비밀번호를 입력하세요");
		return;
	}

	$("form").submit();
}

function find() {
	window.open('find.do','ID / 비밀번호찾기','width=450,height=570,location=no,status=no,scrollbars=yes');
}


</script>



</body>

</html>