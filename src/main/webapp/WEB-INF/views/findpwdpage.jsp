<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>


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
<h1>비밀번호 찾기</h1>
</div>
<hr/>
<p>아이디를 입력하세요.</p>
사원번호 : <input type="text" name="employee_id" id="employee_id" />
<p>마이페이지에 등록하신 이메일을 입력하세요.</p>
이메일 : <input type="text" name="employee_email" id="employee_email" />

<hr/>
<p align="center">
<input type="button" onclick="findpwd()" value="비밀번호 찾기" />
</p>

<hr/>
<p align="center">
<input type="button" onclick="back()" value="뒤로" />
<input type="button" onclick="exit()" value="닫기" />
</p>


<script>

function findpwd() {
	
	if($("#employee_id").val().trim() == null || $("#employee_id").val().trim() == "") {
		alert("사원번호를 입력하세요");
		return;
	}
	if($("#employee_email").val().trim() == null || $("#employee_email").val().trim() == "") {
		alert("이메일을 입력하세요");
		return;
	}
	
	$.ajax ({
		url:"findpwd.do",
		type:"post",
		data:{ 
			employee_id:$("#employee_id").val().trim(),
		    employee_email:$("#employee_email").val().trim()
	    },
		success: function( response ) {
			/* alert(response); */
			if(response === "NoId" ) {
				alert("사원번호를 확인해주세요.");
				return;
			} else if (response === "NoEmail") {
				alert("이메일을 확인해주세요.");
				return;
			} else {
				alert("메일을 발송했습니다.");
			}
				
		},
		error: function() {
			alert("잘못 입력하셨습니다");
		}	
	});	
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