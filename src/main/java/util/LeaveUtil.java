package util;


import java.util.List;


import javax.servlet.http.HttpSession;

import ssg.com.maeil.dto.LeaveDto;
import ssg.com.maeil.dto.MemberDto;

public class LeaveUtil {

	public static String leavelist(HttpSession session, List<LeaveDto> list) {
		String str = "";
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		 
		
		for(LeaveDto dto: list) {
			if(dto.getEmployee_id() == memberDto.getEmployee_id()) {
				str += "<tr class='trlist'>";
				str += "<td>";
				str += dto.getSeq();				
				str += "</td>";
				str += "<td>";
				str += 	dto.getLeave_type();
				str += "</td>";
				str += "<td>";
				str +=	dto.getLeave_start();
				str += "</td>";
				str += "<td>";
				str +=	dto.getLeave_end();
				str += "</td>";
				str += "<td>";
				str +=	dto.getLeave_period();
				str += "</td>";
				str += "<td><input type='checkbox' class='chkbox' name='checked' value='";
				str += dto.getSeq();
				str += "'>&nbsp;<button type='button' onclick='Leavedel()' class='leavedelete'>삭제</button></td>";
				
			}			
		}		
		str += "</tr>";
		
		return str;		
		
	}
		
	
	
}
