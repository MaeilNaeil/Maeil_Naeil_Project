package ssg.com.maeil.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssg.com.maeil.dao.AnnouncementDao;
import ssg.com.maeil.dto.AnnouncementDto;
import ssg.com.maeil.dto.AnnouncementSearch;

@Repository
public class AnnouncementDaoImpl implements AnnouncementDao{

	@Autowired
	SqlSession session;

	
	@Override
	public int announcementInsert(AnnouncementDto dto) {		
		return session.insert("announcementInsert",dto);
	}
	@Override
	public List<AnnouncementDto> announcementList(AnnouncementSearch Annsearch) {
		return session.selectList("announcementList",Annsearch);
	}
	@Override
	public int getallannouncement(AnnouncementSearch Annsearch) {
		return session.selectOne("getallannouncement", Annsearch);
	}
	@Override
	public AnnouncementDto announcementdetail(int seq) {
		
		return session.selectOne("announcementdetail", seq);
	}
	@Override
	public int announcementupdate(AnnouncementDto dto) {
		return session.update("announcementupdate", dto);
		
	}
	@Override
	public int announcementdelete(int seq) {
		return session.update("announcementdelete",seq);
	}
	@Override
	public List<AnnouncementDto> recentThreeAnnounce() {
		return session.selectList("recentThreeAnnounce");
	}
	


	
	
}
