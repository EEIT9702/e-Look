package com.e_Look.memberSubscription;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MemberSubscriptionService {
	private MemberSubscriptionDAO_interface dao;

	public MemberSubscriptionService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
        // 建立DAO物件
		dao = (MemberSubscriptionDAO_interface) context.getBean("memberSubscriptionDAO");
	}

	public void insertMemberSubscription(Integer memberID,Integer memberTrackID) {
		MemberSubscriptionVO memberSubscriptionVO =new MemberSubscriptionVO();
		memberSubscriptionVO.setMemberID(memberID);
		memberSubscriptionVO.setMemberTrackID(memberTrackID);
		dao.insert(memberSubscriptionVO);
		
	}

	public void deleteMemberSubscription(Integer memberID, Integer memberTrackID) {
		dao.delete(memberID, memberTrackID);
		
	}
	public List<MemberSubscriptionVO> findPrimaryMemberBookmarks(Integer memberID) {
		return dao.findByMemberID(memberID);
	}
	
}	