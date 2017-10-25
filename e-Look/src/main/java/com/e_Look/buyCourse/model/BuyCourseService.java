package com.e_Look.buyCourse.model;

import java.util.List;

public class BuyCourseService {
	private BuyCourseDAO_interface dao;

	public BuyCourseService() {
		dao = new BuyCourseDAO();
	}
	public List<BuyCourseVO> getBuyCourse(Integer memberID){
		
		return dao.findByMemberID(memberID);
		
	}
}
