package util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;


import ssg.com.maeil.dto.CalendarDto;




public class CalendarUtil {
	 
	public static boolean nvl(String msg) {
		return msg == null ||msg.trim().equals("")?true:false;
	}
		
	
	
	public static String two(String msg) {
		return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
		
	
	
	public static String one(String msg) {
		return msg.charAt(0)=='0'?msg.charAt(1)+"":msg;
	}
		
	
	
	public static String daylist(int year, int month, int day) {
		String str = "";
		
		str += String.format("&nbsp;<a href='caldaylist.do?year=%d&month=%d&day=%d' style='color: black'><strong>", year, month, day);
		
		str += String.format("%2d", day);
		str += "</strong></a>";
		
		return str;
	}
	
	
	
	public static String calwrite(int year, int month, int day) {
		String str = "";
		
		String img = "<img src='./images/pen2.png' width='18px' height='18px' title='일정추가'>";
		
		str = String.format("<a href='calwrite.do?year=%d&month=%d&day=%d'>%s</a>", year, month, day, img);

		return str;		
	}
		
	
	public static String maindot3(String msg) {
		String str = "";
		if(msg.length() >= 3) {
			str = msg.substring(0, 3);
			str += "...";
		} else {
			str = msg.trim();
		}
		return str;
	}
	
	public static String dot3(String msg) {
		String str = "";
		if(msg.length() >= 10) {
			str = msg.substring(0, 10);
			str += "...";
		} else {
			str = msg.trim();
		}
		return str;
	}
		
	public static String daylistdot3(String msg) {
		String str = "";
		if(msg.length() >= 20) {
			str = msg.substring(0, 20);
			str += "...";
		} else {
			str = msg.trim();
		}
		return str;
	}
	
	
	public static String makeTable(int year, int month, int day, List<CalendarDto> list) {
		String str = "";
						
		String dates = (year + "") + two(month + "") + two(day + "");
		
		str += "<table>";
		
		for(CalendarDto dto: list) {
			if(dto.getRdate().substring(0, 8).equals(dates)) {
				str += "<tr>";
				str += "	<td style='padding: 0px'>";
				str += "		<a href='caldetail.do?seq=" + dto.getSeq() + "'>";
				str += "			<font style='font-size: 10px; color:rgb(78, 79, 235);'>";
				str += 					dot3(dto.getTitle());
				str += "			</font>";
				str += "		</a>";
				str += "	</td>";
				str += "</tr>";
			}
		}		
		str += "</table>";
		
		return str;		
	}
	
	
	
	public static String mainmakeTable(int year, int month, int day, List<CalendarDto> list) {
		String str = "";
						
		String dates = (year + "") + two(month + "") + two(day + "");
		
		if(list != null) {
			str += "<table>";
			
			for(CalendarDto dto: list) {
				
				if(dto.getRdate().substring(0, 8).equals(dates)) {
					str += "<tr>";
					str += "	<td style='padding: 0px'>";
					str += "		<a href='caldetail.do?seq=" + dto.getSeq() + "'>";
					str += "			<font style='font-size: 10px; color:rgb(78, 79, 235);'>";
					str += 					maindot3(dto.getTitle());
					str += "			</font>";
					str += "		</a>";
					str += "	</td>";
					str += "</tr>";
				}
			}		
			str += "</table>";
			
		} else {	
		
					str += "<table>";
					str += "<tr>";
					str += "	<td>";					
					str += "	</td>";
					str += "</tr>";
					str += "</table>";		
		}
		return str;		
	}
		
		
	
	public static String toDates(String mdate) {		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 kk시 mm분");
		
		String s = mdate.substring(0, 4) + "-"
				 + mdate.substring(4, 6) + "-"
				 + mdate.substring(6, 8) + " "
				 + mdate.substring(8, 10) + ":"
				 + mdate.substring(10) + ":00";
		Timestamp d = Timestamp.valueOf(s);
				
		return sdf.format(d);
	}
	
	
}










