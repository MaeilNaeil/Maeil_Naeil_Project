package ssg.com.maeil.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.maeil.dao.LeaveDao;
import ssg.com.maeil.dto.LeaveDto;
import ssg.com.maeil.service.LeaveService;

@Service
public class LeaveServiceImpl implements LeaveService {

	@Autowired
	LeaveDao dao;

	@Override
	public List<LeaveDto> leavelist(LeaveDto dto) {
		System.out.println("LeaveServiceImpl leavelist()" + new Date());				
		return dao.leavelist(dto);
	}

	@Override
	public boolean leaveadd(LeaveDto dto) {
		System.out.println("LeaveServiceImpl leaveadd()" + new Date());				
		return dao.leaveadd(dto)>0?true:false;
	}

	@Override
	public boolean leavedel(LeaveDto dto) {
		System.out.println("LeaveServiceImpl leavedel()" + new Date());			
		return dao.leavedel(dto)>0?true:false;
	}

	
}
