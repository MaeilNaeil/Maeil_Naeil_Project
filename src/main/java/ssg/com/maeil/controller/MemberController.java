package ssg.com.maeil.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ssg.com.maeil.dto.MemberDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;
import ssg.com.maeil.service.MemberService;
import ssg.com.maeil.service.WorkingStatusService;
import util.DateUtil;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	WorkingStatusService workingStatusService;
	
	@RequestMapping("login.do")
	public String login() {
	System.out.println("MemberController login() " + new Date());
		
	return "login";
	}
	
	@PostMapping("loginAf.do")
	public String loginAf(MemberDto mem, Model model, HttpServletRequest request) {
	System.out.println("MemberController loginAf() " + new Date());
	
		MemberDto dto = service.login(mem);
		
		System.out.println("mem값이 없어?" + mem);
		
		String loginmsg = "LOGIN_NO";
		if(dto != null) {
			request.getSession().setAttribute("login", dto);	// session 저장			
			loginmsg = "LOGIN_YES";
		}
		model.addAttribute("loginmsg", loginmsg);
	
	return "message";
	}
		
	
	///////////////////////////////////////////////////////////////
	@RequestMapping("main.do")
	public String main(Model model) {
	System.out.println("MemberController main() " + new Date());

	// TODO : MainController 
	// 출근시간/퇴근시간 조회 - 출/퇴근 시간 유무에 따라 버튼 활성화 유무 & 시간 출력 유무
	WorkingStatusTimeDto mainTimeDto = workingStatusService.getWorkingStatusTime(2);
  
    LocalDateTime formatStartTime = DateUtil.stringToLocalDateTime(mainTimeDto.getStartWorkTime());
    LocalDateTime formatLeaveTime = DateUtil.stringToLocalDateTime(mainTimeDto.getLeaveWorkTime());
	
	MainResponse mainResponse = new MainResponse(formatStartTime, formatLeaveTime);
	
	model.addAttribute("mainResponse", mainResponse);
	return "main";
	}
	
 
	
	
	
	
}
