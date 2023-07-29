package ssg.com.maeil.controller;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.AnnouncementSearch;
import ssg.com.maeil.service.AnnouncementService;

@Controller
public class AnnouncementController {

	@Autowired
	AnnouncementService service;
	
	@GetMapping("announcementmain.do")
	public String announcementList(AnnouncementSearch Annsearch,Model model) {
		System.out.println("AnnouncementController announcement() " + new Date());
		if(Annsearch == null || Annsearch.getSearch() == null || Annsearch.getChoice() == null) {
			Annsearch = new AnnouncementSearch("", "", 0);
		}
		
		List<AnnouncementDto> list = service.announcementList(Annsearch);
				
		// 글의 총수
		int count = service.getallannouncement(Annsearch);	
		// 페이지를 계산
		int annPage = count / 10;
		if((count % 10) > 0) {
			annPage = annPage + 1;
		}		
		
		model.addAttribute("announcementList", list);
		model.addAttribute("annPage", annPage);
		model.addAttribute("Annsearch", Annsearch);
		
		
		return "announcementmain";
	}
	@GetMapping("announcementinsert.do")
	public String announcementinsert(){
		System.out.println("AnnouncementController announcementinsert() " + new Date());
		return "announcementinsert";
	}
	@PostMapping("announcementinsertAf.do")
	public String announcementinsertAf(AnnouncementDto dto,Model model) {
		System.out.println("AnnouncementController announcementinsertAf() " + new Date());
		boolean isS = service.announcementInsert(dto);
		String insertmessage = "작성완료했습니다.";
		if(isS==false) {
			insertmessage ="작성실패했습니다.";
		}
		model.addAttribute("insertmessage",insertmessage);
		return "message";
	}
	
	@GetMapping("announcementdetail.do")
	public String announcementdetail(int seq,Model model) {
		System.out.println("AnnouncementController announcementdetail() " + new Date());
		AnnouncementDto ann = service.announcementdetail(seq);
		
		model.addAttribute("ann", ann);
		return "announcementdetail";
	}
	@RequestMapping(value="announcementupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String announcementupdate(AnnouncementDto dto, Model model) {
		System.out.println("AnnouncementController announcementupdate() " + new Date());
		
		AnnouncementDto ann = service.announcementdetail(dto.getSeq());
		model.addAttribute("ann", ann);
		
		return "announcementupdate";
	}
	
	@RequestMapping(value="announcementupdateAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String announcementupdateAf(AnnouncementDto dto, Model model) {
		System.out.println("AnnouncementController announcementupdateAf() " + new Date());
		String updatemessage = "Yes";
		boolean isS = service.announcementupdate(dto);
		if(isS==false) {
			updatemessage= "No";
		}
		
		model.addAttribute("seq",dto.getSeq());
		model.addAttribute("updatemessage",updatemessage);
		return "message";
	}
	
	@RequestMapping(value="announcementdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String announcementdelete(AnnouncementDto dto,Model model) {
		System.out.println("AnnouncementController announcementdelete() " + new Date());
		String deletemessage = "Y";
		
		System.out.println("컨트롤러에서 dto값 확인 : " + dto.toString());
		
		boolean isS = service.announcementdelete(dto);
		if(isS==false) {
			deletemessage="N";
		}
		model.addAttribute("deletemessage",deletemessage);
		return "message";
	}
	
	
}
