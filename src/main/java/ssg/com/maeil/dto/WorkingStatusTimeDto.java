package ssg.com.maeil.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WorkingStatusTimeDto {
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private LocalDateTime startWorkTime;
	
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private LocalDateTime leaveWorkTime;
	
	public WorkingStatusTimeDto() {
		// TODO Auto-generated constructor stub
	}

	public WorkingStatusTimeDto(LocalDateTime startWorkTime, LocalDateTime leaveWorkTime) {
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
	
	public static WorkingStatusTimeDto createEmpty() {
		return new WorkingStatusTimeDto(null, null);
	}
}
