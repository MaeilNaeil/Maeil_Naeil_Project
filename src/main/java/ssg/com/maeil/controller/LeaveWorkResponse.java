package ssg.com.maeil.controller;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class LeaveWorkResponse {
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private LocalDateTime leaveWorkTime;
	private boolean alreadyHasTime;
	
	public LeaveWorkResponse() {
		// TODO Auto-generated constructor stub
	}

	public LeaveWorkResponse(LocalDateTime leaveWorkTime, boolean alreadyHasTime) {
		super();
		this.leaveWorkTime = leaveWorkTime;
		this.alreadyHasTime = alreadyHasTime;
	}

	public LocalDateTime getLeaveWorkTime() {
		return leaveWorkTime;
	}

	public void setLeaveWorkTime(LocalDateTime leaveWorkTime) {
		this.leaveWorkTime = leaveWorkTime;
	}

	public boolean isAlreadyHasTime() {
		return alreadyHasTime;
	}

	public void setAlreadyHasTime(boolean alreadyHasTime) {
		this.alreadyHasTime = alreadyHasTime;
	}


	

	
	
	
}
