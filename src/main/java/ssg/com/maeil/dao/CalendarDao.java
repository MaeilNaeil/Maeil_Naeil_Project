package ssg.com.maeil.dao;

import java.util.List;

import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;

public interface CalendarDao {

		
	List<CalendarDto> callist(CalendarParam param);
	
	List<CalendarDto> caldaylist(CalendarParam param);
	
	CalendarDto caldetail(int seq);
	
	
	
	int calwrite(CalendarDto dto, String rdate);	
	
	int calupdate(CalendarDto dto);
	
	int caldelete(CalendarParam param);

	
	
}
