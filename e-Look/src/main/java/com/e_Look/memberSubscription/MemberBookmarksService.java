package com.e_Look.memberSubscription;

import java.util.List;

public class MemberBookmarksService {
	private MemberSubscriptionDAO_interface dao;

	public MemberBookmarksService() {
		dao = new MemberSubscriptionDAO();
	}

	public void insertMemberBookmarks(Integer memberID,Integer courseID) {
		dao.insert(MemberSubscriptionVO memberSubscriptionVO);
		
	}

	public void deleteMemberBookmarks(Integer memberID, Integer courseID) {
		dao.delete(memberID, courseID);
		
	}
	public List<MemberSubscriptionVO> findPrimaryMemberBookmarks(Integer memberID) {
		return dao.findByMemberID(memberID);
	}
	
}	