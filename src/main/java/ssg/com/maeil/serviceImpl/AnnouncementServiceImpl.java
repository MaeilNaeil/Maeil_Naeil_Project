package ssg.com.maeil.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssg.com.maeil.dao.AnnouncementDao;
import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.AnnouncementSearch;
import ssg.com.maeil.service.AnnouncementService;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

	@Autowired
	AnnouncementDao dao;

	@Override
	public boolean announcementInsert(AnnouncementDto dto) {
		return dao.announcementInsert(dto)>0?true:false;
	}

	@Override
	public List<AnnouncementDto> announcementList(AnnouncementSearch Annsearch) {
		return dao.announcementList(Annsearch);
	}

	@Override
	public int getallannouncement(AnnouncementSearch Annsearch) {
		return dao.getallannouncement(Annsearch);
	}

	@Override
	public AnnouncementDto announcementdetail(int seq) {
		return dao.announcementdetail(seq);
	}

	@Override
	public boolean announcementupdate(AnnouncementDto dto) {
		return dao.announcementupdate(dto)>0?true:false;
	}

	@Override
	public boolean announcementdelete(int seq) {
		return dao.announcementdelete(seq)>0?true:false;
	}
	
	
}
