package ssg.com.maeil.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ssg.com.maeil.dto.MonthlyWorkDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;

public interface WorkingStatusService {

	LocalDateTime insertStartWorkTime(int employeeId);
	LocalDateTime insertLeaveWorkTime(int employeeId);
	WorkingStatusTimeDto getWorkingStatusTime(int employeeId);
	List<MonthlyWorkDto> getMonthlyWork(int employeeId, LocalDate inputDate);
	List<HashMap<String, Object>> getWorkingStatus(int employeeId);
}
