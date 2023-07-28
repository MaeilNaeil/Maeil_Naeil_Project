package ssg.com.maeil.dao;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;

import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.AnnouncementSearch;

public interface AnnouncementDao {

		int announcementInsert(AnnouncementDto dto);
		
		List<AnnouncementDto> announcementList(AnnouncementSearch Annsearch);
		int getallannouncement(AnnouncementSearch Annsearch);
		
		AnnouncementDto announcementdetail(int seq);
		
		int announcementupdate(AnnouncementDto dto);
		
		int announcementdelete(int seq);
}
