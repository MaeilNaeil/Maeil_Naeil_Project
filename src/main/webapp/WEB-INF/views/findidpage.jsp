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
.content {
	margin-left: 40px;
}
#employee_email{
	width: 300px;
}
#getid {
	width: 300px;
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
<h3>사원번호 찾기</h3>
</div>
<hr/>
<div class="content">
<p>마이페이지에 등록하신 이메일을 입력하세요.</p>
<p>이메일</p>
<input type="text" name="employee_email" id="employee_email" class="form-control" />
<br/>
<input type="button" onclick="findid()" value="사원번호 찾기" id="inputbtn" class="btn btn-outline-dark" />
</div>
<hr/>

<div class="content">
<p>사원번호</p>
<input type="text" id="getid" class="form-control" readonly="readonly"/>
</div>

<hr/>
<div>
<p align="center">
<input type="button" class="btn btn-outline-dark" onclick="back()" value="뒤로" />
<input type="button" class="btn btn-outline-dark" onclick="exit()" value="닫기" />
</p>
</div>

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
