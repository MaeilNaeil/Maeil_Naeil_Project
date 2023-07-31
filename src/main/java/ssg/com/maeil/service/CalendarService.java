package ssg.com.maeil.service;

import java.util.List;


import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;

public interface CalendarService {

	
	List<CalendarDto> callist(CalendarParam param);
	
	List<CalendarDto> caldaylist(CalendarParam param);
	
	List<CalendarDto> maincallist(CalendarParam param);
	
	CalendarDto caldetail(int seq);
	
	boolean calwrite(CalendarDto dto, String rdate);	
	
	boolean calupdate(CalendarDto dto);
	
	boolean caldelete(CalendarParam param);
	
}
