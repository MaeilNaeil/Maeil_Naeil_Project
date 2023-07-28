package ssg.com.maeil.dao;

import java.util.List;

import ssg.com.maeil.dto.LeaveDto;

public interface LeaveDao {

	List<LeaveDto> leavelist(LeaveDto dto);
	
	int leaveadd(LeaveDto dto);	
	
	int leavedel(LeaveDto dto);		
}
