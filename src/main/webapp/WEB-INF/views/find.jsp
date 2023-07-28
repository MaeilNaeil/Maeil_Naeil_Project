<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원번호 / 비밀번호 찾기</title>

<style>
.title {
	margin-top: 30px;
	margin-bottom: 50px;
	
}

</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body>

<div align="center" class="title">
<h1>사원번호 / <br/>비밀번호 찾기</h1>
</div>
<hr/>

<div>
<p>&nbsp;&nbsp;<input type="button" value="사원번호 찾기" onclick="findid()"></p>
<p>이메일 입력이 필요합니다. <br/>
등록된 이메일을 통해서 아이디를 찾을 수 있습니다.</p>
<hr/>

<p>&nbsp;&nbsp;<input type="button" value="비밀번호 찾기" onclick="findpwd()"></p>
<p>사원번호 및 이메일 입력이 필요합니다. <br/>
등록된 이메일을 통해 비밀번호를 발송합니다.</p>
</div>
<hr/>


</body>

<script>
function findid() {
	location.href="findidpage.do";
}

function findpwd() {
	location.href="findpwdpage.do";
}


</script>





</html>