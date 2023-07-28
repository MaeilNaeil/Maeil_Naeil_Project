package ssg.com.maeil.serviceImpl;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.maeil.dao.MemberDao;
import ssg.com.maeil.dto.MemberDto;
import ssg.com.maeil.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Autowired
    private JavaMailSender mailSender;

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public boolean changeInfo(MemberDto dto) {
		int result = dao.changeInfo(dto);
		if(result > 0) {
			return true;
		} 
		return false;
	}

	@Override
	public boolean changepwdAf(MemberDto dto) {
	
//		System.out.println("서비스 트루 펄스?" + dao.changepwdAf(dto));
		
		int result = dao.changepwdAf(dto);
		if(result > 0) {
			return true;
		} 
		return false;		
	}

	@Override
	public int findid(String employee_email) {
		System.out.println("서비스에서 findid 호출 : " + dao.findid(employee_email));
		return dao.findid(employee_email);
	}

	@Override
	public boolean emailchk(String employee_email) {
		return dao.emailchk(employee_email)>0?true:false;
	}

	@Override
	public MemberDto findpwd(MemberDto dto) {
		return dao.findpwd(dto);
	}

	@Override
	public void sendPwd(MemberDto mem) {

		MimeMessage mimeMessage;
		
		try {
			mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
			
			messageHelper.setFrom("wprhtkso@gmail.com");
			messageHelper.setTo(mem.getEmployee_email());
			messageHelper.setSubject("비밀번호 요청 회신드립니다.");
			messageHelper.setText("안녕하세요. " + mem.getEmployee_name() + " 님\n요청하신 비밀번호찾기 회신드립니다.\n비밀번호 :  " + mem.getEmployee_password() + "\n감사합니다.");
			
			mailSender.send(mimeMessage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public MemberDto findByEmployeeId(int employee_id) {
		return dao.findByEmployeeId(employee_id);
	}

	@Override
	public boolean upload(MemberDto dto) {
		return dao.upload(dto)>0?true:false;
	}
	
	public boolean newemployee(MemberDto dto) {
		return dao.newemployee(dto)>0?true:false;
	}
	
}
