package ssg.com.maeil.service;

import java.util.List;

import ssg.com.maeil.dto.LeaveDto;

public interface LeaveService {

	List<LeaveDto> leavelist(LeaveDto dto);
	
	boolean leaveadd(LeaveDto dto);
	
	boolean leavedel(LeaveDto dto);
	
}
