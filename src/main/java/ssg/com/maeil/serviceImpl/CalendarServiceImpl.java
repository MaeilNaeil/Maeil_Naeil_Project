package ssg.com.maeil.serviceImpl;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.maeil.dao.CalendarDao;
import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;
import ssg.com.maeil.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao dao;
		
	
	
	@Override
	public List<CalendarDto> callist(CalendarParam param) {
		System.out.println("CalendarServiceImpl callist()" + new Date());		
		return dao.callist(param);			
	}
	
	
	
	@Override
	public List<CalendarDto> caldaylist(CalendarParam param) {
		System.out.println("CalendarServiceImpl getDayList()" + new Date());		
		return dao.caldaylist(param);
	}
	
	
	
	@Override
	public CalendarDto caldetail(int seq) {
		System.out.println("CalendarServiceImpl caldetail()" + new Date());		
		return dao.caldetail(seq);
	}
	
	
	
	@Override
	public List<CalendarDto> maincallist(CalendarParam param) {
		System.out.println("CalendarServiceImpl maincallist()" + new Date());		
		return dao.maincallist(param);	
	}
	
	
	
	@Override
	public boolean calwrite(CalendarDto dto, String rdate) {
		System.out.println("CalendarServiceImpl calwrite()" + new Date());		
		return dao.calwrite(dto, rdate)>0?true:false;
	}
	
	

	@Override
	public boolean calupdate(CalendarDto dto) {
		System.out.println("CalendarServiceImpl calupdate()" + new Date());		
		return dao.calupdate(dto)>=1?true:false;
	}

	

	@Override
	public boolean caldelete(CalendarParam param) {
		System.out.println("CalendarServiceImpl caldelete()" + new Date());
		return dao.caldelete(param)>0?true:false;
	}
	
	
	
}
