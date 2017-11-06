package com.e_Look.memberBookmarks.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MemberBookmarksService {
	private MemberBookmarksDAO_interface dao;

	public MemberBookmarksService() {
		ApplicationContext context=new ClassPathXmlApplicationContext("beans-config-jndi.xml");
		dao = (MemberBookmarksDAO_interface) context.getBean("MemberBookmarksDAO");
	}

	public void insertMemberBookmarks(Integer memberID,Integer courseID) {
		MemberBookmarksVO memberBookmarksVO=new MemberBookmarksVO();
		memberBookmarksVO.setCourseID(courseID);
		memberBookmarksVO.setMemberID(memberID);
		dao.insert(memberBookmarksVO);
		
	}

	public void deleteMemberBookmarks(Integer memberID, Integer courseID) {
		dao.delete(memberID, courseID);
		
	}
	public List<MemberBookmarksVO> findPrimaryMemberBookmarks(Integer memberID) {
		return dao.findByMemberID(memberID);
	}
	
}	