package ssg.com.maeil.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MonthlyWorkDto {
    
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
    private LocalDateTime startWorkTime;
	
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
    private LocalDateTime leaveWorkTime;
	
	//@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate workingDate;
	
   public MonthlyWorkDto() {
	// TODO Auto-generated constructor stub
   }

public MonthlyWorkDto(LocalDateTime startWorkTime, LocalDateTime leaveWorkTime, LocalDate workingDate) {
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

public LocalDate getWorkingDate() {
	return workingDate;
}

public void setWorkingDate(LocalDate workingDate) {
	this.workingDate = workingDate;
}
   
   
   
   
   
    
}
