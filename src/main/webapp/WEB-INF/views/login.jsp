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


</head>

<body>

<form action="loginAf.do" method="post">
<div align="center">
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="employee_id" name="employee_id" placeholder="아이디를 입력하세요">
			</td>
		</tr>
		<tr>	
			<th>패스워드</th>
			<td>
				<input type="password" id="employee_password" name="employee_password">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
</div>
</form>




</body>

</html>