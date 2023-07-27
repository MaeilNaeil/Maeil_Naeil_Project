package ssg.com.maeil.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class WorkingStatusDto {
	
	private int workingId;
	private int employeeId;
	private String workingStatus;
	private LocalDateTime startWorkTime;
	private LocalDateTime leaveWorkTime;
	private LocalDate workingDate;
	
	public WorkingStatusDto() {
		// TODO Auto-generated constructor stub
	}

	public WorkingStatusDto(int workingId, int employeeId, String workingStatus, LocalDateTime startWorkTime,
			LocalDateTime leaveWorkTime, LocalDate workingDate) {
		super();
		this.workingId = workingId;
		this.employeeId = employeeId;
		this.workingStatus = workingStatus;
		this.startWorkTime = startWorkTime;
		this.leaveWorkTime = leaveWorkTime;
		this.workingDate = workingDate;
	}

	public int getWorkingId() {
		return workingId;
	}

	public void setWorkingId(int workingId) {
		this.workingId = workingId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getWorkingStatus() {
		return workingStatus;
	}

	public void setWorkingStatus(String workingStatus) {
		this.workingStatus = workingStatus;
	}

	public LocalDateTime getStartWorkTime() {
		return startWorkTime;
	}

	public void setStartWorkTime(LocalDateTime startWorkTime) {
		this.startWorkTime = startWorkTime;
	}

	public LocalDateTime getLeaveWorkTime() {
		return leaveWorkTime;
	}

	public void setLeaveWorkTime(LocalDateTime leaveWorkTime) {
		this.leaveWorkTime = leaveWorkTime;
	}

	public LocalDate getWorkingDate() {
		return workingDate;
	}

	public void setWorkingDate(LocalDate workingDate) {
		this.workingDate = workingDate;
	}

}
/*
	LocalDate : yyyy mm dd 
	LocalDateTime : yyyymmdd hh:mm:ss
*/
 