package ssg.com.maeil.dto;

import java.io.Serializable;

public class CalendarDto implements Serializable {

	private int seq;
	private int employee_id;
	private String title;
	private String content;
	private String rdate;	
	private String wdate;
	private int share;
	
	public CalendarDto() {
		
	}

	
	
	public CalendarDto(int employee_id, String title, String content, String rdate, String wdate, int share) {
		super();
		this.employee_id = employee_id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.wdate = wdate;
		this.share = share;
	}



	public CalendarDto(int seq, int employee_id, String title, String content, String rdate, String wdate, int share) {
		super();
		this.seq = seq;
		this.employee_id = employee_id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.wdate = wdate;
		this.share = share;
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



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getRdate() {
		return rdate;
	}



	public void setRdate(String rdate) {
		this.rdate = rdate;
	}



	public String getWdate() {
		return wdate;
	}



	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	
	
	public int getShare() {
		return share;
	}

	

	public void setShare(int share) {
		this.share = share;
	}



	@Override
	public String toString() {
		return "CalendarDto [seq=" + seq + ", employee_id=" + employee_id + ", title=" + title + ", content=" + content
				+ ", rdate=" + rdate + ", wdate=" + wdate + ", share=" + share + "]";
	}
	
	
	
}
