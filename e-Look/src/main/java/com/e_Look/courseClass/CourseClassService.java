package com.e_Look.courseClass;

import java.util.List;

public class CourseClassService {
	private CourseClass_interface dao;
	public CourseClassService()	{
		dao = new CourseClassDAO();
	}
	
	public void updateEventID(CourseClassVO courseClassVO) {
		dao.updateEventID(courseClassVO);
	}
	public List<CourseClassVO> getAll(){
		return dao.getAll();				
	}
}
