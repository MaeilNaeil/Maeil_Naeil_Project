package util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ssg.com.maeil.dto.MemberDto;

public class uploadUtil {

	public static String getNewfileName(String filename, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		MemberDto dto = (MemberDto)session.getAttribute("login");
	
		
		String newfilename = "";
		String fpost ="";
		
		if(filename.indexOf('.') >= 0) {
			fpost = filename.substring(filename.indexOf('.')).toLowerCase();
			newfilename = dto.getEmployee_id() + fpost;
		} else {
			newfilename = dto.getEmployee_id() + ".back";
		}
		return newfilename;
		
	}
	
	
	
}
