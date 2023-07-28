package ssg.com.maeil.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ssg.com.maeil.dto.AnnouncementDto;
import com.mysql.cj.Session;

import ssg.com.maeil.dto.MemberDto;
import ssg.com.maeil.dto.WorkingStatusTimeDto;
import ssg.com.maeil.service.MemberService;
import ssg.com.maeil.service.WorkingStatusService;
import util.DateUtil;
import util.uploadUtil;

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
		
		String loginmsg = "LOGIN_NO";
		if(dto != null) {
			request.getSession().setAttribute("login", dto);	// session 저장			
			request.getSession().setMaxInactiveInterval(60*60);
			loginmsg = "LOGIN_YES";
		}
		model.addAttribute("loginmsg", loginmsg);
	
	return "message";
	}
		
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
	
	
	@GetMapping("mypage.do")
	public String mypage() {
		System.out.println("MemberController mypage() " + new Date());

		return "mypage";
	}
	
	@GetMapping("logout.do")
	public String logout(HttpServletRequest request) {
		System.out.println("MemberController logout() " + new Date());
		
		request.getSession().invalidate();
		
		return "login";
	}
	
	@ResponseBody
	@PostMapping("changeInfo.do")
	public String changeInfo(@RequestBody MemberDto mem, HttpServletRequest request) {
		System.out.println("MemberController changeInfo() " + new Date());	
		
		if (service.changeInfo(mem)) {
//			System.out.println(mem);
			request.getSession().setAttribute("login", mem);
			return "success";	
		}
		return "fail";

	}
	
	@GetMapping("changePwd.do")
	public String changePwd() { 
		System.out.println("MemberController changePwd() " + new Date());	
		
		return "changepwd";	
	}
	
	
	@PostMapping("changepwdAf.do")
	public String changepwdAf(MemberDto dto, Model model) {
		System.out.println("MemberController changepwdAf() " + new Date());
		
		String changemsg="CHANGE_NO";
		
		if (service.changepwdAf(dto) == true) {
			changemsg = "CHANGE_YES";
			
		}
		model.addAttribute("changemsg", changemsg);
		
		return "changemsg";
	}
	
	@ResponseBody
	@PostMapping("emailchkBtn.do")
	public String emailchkBtn(String employee_email) {
		System.out.println("MemberController emailchkBtn() " + new Date());
		
		boolean isS = service.emailchk(employee_email);
		String chkmsg = "USE_YES";
		if(isS) {
			chkmsg="USE_NO";
		}
		
		return chkmsg;
	}
	
	@GetMapping("find.do")
	public String find() {
	
		return "find";
	}
	
	@GetMapping("findidpage.do")
	public String findidpage() {
		
		return"findidpage";
	}
	
	@ResponseBody
	@PostMapping("findid.do")
	public int findid(String employee_email) {
		System.out.println("MemberController findid() " + new Date());
		
		int employee_id = service.findid(employee_email);
		
		return employee_id;
	}
	
	@GetMapping("findpwdpage.do")
	public String findpwdpage() {
		
		return"findpwdpage";
	}
	
	@ResponseBody
	@PostMapping("findpwd.do")
	public String findpwd(HttpServletRequest request, MemberDto mem) {
		System.out.println("MemberController findpwd() " + new Date());	
		
		String sendmsg = "SEND_YES";
		// 여기서 세분화를 해보겠습니다.
		// 1번 -> 사원 번호 조회
		try {
			MemberDto dto = service.findByEmployeeId(mem.getEmployee_id());
			if(dto==null || dto.equals(null)) {
				sendmsg = "NoId";
			} else if (!dto.getEmployee_email().equals(mem.getEmployee_email())) {
				sendmsg = "NoEmail";
			} else {
				service.sendPwd(dto);
			}
		} catch (Exception e) {
			sendmsg = "error";
			e.printStackTrace();
			return sendmsg;
		}    
		return sendmsg;
	}
	
	
	@PostMapping("upload.do")
	public String upload(MemberDto mem, Model model,
						@RequestParam(value = "fileupload", required = false)
						MultipartFile fileupload,
						HttpServletRequest request) {
		System.out.println("MemberController upload() " + new Date());
		
		String filename = fileupload.getOriginalFilename();
		System.out.println("filename 확인 : " + filename);
		System.out.println("mem 확인 : " + mem);
		mem.setFilename(filename);
		
		String fupload = request.getServletContext().getRealPath("/upload");
		System.out.println("경로확인 : " + fupload);
		
		String newfilename = uploadUtil.getNewfileName(filename, request);
		System.out.println("newfilename : " + newfilename);
		
		mem.setNewfilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
	
		System.out.println("저장경로 : " + file);
		
		try {
			FileUtils.writeByteArrayToFile(file, fileupload.getBytes());
		
			boolean isS = service.upload(mem);
			if(isS) {
				System.out.println("사진이 등록되었습니다.");
				model.addAttribute("newfilename", newfilename);
			} else {
				System.out.println("사진등록에 실패했습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage.do";
	}
	
	
	@GetMapping("newemployee.do")
	public String newemployee() {
		System.out.println("MemberController newemployee() " + new Date());
		
		return "newemployee";
	}
	
	@PostMapping("newemployeeAf.do")
	public String newemployeeAf(MemberDto dto,Model model) {
		System.out.println("MemberController newemployeeAf() " + new Date());
		System.out.println(dto.toString());
		boolean isS = service.newemployee(dto);
		String employeemessage = "Y";
		if(isS==false) {
			employeemessage ="가입성공실패.";
		}
		model.addAttribute("employeemessage",employeemessage);
		return "message";
	}
	
}
