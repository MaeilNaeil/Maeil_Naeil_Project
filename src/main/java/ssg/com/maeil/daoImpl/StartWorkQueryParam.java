package ssg.com.maeil.daoImpl;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

public class StartWorkQueryParam {
	private int employeeId;
	private LocalDateTime currentTime;
	
	public StartWorkQueryParam(int employeeId, LocalDateTime currentTime) {
		super();
		this.employeeId = employeeId;
		this.currentTime = currentTime;
	}
	
	
}
