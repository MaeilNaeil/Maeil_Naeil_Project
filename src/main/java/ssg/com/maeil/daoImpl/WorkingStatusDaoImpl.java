package ssg.com.maeil.daoImpl;


//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.maeil.dao.WorkingStatusDao;
import ssg.com.maeil.dto.MonthlyWorkDto;
import ssg.com.maeil.dto.WorkingStatusDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;

@Repository
public class WorkingStatusDaoImpl implements WorkingStatusDao{
	
	@Autowired
	SqlSessionTemplate session;

	String namespace = "WorkingStatus.";
	
	@Override
	public LocalDateTime insertStartWorkTime(int employeeId) {
		LocalDateTime currentTime = LocalDateTime.now();
		StartWorkQueryParam queryParam = new StartWorkQueryParam(employeeId, currentTime);

		int result = session.insert(namespace+"insertStartWork", queryParam);
		
		System.out.println("insert start work - query result >>>" + result);
		return currentTime;
	}



	@Override
	public LocalDateTime insertLeaveWorkTime(int employeeId) {
		LocalDateTime currentTime = LocalDateTime.now();
		LeaveWorkQueryParam queryParam = new LeaveWorkQueryParam(employeeId, currentTime);
		
		int result = session.update(namespace+"insertLeaveWork", queryParam);
		
		System.out.println("insert leave work - query result >>>" + result);
		return currentTime;
	}


	public WorkingStatusTimeDto selectWorkingStatusTime(int employeeId) {
		WorkingStatusTimeDto timeDto = session.selectOne(namespace+"selectWorkingStatusTime", employeeId);

		if(timeDto == null ) {
			// return new WorkingStatusTimeDto(null, null);
			return WorkingStatusTimeDto.createEmpty();
		}
		System.out.println("select WoringStatus time >>> " + timeDto.getStartWorkTime() +" & "+ timeDto.getLeaveWorkTime());
		return timeDto;
	}
	
	public List<MonthlyWorkDto> selectMonthlyWork(int employeeId, LocalDate date){
		MonthlyWorkQueryParam queryParam = new MonthlyWorkQueryParam(employeeId, date);
		List<MonthlyWorkDto> queryResponse = session.selectList(namespace+"selectMonthlyWork", queryParam);
		return queryResponse;
	}

	@Override
	public List<HashMap<String, Object>> selectWorkingStatus(int employeeId) {
		List<HashMap<String, Object>> queryResponse = session.selectList(namespace+"selectStatus", employeeId);	
		return queryResponse;
	}
}

