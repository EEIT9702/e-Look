package com.e_Look.CourseClassDetails;

import java.util.List;

import com.e_Look.Course.CourseVO;

public interface CourseClassDetails_interface {
	
	public void insert(CourseClassDetailsVO courseClassVO,CourseVO courseVO);
	public void delete(CourseVO CourseVO);
	public void update(CourseClassDetailsVO courseClassVO,CourseVO courseVO);
	public List<CourseClassDetailsVO> findBycourseClassID(CourseClassDetailsVO CourseClassDetailsVO);
	public List<CourseClassDetailsVO> findBycourseID(CourseVO CourseVO);
	public List<CourseClassDetailsVO> getAll();
}
