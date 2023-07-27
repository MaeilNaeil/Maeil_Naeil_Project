package ssg.com.maeil.serviceImpl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.maeil.daoImpl.WorkingStatusDaoImpl;
import ssg.com.maeil.dto.MonthlyWorkDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;
import ssg.com.maeil.service.WorkingStatusService;

@Service
public class WorkingStatusServiceImpl implements WorkingStatusService{
	
	@Autowired
	WorkingStatusDaoImpl dao;

	@Override
	public LocalDateTime insertStartWorkTime(int employeeId) {
		return dao.insertStartWorkTime(employeeId); // 현재 시간 
		
	}
	

	@Override
	public LocalDateTime insertLeaveWorkTime(int employeeId) {
		return dao.insertLeaveWorkTime(employeeId);
	}

	@Override
	public WorkingStatusTimeDto getWorkingStatusTime(int employeeId) {
		return dao.selectWorkingStatusTime(employeeId);
	}


	@Override
	public List<HashMap<String, Object>> getWorkingStatus(int employeeId) {
		return dao.selectWorkingStatus(employeeId);
	}


	@Override
	public List<MonthlyWorkDto> getMonthlyWork(int employeeId, LocalDate inputDate) {
		return dao.selectMonthlyWork(employeeId, inputDate);
	}


}
