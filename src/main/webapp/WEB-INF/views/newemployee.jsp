<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
</head>
<body>
<div align="center">
    <h1>사원가입</h1>
    <hr>
    <form action="newemployeeAf.do" method="post">
    <table>
        <col width="80"><col width="100"><col width="5"><col width="20">

        <tr>
            <th>사원이름</th>
            <td>
                <input type="text" name="employee_name">
            </td>
        </tr>		
        <tr>
            <th>비밀번호</th>
            <td>
                <input type="text" name="employee_password">
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>
                <input type="text" name="emailname" id="emailname" size="20">	
            </td>
            <td>
                @	
            </td>
            <td>	
                <select name="option" id="option">
                	<option>선택해주세요</option>
                    <option>naver.com</option>
                    <option>gmail.com</option>
                    <option>daum.net</option>
                    <option>기타</option>
                </select>
            </td>
        </tr>
        <tr id="inputBoxRow" style="display: none;">
            <th></th>
            <td colspan="3">
                <input type="text" name="other_email" id="other_email">
            </td>
        </tr>
        <tr>
        	<th></th>
            <td colspan="4">
                <input type="hidden" id="employee_email" name="employee_email">
            </td>
        </tr>
        <tr>
        	<th>부서명</th>
        	<td>
        		<select name="department_name" id="department_name">
        			<option>부서를 선택</option>
        			<option>인사팀</option>
        			<option>영업팀</option>
        			<option>IT팀</option>
        			<option>생산팀</option>
        			<option>마케팅팀</option>
        			<option>재경팀</option>
        		</select>
        	</td>
        </tr>
                <tr>
        	<th>부서번호</th>
        	<td>
        		<input type="text" name="department_id" id="department_id" readonly="readonly">
        	</td>
        </tr>
        <tr>
        	<th>관리자</th>
        	<td>
        		<select name="auth" id="auth">
        			<option value="1">사원</option>
        			<option value="3">관리자</option>
        		</select>
        	</td>
        </tr>
        <tr>
        	<th>직급</th>
        	<td>
        		<input type="text" name="erank">
        	</td>
        </tr>
    </table>
    <table>
    	 <tr>
        	<td align="center">
        		<button type="submit">작성완료</button>
        	</td>
        	<td>
        		<button type="reset">다시 적기</button>
        	</td>
        </tr>
    
    </table>
    </form>
</div>
<script type="text/javascript">
$(document).ready(function() {
    // select 요소 값이 변경될 때 이벤트 처리
    $("#option").change(function() {
        let selectedValue = $(this).val();
        
        // "기타"가 선택되었을 때 추가적인 input 요소를 보여주거나 숨깁니다.
        if (selectedValue === "기타") {
            $("#inputBoxRow").show();
        } else {
            $("#inputBoxRow").hide();
        }

        // 이메일 주소 조합하여 보이기
        combineEmail();
    });

    // 이메일 주소 조합하여 보이기
    function combineEmail() {
    	
        let emailname = $("#emailname").val();
        let optionValue = $("#option").val();
		
        if (optionValue === "기타"||optionValue === "선택해주세요") {
            optionValue = $("#other_email").val(); // "기타"일 경우 추가 입력란의 값을 사용
        }
        let employee_email = emailname + "@" + optionValue;
        $("#employee_email").val(employee_email);
    	
    }


   // 부서명이 변경 시 부서아이디에 입력 처리
    $("#department_name").change(function(){
    	let selectDepartment = $(this).val();
    	if(selectDepartment=="부서를 선택"){
    		alert("부서입력하세요");
    	}else if(selectDepartment=="인사팀"){
    		$("#department_id").val("101");
    	}else if(selectDepartment=="영업팀"){
    		$("#department_id").val("102");
    	}else if(selectDepartment=="IT팀"){
    		$("#department_id").val("103");
    	}else if(selectDepartment=="생산팀"){
    		$("#department_id").val("104");
    	}else if(selectDepartment=="마케팅팀"){
    		$("#department_id").val("105");
    	}else if(selectDepartment=="재경팀"){
    		$("#department_id").val("106");
    	}
    });
});

</script>
</body>
</html>

