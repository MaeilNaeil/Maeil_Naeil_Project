package ssg.com.maeil.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ssg.com.maeil.dto.LeaveDto;
import ssg.com.maeil.dto.MemberDto;
import ssg.com.maeil.service.LeaveService;

@Controller
public class LeaveController {

	@Autowired
	LeaveService service;
	
	
	
	@RequestMapping(value="leavelist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String leavelist(LeaveDto dto, Model model, HttpSession session) {
		System.out.println("LeaveController leavelist()" + new Date());

		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		dto.setEmployee_id(memberDto.getEmployee_id());
						
		List<LeaveDto> list = service.leavelist(dto);	
						
		model.addAttribute("leavelist", list);		
				
		return "leavelist";
		
	}
		
	
	
	@RequestMapping(value="leaveaddAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String leaveadd(LeaveDto dto, Model model, HttpSession session) {
		System.out.println("LeaveController leaveadd()" + new Date());
		
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		dto.setEmployee_id(memberDto.getEmployee_id());
		
		boolean isS = service.leaveadd(dto);
		String leaveadd = "Lve_ADD_OK";		
			if(isS != true) {
				leaveadd = "Lve_ADD_NO";
				System.out.println("Controller = " + leaveadd);		
			} 
		
		model.addAttribute("leaveadd", leaveadd);
			
		return "redirect:/leavelist.do";
	}
	
	

	@RequestMapping(value="leavedel.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String leavedel(int seq, Model model, LeaveDto dto, MemberDto mdto, HttpSession session, HttpServletRequest request) {
		System.out.println("LeaveController leavedel()" + new Date());
					
		MemberDto memberDto = (MemberDto) session.getAttribute("login");
		dto.setEmployee_id(memberDto.getEmployee_id());
			
		 	boolean isS = service.leavedel(dto);
		 		String leavedel = "Lve_DELETE_OK";		
		 			if(isS != true) {
		 				leavedel = "Lve_DELETE_NO";
		 				System.out.println("Controller = " + leavedel);		
		 			} 
		 			
		 		model.addAttribute("leavedel", leavedel);	
		 			
			return "redirect:/leavelist.do";
		
	}	
	
}



















