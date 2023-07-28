package ssg.com.maeil.dto;

import java.io.Serializable;

public class LeaveDto implements Serializable {

	private int seq;
	private int employee_id;
	private String leave_start;
	private String leave_end;
	private String leave_type;
	private String leave_period;
	private String status;
	
	public LeaveDto() {
		
	}

	public LeaveDto(int seq, int employee_id, String leave_start, String leave_end, String leave_type,
			String leave_period, String status) {
		super();
		this.seq = seq;
		this.employee_id = employee_id;
		this.leave_start = leave_start;
		this.leave_end = leave_end;
		this.leave_type = leave_type;
		this.leave_period = leave_period;
		this.status = status;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getLeave_start() {
		return leave_start;
	}

	public void setLeave_start(String leave_start) {
		this.leave_start = leave_start;
	}

	public String getLeave_end() {
		return leave_end;
	}

	public void setLeave_end(String leave_end) {
		this.leave_end = leave_end;
	}

	public String getLeave_type() {
		return leave_type;
	}

	public void setLeave_type(String leave_type) {
		this.leave_type = leave_type;
	}

	public String getLeave_period() {
		return leave_period;
	}

	public void setLeave_period(String leave_period) {
		this.leave_period = leave_period;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "LeaveDto [seq=" + seq + ", employee_id=" + employee_id + ", leave_start=" + leave_start + ", leave_end="
				+ leave_end + ", leave_type=" + leave_type + ", leave_period=" + leave_period + ", status=" + status
				+ "]";
	}
	
	
}
