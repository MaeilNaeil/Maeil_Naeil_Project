package ssg.com.maeil.service;

import ssg.com.maeil.dto.MemberDto;

public interface MemberService {

	MemberDto login(MemberDto dto);
	
	boolean changeInfo(MemberDto dto);
	
	boolean changepwdAf(MemberDto dto);
	
	int findid(String employee_email);
	
	boolean emailchk(String employee_email);
	
	MemberDto findpwd(MemberDto dto);

	void sendPwd(MemberDto mem);

	MemberDto findByEmployeeId(int employee_id);
	
	boolean upload(MemberDto dto);
	
	boolean newemployee(MemberDto dto);
}
