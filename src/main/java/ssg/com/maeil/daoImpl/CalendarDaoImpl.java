package ssg.com.maeil.daoImpl;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.maeil.dao.CalendarDao;
import ssg.com.maeil.dto.CalendarDto;
import ssg.com.maeil.dto.CalendarParam;


@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Cal.";

	
	
	@Override 
	public List<CalendarDto> callist(CalendarParam param) { 
		System.out.println("CalendarDaoImpl callist()" + new Date());			
		return	session.selectList(ns + "calendarlist", param);
	}
	
	
	
	@Override
	public List<CalendarDto> caldaylist(CalendarParam param) {
		System.out.println("CalendarDaoImpl getDayList()" + new Date());	
		return session.selectList(ns + "caldaylist", param);
	}
	

	
	@Override
	public CalendarDto caldetail(int seq) {
		System.out.println("CalendarDaoImpl caldetail()" + new Date());	
		return session.selectOne(ns + "caldetail", seq);
	}

	
	
	@Override
	public int calwrite(CalendarDto dto, String rdate) {
		System.out.println("CalendarDaoImpl calwrite()" + new Date());				
		int count = session.insert(ns + "calwrite", dto);		
		return count;
	}
	
	
	
	@Override
	public int calupdate(CalendarDto dto) {
		System.out.println("CalendarDaoImpl calupdate()" + new Date());
		int count = session.update(ns + "calupdateAf", dto)+1;		
		return count;
	}

	
	
	@Override
	public int caldelete(CalendarParam param) {
		System.out.println("CalendarDaoImpl caldelete()" + new Date());
		int count = session.delete(ns + "caldelete", param);
		return count;
	}

	
	
	
}
