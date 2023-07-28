package ssg.com.maeil.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MonthlyWorkResponse {
    private String employeeName;
    
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
    private LocalDateTime startWorkTime;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
    private LocalDateTime leaveWorkTime;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate workingDate;
	
    private LocalDate inputDate;
    
    public MonthlyWorkResponse() {
		// TODO Auto-generated constructor stub
	}

	public MonthlyWorkResponse(String employeeName, LocalDateTime startWorkTime, LocalDateTime leaveWorkTime,
			LocalDate workingDate, LocalDate inputDate) {
		super();
		this.employeeName = employeeName;
		this.startWorkTime = startWorkTime;
		this.leaveWorkTime = leaveWorkTime;
		this.workingDate = workingDate;
		this.inputDate = inputDate;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
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

	public LocalDate getInputDate() {
		return inputDate;
	}

	public void setInputDate(LocalDate inputDate) {
		this.inputDate = inputDate;
	}
    
    
}
