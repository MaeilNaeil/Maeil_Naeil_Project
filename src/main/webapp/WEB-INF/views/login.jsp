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
.image-box {
	    width:2100px;
	    height:600px;
	    overflow:hidden;
	    margin:0 auto;
	}
	
	.image-thumbnail {
}
.image-thumbnail {
	    width:100%;
	    height:100%;
	    object-fit:cover;
	}
}
table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
</style>


</head>

<body>

<form action="loginAf.do" method="post">
<div align="center" class="image-box">
	<img class="image-thumbnail"src="https://previews.123rf.com/images/morris71/morris712204/morris71220400215/185005523-%ED%9D%90%EB%A6%B0-%ED%91%B8%EB%A5%B8-%ED%95%98%EB%8A%98-%EB%B0%B0%EA%B2%BD%EC%9C%BC%EB%A1%9C-%EC%9C%A0%EB%A6%AC-%EA%B1%B4%EB%AC%BC%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%9C%A0%EB%A6%AC%EC%9D%98-%EA%B0%95%EC%B2%A0-%EB%B0%9D%EC%9D%80-%ED%8C%8C%EB%9E%80%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%97%90-%EB%8C%80%ED%95%9C-%EC%9B%90%EA%B7%BC-%EA%B4%91%EA%B0%81-%EB%B3%B4%EA%B8%B0-%EB%AF%B8%EB%9E%98%EC%9D%98-%EC%83%81%EC%97%85-%ED%98%84%EB%8C%80-%EB%8F%84%EC%8B%9C-%EC%84%B1%EA%B3%B5%EC%A0%81%EC%9D%B8-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98%EC%9D%98.jpg" alt ="이미지">
</div>
<hr/>

<div align="center">
	<table>
		<tr>
			<th>사원번호&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>사원번호&emsp;</th>
			<td>
				<input type="text" id="employee_id" style="padding-left: 10px;" name="employee_id" placeholder="아이디를 입력하세요">
				<input type="text" id="employee_id" style="padding-left: 10px;" name="employee_id" class="form-control" placeholder="아이디를 입력하세요">
			</td>
		</tr>
		<tr>	
			<th>패스워드&nbsp;&nbsp;&nbsp;&nbsp;</th>
			<th>패스워드&emsp;</th>
			<td>
				<input type="password" id="employee_password" style="padding-left: 10px;" name="employee_password">
				<input type="password" id="employee_password" style="padding-left: 10px;" name="employee_password" class="form-control">
			</td>
		</tr>
		<tr class="space"></tr>
		<tr>
			<td colspan="2">
			<input type="button" onclick="find()" value="사원번호 / 비밀번호 찾기">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" onclick="login()" value="로그인">
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
	window.open('find.do','ID / 비밀번호찾기','width=430,height=500,location=no,status=no,scrollbars=yes');
	window.open('find.do','ID / 비밀번호찾기','width=450,height=570,location=no,status=no,scrollbars=yes');
}


</script>



</body>

</html>