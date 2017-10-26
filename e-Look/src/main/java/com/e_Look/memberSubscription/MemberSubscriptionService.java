package com.e_Look.memberSubscription;

import java.util.List;

public class MemberSubscriptionService {
	private MemberSubscriptionDAO_interface dao;

	public MemberSubscriptionService() {
		dao = new MemberSubscriptionDAO();
	}

	public void insertMemberBookmarks(Integer memberID,Integer memberTrackID) {
		MemberSubscriptionVO memberSubscriptionVO =new MemberSubscriptionVO();
		memberSubscriptionVO.setMemberID(memberID);
		memberSubscriptionVO.setMemberTrackID(memberTrackID);
		dao.insert(memberSubscriptionVO);
		
	}

	public void deleteMemberBookmarks(Integer memberID, Integer courseID) {
		dao.delete(memberID, courseID);
		
	}
	public List<MemberSubscriptionVO> findPrimaryMemberBookmarks(Integer memberID) {
		return dao.findByMemberID(memberID);
	}
	
}	