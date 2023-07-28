package ssg.com.maeil.dto;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class WorkingStatusTimeDto {
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private String startWorkTime;
	
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private String leaveWorkTime;
	
	public WorkingStatusTimeDto() {
		// TODO Auto-generated constructor stub
	}

	public WorkingStatusTimeDto(String startWorkTime, String leaveWorkTime) {
		super();
		this.startWorkTime = startWorkTime;
		this.leaveWorkTime = leaveWorkTime;
	}

	public String getStartWorkTime() {
		return startWorkTime;
	}

	public void setStartWorkTime(String startWorkTime) {
		this.startWorkTime = startWorkTime;
	}

	public String getLeaveWorkTime() {
		return leaveWorkTime;
	}

	public void setLeaveWorkTime(String leaveWorkTime) {
		this.leaveWorkTime = leaveWorkTime;
	}
	
	public static WorkingStatusTimeDto createEmpty() {
		WorkingStatusTimeDto result = new WorkingStatusTimeDto(null, null);
		return result;
		
	}

	
}
