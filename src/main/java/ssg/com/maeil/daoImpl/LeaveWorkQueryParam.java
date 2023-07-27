package ssg.com.maeil.daoImpl;

import java.time.LocalDateTime;

public class LeaveWorkQueryParam {
	private int employeeId;
	private LocalDateTime currentTime;
	
	public LeaveWorkQueryParam(int employeeId, LocalDateTime currentTime) {
		super();
		this.employeeId = employeeId;
		this.currentTime = currentTime;
	}
}
