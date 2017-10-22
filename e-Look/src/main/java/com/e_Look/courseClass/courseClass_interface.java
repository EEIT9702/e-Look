package com.e_Look.courseClass;

import java.util.List;

public interface courseClass_interface {
	
	public void insert(courseClassVO courseClassVO);
	public void delete(Integer CourseClassID);
	public void update(courseClassVO courseClassVO);
	public courseClassVO  findByCourseClassID(Integer CourseClassID);
	public List<courseClassVO> findByEventID(Integer eventID);
	public List<courseClassVO> getAll();
}
