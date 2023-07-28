package ssg.com.maeil.controller;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class StartWorkResponse {
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private LocalDateTime startWorkTime;
	private boolean alreadyHasTime;
	
	public StartWorkResponse() {
	}

	public StartWorkResponse(LocalDateTime startWorkTime, boolean alreadyHasTime) {
		super();
		this.startWorkTime = startWorkTime;
		this.alreadyHasTime = alreadyHasTime;
	}

	public LocalDateTime getStartWorkTime() {
		return startWorkTime;
	}

	public void setStartWorkTime(LocalDateTime startWorkTime) {
		this.startWorkTime = startWorkTime;
	}

	public boolean isAlreadyHasTime() {
		return alreadyHasTime;
	}

	public void setAlreadyHasTime(boolean alreadyHasTime) {
		this.alreadyHasTime = alreadyHasTime;
	}
	
}
