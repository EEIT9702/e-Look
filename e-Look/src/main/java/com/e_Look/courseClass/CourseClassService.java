package com.e_Look.courseClass;

public class CourseClassService {
	private CourseClass_interface dao;
	public CourseClassService()	{
		dao = new CourseClassDAO();
	}
	
	public void updateEventID(CourseClassVO courseClassVO) {
		dao.updateEventID(courseClassVO);
	}
}
