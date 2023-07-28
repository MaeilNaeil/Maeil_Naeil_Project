<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원번호 찾기</title>

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
<h1>사원번호 찾기</h1>
</div>
<hr/>

<p>마이페이지에 등록하신 이메일을 입력하세요.</p>
이메일 : &nbsp;&nbsp;&nbsp;<input type="text" name="employee_email" id="employee_email" />
&nbsp;&nbsp;<input type="button" onclick="findid()" value="사원번호찾기" id="inputbtn" />
<br/><hr/>

사원번호 : <input type="text" id="getid" readonly="readonly"/>
<hr/>
<p align="center">
<input type="button" onclick="back()" value="뒤로" />
<input type="button" onclick="exit()" value="닫기" />
</p>

<script type="text/javascript">
function findid() {
		
	if($("#employee_email").val().trim() == null || $("#employee_email").val().trim() == "") {
		alert("이메일을 입력하세요");
		return;
	} else {

		$.ajax ({
			url:"findid.do",
			type:"post",
			data: { employee_email:$("#employee_email").val().trim() },
			success: function( response ) {
				if(response == "" || response == null){
				alert("등록된 이메일이 아닙니다.")
				return;
				} else {
				$("#getid").val(response);
				}
			},
			error: function() {
				alert("이메일을 확인 후 입력하세요");
			}
		});
	}
}

function back() {
	location.href="find.do";
}

function exit() {
	window.close();
}
</script>

</body>



</html>
