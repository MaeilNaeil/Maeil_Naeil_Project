package ssg.com.maeil.dto;

public class MemberDto {

	private int employee_id;			// 사번( == id )
	private String employee_name;
	public String getNewpwd() {
		return newpwd;
	}



	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	private String employee_password;
	private String employee_email;
	private int department_id;			// 부서번호
	private String department_name;		// 부서명
	private int auth;					// 사원 = 1 , 관리자 = 3
	private String edate;				// 입사일자
	private String erank;				// 직위
	
	private String filename;
	private String newfilename;
	
	private String newpwd;
	
	
	public MemberDto() {
	
	}

	
	
	
	
	public MemberDto(int employee_id, String newfilename) {
		super();
		this.employee_id = employee_id;
		this.newfilename = newfilename;
	}



	public MemberDto(int employee_id, String employee_name, String employee_email, int department_id,
			String department_name, int auth, String edate, String erank, String filename, String newfilename) {
		super();
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.employee_email = employee_email;
		this.department_id = department_id;
		this.department_name = department_name;
		this.auth = auth;
		this.edate = edate;
		this.erank = erank;
		this.filename = filename;
		this.newfilename = newfilename;
	}



	public MemberDto(int employee_id, String employee_password, String newpwd) {
		super();
		this.employee_id = employee_id;
		this.employee_password = employee_password;
		this.newpwd = newpwd;
	}



	public MemberDto(int employee_id, String employee_name, String employee_email, String department_name, String edate,
			String erank) {
		super();
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.employee_email = employee_email;
		this.department_name = department_name;
		this.edate = edate;
		this.erank = erank;
	}

	public MemberDto(int employee_id, String employee_name, String employee_password, String employee_email,
			int department_id, String department_name, int auth, String edate, String erank) {
		super();
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.employee_password = employee_password;
		this.employee_email = employee_email;
		this.department_id = department_id;
		this.department_name = department_name;
		this.auth = auth;
		this.edate = edate;
		this.erank = erank;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getEmployee_password() {
		return employee_password;
	}

	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}

	public String getEmployee_email() {
		return employee_email;
	}

	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getErank() {
		return erank;
	}

	public void setErank(String erank) {
		this.erank = erank;
	}

	
	
	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
	}



	public String getNewfilename() {
		return newfilename;
	}



	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}



	@Override
	public String toString() {
		return "MemberDto [employee_id=" + employee_id + ", employee_name=" + employee_name + ", employee_password="
				+ employee_password + ", employee_email=" + employee_email + ", department_id=" + department_id
				+ ", department_name=" + department_name + ", auth=" + auth + ", edate=" + edate + ", erank=" + erank
				+ "]";
	}
	
	
	
	
}
