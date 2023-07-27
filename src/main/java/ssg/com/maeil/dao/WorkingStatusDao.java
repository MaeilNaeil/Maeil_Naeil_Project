package ssg.com.maeil.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ssg.com.maeil.dto.MonthlyWorkDto;
import ssg.com.maeil.dto.WorkingStatusDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;

public interface WorkingStatusDao {

	LocalDateTime insertStartWorkTime(int employeeId);
	LocalDateTime insertLeaveWorkTime(int employeeId);
	WorkingStatusTimeDto selectWorkingStatusTime(int employeeId);
	List<MonthlyWorkDto> selectMonthlyWork(int employeeId, LocalDate inputDate);
	List<HashMap<String, Object>> selectWorkingStatus(int employeeId);
}
