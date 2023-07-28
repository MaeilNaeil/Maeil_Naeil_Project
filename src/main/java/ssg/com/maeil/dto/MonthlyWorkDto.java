package ssg.com.maeil.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MonthlyWorkDto {
    
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
    private String startWorkTime;
	
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
    private String leaveWorkTime;
	
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private String workingDate;
	
   public MonthlyWorkDto() {
	// TODO Auto-generated constructor stub
   }

	public MonthlyWorkDto(String startWorkTime, String leaveWorkTime, String workingDate) {
		super();
		this.startWorkTime = startWorkTime;
		this.leaveWorkTime = leaveWorkTime;
		this.workingDate = workingDate;
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

	public String getWorkingDate() {
		return workingDate;
	}

	public void setWorkingDate(String workingDate) {
		this.workingDate = workingDate;
	}
}
