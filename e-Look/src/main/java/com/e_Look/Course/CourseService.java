package com.e_Look.Course;

import java.sql.Connection;

public class CourseService {
	private CourseDAO_interface dao;
	public CourseService(){
		dao=new CourseDAO();
	}
	public Integer insertCourseData(){
		Connection conn = null;
		
		
		CourseVO courseVO1 = new CourseVO();
		courseVO1.setSoldPrice(0);
		courseVO1.setCourseLength(0);
		courseVO1.setTargetStudentNumber(0);
		courseVO1.setStatus(0);
		courseVO1.setMemberID(100001);
		courseVO1.setAvgScore(0.0);
		dao.insert(courseVO1);
		
		return null;
	}
	
}
