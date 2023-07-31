package ssg.com.maeil.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ssg.com.maeil.dto.MemberDto;
import javax.servlet.http.HttpServletRequest;
import ssg.com.maeil.dto.MonthlyWorkDto;
import ssg.com.maeil.dto.WorkingStatusDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;
import ssg.com.maeil.serviceImpl.WorkingStatusServiceImpl;
import util.DateUtil;

// TODO : 페이징, 휴가업데이트쿼리, 메인 버튼, 

@Controller
public class WorkingStatusController {

	@Autowired
	WorkingStatusServiceImpl service;
	
	@GetMapping("workingStatus.do")
	public String moveWorkingStatus(HttpServletRequest request, Model model) {
		System.out.println(" move >>> workingStatus.jsp ");
		
		MemberDto loginMember =(MemberDto) request.getSession().getAttribute("login");
		List<HashMap<String, Object>> statusList = service.getWorkingStatus(loginMember.getEmployee_id());

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
		
		//TODO
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime formatStartTime = LocalDateTime.parse(timeDto.getStartWorkTime(), formatter);
		response = new StartWorkResponse(formatStartTime, true);
		
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
		
		LocalDateTime formatLeaveTime = DateUtil.stringToLocalDateTime(timeDto.getLeaveWorkTime());
    
		response = new LeaveWorkResponse(formatLeaveTime, true);
		
		return response;
	}
	
	
	@GetMapping("monthlyMyWork.do")
	public String monthlyWork(HttpServletRequest request, String inputDate, Model model) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate now = LocalDate.now();
		System.out.println("inputDate >>"+inputDate);
		LocalDate date = inputDate != null ? 
				  LocalDate.parse(inputDate, dtf) /* 요청된 날짜가 있는경우 = 해당 날짜로 화면 재랜더링*/ 
				: LocalDate.of(now.getYear(), now.getMonth(), 1); /* 요청된 날짜가 없는경우 = 디폴트조회 = 조회당시월*/ 

		MemberDto loginMember =(MemberDto) request.getSession().getAttribute("login");
		List<MonthlyWorkDto> monthlyWorkDtoList = service.getMonthlyWork(loginMember.getEmployee_id(), date);

		List<MonthlyWorkInfo> monthlyWorkList = new ArrayList<>();
//		List<MonthlyWorkInfo> result = new ArrayList<>();
//		for(MonthlyWorkDto item : monthlyWorkList) {
//			MonthlyWorkInfo info = new MonthlyWorkInfo();
//			info.setStartWorkTime(DateUtil.stringToLocalDateTime(item.getStartWorkTime()));
//			info.setLeaveWorkTime(DateUtil.stringToLocalDateTime(item.getLeaveWorkTime()));
//			info.setWorkingDate(DateUtil.stringToLocalDate(item.getWorkingDate())); 
//			result.add(info);
//		}
		if (monthlyWorkDtoList.size() != 1 || monthlyWorkDtoList.get(0) != null) {
			monthlyWorkList = monthlyWorkDtoList.stream()
					.map(dto -> new MonthlyWorkInfo(dto))
					.collect(Collectors.toList());
		}
		
		model.addAttribute("monthlyWorkList", monthlyWorkList);
		model.addAttribute("inquireDate", date);
		return "monthlyMyWork";
	} 
	
	
}
