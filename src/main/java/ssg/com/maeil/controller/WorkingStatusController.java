package ssg.com.maeil.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssg.com.maeil.dto.MonthlyWorkDto;
import ssg.com.maeil.dto.WorkingStatusDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;
import ssg.com.maeil.serviceImpl.WorkingStatusServiceImpl;

@Controller
public class WorkingStatusController {

	@Autowired
	WorkingStatusServiceImpl service;
	
	@GetMapping("workingStatus.do")
	public String moveWorkingStatus(Model model) {
		System.out.println(" move >>> workingStatus.jsp ");
		
		List<HashMap<String, Object>> statusList = service.getWorkingStatus(2);
		
		model.addAttribute("statusList", statusList);

		return "workingStatus";
	}
	
	@ResponseBody
	@PostMapping("startWork.do")
	public StartWorkResponse startWork(int employeeId) {
		
		LocalDateTime time;
		StartWorkResponse response = null;
		WorkingStatusTimeDto timeDto = service.getWorkingStatusTime(employeeId);
		
		if(timeDto.getStartWorkTime() == null) {
			time = service.insertStartWorkTime(employeeId);
			response = new StartWorkResponse(time, false); 
			System.out.println("insert start work time >>> " + time);
			return response;
		}
		
		response = new StartWorkResponse(timeDto.getStartWorkTime(), true);
		
		return response;
	} 
	
	@ResponseBody
	@PostMapping("leaveWork.do")
	public LeaveWorkResponse leaveWork(int employeeId) {

		LocalDateTime time;
		LeaveWorkResponse response = null;
		
		WorkingStatusTimeDto timeDto = service.getWorkingStatusTime(employeeId);
		
		/* 출근 하지 않은 경우 */
		if(timeDto.getLeaveWorkTime() == null) {
			time = service.insertLeaveWorkTime(employeeId);
			response = new LeaveWorkResponse(time, false);
			System.out.println("insert leave work time >>> " + time);
			return response;
		}
		
		response = new LeaveWorkResponse(timeDto.getLeaveWorkTime(), true);
		
		return response;
	}
	
	
	@GetMapping("monthlyMyWork.do")
	public String monthlyWork(String inputDate, Model model) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate now = LocalDate.now();
		System.out.println("inputDate >>"+inputDate);
		LocalDate date = inputDate != null ? 
				  LocalDate.parse(inputDate, dtf) /* 요청된 날짜가 있는경우 = 해당 날짜로 화면 재랜더링*/ 
				: LocalDate.of(now.getYear(), now.getMonth(), 1); /* 요청된 날짜가 없는경우 = 디폴트조회 = 조회당시월*/ 

		List<MonthlyWorkDto> monthlyWorkList = service.getMonthlyWork(2, date);
		
		if (monthlyWorkList.size() == 1 && monthlyWorkList.get(0) == null) {
			monthlyWorkList = new ArrayList<>();
		}
		model.addAttribute("monthlyWorkList", monthlyWorkList);
		model.addAttribute("inquireDate", date);
		return "monthlyMyWork";
	} 
	
	
}
