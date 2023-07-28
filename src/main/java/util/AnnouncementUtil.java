package util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AnnouncementUtil {
	
	public static String titleDot(String title) {
		String newTitle;
		
		if(title.length() > 20) {
			newTitle = title.trim().substring(0, 20);
			newTitle += "...";
		}else {
			newTitle = title.trim();
		}	
		
		return newTitle;
	}
	
public static String  toDates(String mdate) {
		
		// 날짜형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		
		String 	s= mdate.substring(0,4) +"-"	// yyyy
				+  mdate.substring(4,6) +"-"	// MM
				+  mdate.substring(6,8) +" "	// dd
				+  mdate.substring(8,10) + ":" 	// hh
				+  mdate.substring(10,12) +":00";	// mm:ss
		
		
		Timestamp d = Timestamp.valueOf(s);
		
		return sdf.format(d);
	}
}
