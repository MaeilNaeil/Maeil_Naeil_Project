package ssg.com.maeil.dto;

import java.io.Serializable;

public class AnnouncementDto implements Serializable{
	
	@Override
	public String toString() {
		return "AnnouncementDto [seq=" + seq + ", employee_id=" + employee_id + ", title=" + title + ", content="
				+ content + ", writing_period=" + writing_period + ", auth=" + auth + ", type=" + type + ", del=" + del
				+ "]";
	}

	private int seq;
	private int employee_id;
	private String title;
	private String content;
	private String writing_period;
	private int auth;
	private String type;
	private int del;
	private String employee_name;
	public AnnouncementDto() {
	}

	
	public AnnouncementDto(String title, String content, String type) {
		super();
		this.title = title;
		this.content = content;
		this.type = type;
	}


	public AnnouncementDto(int seq, int employee_id, String title, String content, String writing_period, int auth,
			String type, int del) {
		super();
		this.seq = seq;
		this.employee_id = employee_id;
		this.title = title;
		this.content = content;
		this.writing_period = writing_period;
		this.auth = auth;
		this.type = type;
		this.del = del;
		this.employee_name = employee_name;
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

	public String getWriting_period() {
		return writing_period;
	}

	public void setWriting_period(String writing_period) {
		this.writing_period = writing_period;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getEmployee_name() {
		return employee_name;
	}


	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	
	
}
