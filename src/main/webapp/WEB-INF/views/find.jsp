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
.content {
	margin-left: 40px;
}

</style>



<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body>

<div align="center" class="title">
<h1>사원번호 / <br/>비밀번호 찾기</h1>
<h3>사원번호 / <br/>비밀번호 찾기</h3>
</div>
<hr/>

<div>
<p>&nbsp;&nbsp;<input type="button" value="사원번호 찾기" onclick="findid()"></p>
<div class="content">
<p><input type="button" value="사원번호 찾기" onclick="findid()" class="btn btn-outline-dark"></p>
<p>이메일 입력이 필요합니다. <br/>
등록된 이메일을 통해서 아이디를 찾을 수 있습니다.</p>
</div>
<hr/>

<p>&nbsp;&nbsp;<input type="button" value="비밀번호 찾기" onclick="findpwd()"></p>
<div class="content">
<p><input type="button" value="비밀번호 찾기" onclick="findpwd()" class="btn btn-outline-dark"></p>
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