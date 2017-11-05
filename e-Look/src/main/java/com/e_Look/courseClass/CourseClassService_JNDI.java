package com.e_Look.courseClass;

public class CourseClassService_JNDI {
	private CourseClass_interface dao;
	public CourseClassService_JNDI()	{
		dao = new CourseClassDAO();
	}
	
	public void updateEventID(CourseClassVO courseClassVO) {
		dao.updateEventID(courseClassVO);
	}
}
