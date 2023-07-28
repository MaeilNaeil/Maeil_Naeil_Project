package ssg.com.maeil.daoImpl;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.maeil.dao.MemberDao;
import ssg.com.maeil.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Member.";
	
	@Override	
	public MemberDto login(MemberDto dto) {
		return session.selectOne(ns + "login", dto);
	}

	@Override
	public int changeInfo(MemberDto dto) {
		return session.update(ns + "changeInfo", dto);
	}

	@Override
	public int changepwdAf(MemberDto dto) {
		return session.update(ns + "changepwdAf", dto);
	}

	@Override
	public int findid(String employee_email) {	
		return session.selectOne(ns + "findid", employee_email);
	}

	@Override
	public int emailchk(String employee_email) {
		return session.selectOne(ns + "emailchk", employee_email);
	}

	@Override
	public MemberDto findpwd(MemberDto dto) {
		return session.selectOne(ns + "findpwd", dto);
	}

	@Override
	public MemberDto findByEmployeeId(int employee_id) {
		return session.selectOne(ns + "findByEmployeeId", employee_id);
	}

	@Override
	public int upload(MemberDto dto) {
		return session.update(ns + "upload", dto);
	}
	
	public int newemployee(MemberDto dto) {
		return session.insert("newemployee", dto);
	}
	
	
	
}
