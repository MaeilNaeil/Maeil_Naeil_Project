package ssg.com.maeil.service;

import java.util.List;

import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.AnnouncementSearch;

public interface AnnouncementService {

	
	boolean announcementInsert(AnnouncementDto dto);
	List<AnnouncementDto> announcementList(AnnouncementSearch Annsearch);
	int getallannouncement(AnnouncementSearch Annsearch);
	
	AnnouncementDto announcementdetail(int seq);
	
	boolean announcementupdate(AnnouncementDto dto);
	
	boolean announcementdelete(int seq);
}
