package ssg.com.maeil.dto;

import java.io.Serializable;

public class CalendarParam implements Serializable {
	
	private int seq;
	private int employee_id;
	private int department_id;
	private String title;
	private String content;
	private int share;
	private int auth;
	private String rdate;
	private String wdate;
	private String yyyyMMdd;
	private String yyyyMM;
	
	public CalendarParam() {
		
	}
	
	
	
	public CalendarParam(int seq, int employee_id, int department_id, int share, int auth, String yyyyMMdd, String title, String rdate) {
		super();		
		this.employee_id = employee_id;
		this.department_id = department_id;		
		this.share = share;
		this.auth = auth;		
		this.yyyyMMdd = yyyyMMdd;		
	}



	public CalendarParam(int employee_id, int department_id, int share, int auth) {
		super();
		this.employee_id = employee_id;
		this.department_id = department_id;
		this.share = share;
		this.auth = auth;		
	}

	public CalendarParam(int employee_id, int department_id, int share, int auth, String yyyyMM) {
		super();
		this.employee_id = employee_id;
		this.department_id = department_id;
		this.share = share;
		this.auth = auth;
		this.yyyyMM = yyyyMM;
	}

	public CalendarParam(int seq, int employee_id, int department_id, String title, String content, int share, int auth,
			String rdate) {
		super();
		this.seq = seq;
		this.employee_id = employee_id;
		this.department_id = department_id;
		this.title = title;
		this.content = content;
		this.share = share;
		this.auth = auth;
		this.rdate = rdate;
		
	}

	public CalendarParam(int seq, int employee_id, int department_id, String title, String content, int share, int auth,
			String rdate, String wdate, String yyyyMMdd, String yyyyMM) {
		super();
		this.seq = seq;
		this.employee_id = employee_id;
		this.department_id = department_id;
		this.title = title;
		this.content = content;
		this.share = share;
		this.auth = auth;
		this.rdate = rdate;
		this.wdate = wdate;
		this.yyyyMMdd = yyyyMMdd;
		this.yyyyMM = yyyyMM;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public int getShare() {
		return share;
	}

	public void setShare(int share) {
		this.share = share;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getYyyyMMdd() {
		return yyyyMMdd;
	}

	public void setYyyyMMdd(String yyyyMMdd) {
		this.yyyyMMdd = yyyyMMdd;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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
		
	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	
	
	public String getYyyyMM() {
		return yyyyMM;
	}



	public void setYyyyMM(String yyyyMM) {
		this.yyyyMM = yyyyMM;
	}



	@Override
	public String toString() {
		return "CalendarParam [seq=" + seq + ", employee_id=" + employee_id + ", department_id=" + department_id
				+ ", title=" + title + ", content=" + content + ", share=" + share + ", auth=" + auth + ", rdate="
				+ rdate + ", wdate=" + wdate + ", yyyyMMdd=" + yyyyMMdd + ", yyyyMM=" + yyyyMM + "]";
	}


	
	
	
}
