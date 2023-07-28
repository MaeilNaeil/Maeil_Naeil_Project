package ssg.com.maeil.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;

import ssg.com.maeil.dto.MonthlyWorkDto;
import util.DateUtil;

public class MonthlyWorkInfo {
	private LocalDateTime startWorkTime;
	private LocalDateTime leaveWorkTime;
	private LocalDateTime workingDate;
	
	public MonthlyWorkInfo() {
		// TODO Auto-generated constructor stub
	}
	
	

	public MonthlyWorkInfo(MonthlyWorkDto dto) {
		this.startWorkTime = DateUtil.stringToLocalDateTime(dto.getStartWorkTime());
		this.leaveWorkTime = DateUtil.stringToLocalDateTime(dto.getLeaveWorkTime());
		this.workingDate = DateUtil.stringToLocalDateTime(dto.getWorkingDate());
	}



	public MonthlyWorkInfo(LocalDateTime startWorkTime, LocalDateTime leaveWorkTime, LocalDateTime workingDate) {
		super();
		this.startWorkTime = startWorkTime;
		this.leaveWorkTime = leaveWorkTime;
		this.workingDate = workingDate;
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



	public LocalDateTime getWorkingDate() {
		return workingDate;
	}



	public void setWorkingDate(LocalDateTime workingDate) {
		this.workingDate = workingDate;
	}

	
	

}
