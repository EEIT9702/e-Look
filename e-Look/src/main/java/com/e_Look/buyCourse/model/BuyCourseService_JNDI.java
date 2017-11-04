package com.e_Look.buyCourse.model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import com.e_Look.Course.CourseDAO;
import com.e_Look.Course.CourseDAO_JDBC;
import com.e_Look.Course.CourseDAO_interface;
import com.e_Look.Course.CourseVO;

public class BuyCourseService_JNDI {
	private BuyCourseDAO_interface dao;
	//private CourseDAO_interface cdao;

	public BuyCourseService_JNDI() {
		dao = new BuyCourseDAO();
		//cdao = new CourseDAO();
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
	public Double avgScore(Integer courseID){
		return dao.getAvgScore(courseID);
	
	}
	public List<BuyCourseVO> findCourseID(Integer memberID){
		return dao.findByMemberID(memberID);
	
	}
	public Integer getBuyCourseNumber(Integer courseID) {
		List<BuyCourseVO> bcVO = dao.getByCourseID(courseID);
		Integer bsize = bcVO.size();
		//System.out.println("bsize = " + bsize);
		return bsize;
	}
	
	public List<CourseVO> getTopThreeBuyCourse(Integer topNum) {
		BuyCourseDAO_JDBC bdao = new BuyCourseDAO_JDBC();
		CourseDAO_JDBC cdao = new CourseDAO_JDBC();
		List<BuyCourseVO> bcVOs = bdao.getAll();
		List<CourseVO> cVO = new LinkedList<CourseVO>();
		//int[] cc = new int[topNum];
		HashMap<Integer, Integer> courseIDMap = new HashMap<Integer, Integer>();
		
		//Integer buyCourseID[] = null;
		for(BuyCourseVO bcVO : bcVOs){
			if(courseIDMap.containsKey(bcVO.getCourseID())) {
				courseIDMap.replace(bcVO.getCourseID(), courseIDMap.get(bcVO.getCourseID())+1);
			}else{
				courseIDMap.put(bcVO.getCourseID(), 1);
			}
		}
		
		//buyCourseID = new Integer[courseIDMap.size()];
//		buyCourseID = new Integer[topNum];
		
		while( cVO.size()<topNum && !courseIDMap.isEmpty()) {
			int count = 0;
			Integer topBought = null;
			for(Integer key : courseIDMap.keySet()) {
				if(courseIDMap.get(key) > count) {
					topBought = key;
					count = courseIDMap.get(key);
				}
			}
			cVO.add(cdao.findByPrimaryKey(topBought));
			courseIDMap.remove(topBought);
		}
		
		
		return cVO;
	}
}
