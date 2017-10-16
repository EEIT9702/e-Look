package com.e_Look.CourseClassDetails;

import java.util.List;

import com.e_Look.Course.CourseVO;

public interface CourseClassDetails_interface {
	
	public void insert(CourseClassDetailsVO courseClassVO,CourseVO courseVO);
	public void delete(CourseClassDetailsVO courseClassID,CourseVO courseID);
	public void update(CourseClassDetailsVO courseClassVO,CourseVO courseVO);
	public List<CourseClassDetailsVO> findBycourseClassID(CourseClassDetailsVO courseClassID);
	public List<CourseClassDetailsVO> findBycourseID(CourseVO courseID);
	public List<CourseClassDetailsVO> getAll();
}
