package com.e_Look.Course;

import java.sql.Connection;

public class CourseService {
	private CourseDAO_interface dao;
	public CourseService(){
		dao=new CourseDAO();
	}
	public Integer CreateNewCourse(){
		CourseVO CourseVO1 =new CourseVO();
		CourseVO1.setSoldPrice(0);
		CourseVO1.setCourseLength(0);
		CourseVO1.setTargetStudentNumber(0);
		CourseVO1.setStatus(0);
		CourseVO1.setMemberID(100001);
		CourseVO1.setAvgScore(0.0);
		Integer CourseID= dao.insert(CourseVO1);
		return CourseID;
	}
	
}
