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
	public void updateScore(Integer scoreStar,Integer memberID,Integer courseID){
		BuyCourseVO buyCourseVO=new BuyCourseVO();
		buyCourseVO.setScore(scoreStar);
		buyCourseVO.setMemberID(memberID);
		buyCourseVO.setCourseID(courseID);
		dao.update(buyCourseVO);
		
		
	}
	
}
