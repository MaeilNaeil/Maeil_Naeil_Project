package ssg.com.maeil.dao;

import ssg.com.maeil.dto.MemberDto;

public interface MemberDao {

	MemberDto login(MemberDto dto);
	
	int changeInfo(MemberDto dto);
	
	int changepwdAf(MemberDto dto);
	
	int findid(String employee_email);
	
	int emailchk(String employee_email);
	
	MemberDto findpwd(MemberDto dto);

	MemberDto findByEmployeeId(int employee_id);
	
	int upload(MemberDto dto);
	int newemployee(MemberDto dto);
}
