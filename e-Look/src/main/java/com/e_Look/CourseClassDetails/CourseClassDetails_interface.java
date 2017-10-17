package com.e_Look.CourseClassDetails;

import java.util.List;

import com.e_Look.Course.CourseVO;
import com.e_Look.courseClass.courseClassVO;

public interface CourseClassDetails_interface {
	
	public void insert(courseClassVO courseClassVO,CourseVO courseVO);
	public void delete(Integer courseID);
	public void update(courseClassVO courseClassVO,CourseVO courseVO);
	public List<CourseClassDetailsVO> findBycourseClassID(Integer CourseClassID);
	public List<CourseClassDetailsVO> findBycourseID(Integer courseID);
	public List<CourseClassDetailsVO> getAll();
}
