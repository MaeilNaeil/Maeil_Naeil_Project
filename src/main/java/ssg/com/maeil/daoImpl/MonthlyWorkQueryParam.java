package ssg.com.maeil.daoImpl;

import java.time.LocalDate;

public class MonthlyWorkQueryParam {
	private int employeeId;
	private LocalDate date;
	
	public MonthlyWorkQueryParam(int employeeId, LocalDate date) {
		super();
		this.employeeId = employeeId;
		this.date = date;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	
	
}
