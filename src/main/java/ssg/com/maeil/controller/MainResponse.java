package ssg.com.maeil.controller;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MainResponse {
	
	// @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private LocalDateTime startWorkTime;
	
	// @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private LocalDateTime leaveWorkTime;
	
	public MainResponse() {
		// TODO Auto-generated constructor stub
	}

	public MainResponse(LocalDateTime startWorkTime, LocalDateTime leaveWorkTime) {
		super();
		this.startWorkTime = startWorkTime;
		this.leaveWorkTime = leaveWorkTime;
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
	
}
