<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@page import="ssg.com.maeil.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	MemberDto dto = (MemberDto)session.getAttribute("login");
	String lowerFileName;

	if(dto == null || (dto.getEmployee_id()+"") == "" ||(dto.getEmployee_id()+"") == null) {
		%>
		<script>
		alert("로그인해주세요");
		location.href="login.do";
		</script>
		<%
	} 

		if(dto.getNewfilename() != null && !dto.getNewfilename().isEmpty()) {
			lowerFileName = dto.getNewfilename().toLowerCase();
		} else {
			lowerFileName = "base.PNG"; 
		}
	
	/* if(lowerFileName != null){
	System.out.println("lowerFileName 값 확인 : " + lowerFileName);
	} */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Is Best를 방문해주셔서 감사합니다.</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>
#mainContent {
	margin-top: 50px;
	padding-left: 200px;
}

.imgfile {
	width:60px;
	height:75px;
}

.content {
    width: 700px;
}

.mypageval {
	border-radius: 10px;
	padding : 5px;
	width: 300px;
	height: 50px;
	font-size: 1.2em;
}

select {
	border-radius: 10px;
	padding : 10px;
	padding-left : 20px;
	width: 300px;
	height: 50px;
	font-size: 1.2em;
	color: black;
	border: 2px solid black;
} 
select[disabled] {
	border-radius: 10px;
	padding : 10px;
	padding-left : 20px;
	width: 300px;
	height: 50px;
	font-size: 1.2em; 
	color: black; /* 텍스트 색상 */
	cursor: not-allowed; /* 커서 모양 */
	border: 2px solid black; /* 테두리 스타일 */
}

th {
	font-size: 1.2em;
	text-align: center;
}

</style>

</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/sidebar.jsp"></jsp:include>
	
  
  <div id="mainContent" class="content">
  	<div align="center">
</div>
<hr/>

<div align="center">
<img src="http://localhost:9300/springSamples/upload/<%=lowerFileName %>" alt="프로필 이미지" class="imgfile">
</div>

<form action="upload.do" method="post" enctype="multipart/form-data">
<div align="center" class="profileImg">
	
	<br/><br/>
	<input type="hidden" name="employee_id" value="<%=dto.getEmployee_id() %>">
	<input type="file" name="fileupload" id="fileupload" style="display:none;">
	<label for="fileupload" class="uploadBtn">사진 등록</label>
	&nbsp;&nbsp;&nbsp;<input type="submit" value="저장">
</div>
</form>

<br/><hr/>

<div class="content">
	<table class="table">
		<tr>
			<th>사번</th>
			<td>
				<input type="text" name="employee_id" id="employee_id" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEmployee_id() %>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="employee_name" id="employee_name" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEmployee_name() %>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>직위</th>
			<td>
				<input type="text" name="erank" id="erank" class="mypageval" style="padding-left: 30px;" value="<%=dto.getErank() %>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="employee_email" id="employee_email" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEmployee_email() %>" readonly="readonly">
				<input type="button" onclick="emailchkBtn()" class="emailchk" name="emailchk" id="emailchk" value="확인"  style="display: none;">
			</td>
		</tr>

		<tr>
			<th>부서명</th>
			<td>
				<select disabled id="department_name" class="mypageSelecteVal">
<%-- 				<option selected="selected" value="<%=dto.getDepartment_name() %>"><%=dto.getDepartment_name() %></option> --%>

					<option class="SelectVal" value="인사팀">인사팀</option>
					<option class="SelectVal" value="영업팀">영업팀</option>
					<option class="SelectVal" value="IT팀">IT팀</option>
					<option class="SelectVal" value="생산팀">생산팀</option>
					<option class="SelectVal" value="마케팅팀">마케팅팀</option>
					<option class="SelectVal" value="재경팀">재경팀</option>
				</select>
			
				<%-- <input type="text" name="department_name" id="department_name" class="mypageval" style="padding-left: 30px;" value="<%=dto.getDepartment_name() %>" readonly="readonly"> --%>
			</td>
		</tr>
		<tr>
			<th>입사일&nbsp;&nbsp;</th>
			<td>
				<input type="text" name="edate" id="edate" class="mypageval" style="padding-left: 30px;" value="<%=dto.getEdate().substring(0,10) %>" readonly="readonly">
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="button" onclick="changeInfo()" class="changeBtn" name="changeInfo" id="changeInfo" value="나의 정보변경">
				<input type="button" onclick="changePwd()" class="changeBtn" name="changePwd" id="changePwd" value="비밀번호 변경">		
				<input type="button" onclick="cancelBtn()" class="changeBtn" name="cancelBtn" id="cancelBtn" value="취소"  style="display: none;">
			</td>
		</tr>
	</table>

</div>
  </div>
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</div>


<script>


let departmentSelect = document.getElementById("department_name");

for(var i = 0; i < departmentSelect.options.length; i++) {
    if(departmentSelect.options[i].value == "<%=dto.getDepartment_name() %>") {
        departmentSelect.options[i].selected = true;
        break;
      }
}


let saveYn = "NO";
let inputEmail;

function emailchkBtn() {
	if($("#employee_email").val().trim() == "") {
		alert("이메일을 입력해주세요.");
		return;
	}
		$.ajax ({
		url: "emailchkBtn.do",
		type: "post",
		data: { employee_email:$("#employee_email").val().trim() },
		success: function( response ) {
		/* 	alert((response)); */
			if( response == "USE_YES") {
				alert("사용가능한 이메일입니다");
				saveYn = "YES";
				return;
			} else if ($("#employee_email").val().trim() == ("<%=dto.getEmployee_email()%>")) {
				alert("현재 사용중인 이메일입니다");
				inputEmail = $("#employee_email").val().trim();
				saveYn = "YES";
				return;
			} else {
				alert("이미 등록된 이메일입니다.")
				$("#employee_email").val("");
				saveYn = "NO";
			}
		},
		error: function(){
			alert("error");
		}
	});
}

function changeInfo() {
	
	// 나의 정보변경 버튼 클릭 시 저장으로 변경
	
	if($("#changeInfo").val() == "나의 정보변경") {

		
		$("#changeInfo").val("저장");
		$("#changePwd").hide();
		$("#cancelBtn").show();
		$("#emailchk").show();
		
	/* $("#department_name option").not(":selected").removeAttr("disabled"); */
		$("#department_name").removeAttr("disabled");
	
	/* 	$("#department_name").removeAttr("readonly"); */
		$("#employee_email").removeAttr("readonly");
		
	} else {

				
		if(inputEmail != $("#employee_email").val().trim() ||saveYn == "NO"){
			alert("이메일을 확인해주세요.");
			return;
		}
		
		// 저장 클릭 시 나의 정보변경으로 변경
		
		$("#changeInfo").val("나의 정보변경");
		$("#changePwd").show();
		$("#cancelBtn").hide();
		$("#emailchk").hide();
		
/*		$("#department_name option").not(":selected").attr("disabled", "disabled"); */
		$("#department_name").attr("disabled", "disabled");

/* 		$("#department_name").attr("readonly", "readonly"); */
		$("#employee_email").attr("readonly", "readonly");
		
		
 		$.ajax ({
			url: "changeInfo.do",
			type: "post",
			contentType: "application/json",
			data: JSON.stringify({
				employee_id: $("#employee_id").val().trim(),
				employee_name: $("#employee_name").val().trim(),
				erank: $("#erank").val().trim(),
				employee_email: $("#employee_email").val().trim(),
				department_name: $("#department_name").val(),
				edate: $("#edate").val().trim(),
			}),
			success: function( response ) {
				if( response == "success" ) {
					alert("정보가 변경되었습니다.");
					saveYn = "NO";
				} else {
					alert("이메일 확인 후 저장해주세요.")
					saveYn = "NO";
				}
			},
			error:function(request, status, error){

			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}

		});
 	
	}

}

function changePwd() {
	window.open('changePwd.do','비밀번호 변경하기','width=430,height=500,location=no,status=no,scrollbars=yes');
}

function cancelBtn() {
	location.href="mypage.do";
}


</script>

</body>

</html>