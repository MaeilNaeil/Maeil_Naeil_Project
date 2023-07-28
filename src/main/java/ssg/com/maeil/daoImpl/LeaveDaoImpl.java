package ssg.com.maeil.daoImpl;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.maeil.dao.LeaveDao;
import ssg.com.maeil.dto.LeaveDto;

@Repository
public class LeaveDaoImpl implements LeaveDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Lve.";

	@Override
	public List<LeaveDto> leavelist(LeaveDto dto) {
		System.out.println("LeaveDaoImpl leavelist()" + new Date());
		return session.selectList(ns + "leavelist", dto);
	}

	@Override
	public int leaveadd(LeaveDto dto) {
		System.out.println("LeaveDaoImpl leaveadd()" + new Date());		
		int count = session.insert(ns + "leaveaddAf", dto);
		return count;
	}

	@Override
	public int leavedel(LeaveDto dto) {
		System.out.println("LeaveDaoImpl leavedel()" + new Date());			
		int count = session.delete(ns + "leavedel", dto);		
		return count;
	}

	
}
