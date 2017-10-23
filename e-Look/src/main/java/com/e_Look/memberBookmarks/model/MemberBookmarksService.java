package com.e_Look.memberBookmarks.model;

import java.util.List;

public class MemberBookmarksService {
	private MemberBookmarksDAO_interface dao;

	public MemberBookmarksService() {
		dao = new MemberBookmarksDAO();
	}

	public void insertMemberBookmarks(MemberBookmarksVO MemberBookmarksVO) {
		dao.insert(MemberBookmarksVO);
		
	}

	public void deleteMemberBookmarks(Integer memberID, Integer courseID) {
		dao.delete(memberID, courseID);
		
	}
	public List<MemberBookmarksVO> findPrimaryMemberBookmarks(Integer memberID) {
		return dao.findByMemberID(memberID);
		
	}
}