package com.e_Look.Course;

import java.util.List;

import com.e_Look.member.model.MemberVO;

public interface CourseDAO_interface {
	public Integer insert(CourseVO courseVO);
	public void update(CourseVO courseVO);
	public void updateimage(CourseVO courseVO);
	public void updatepaper(CourseVO courseVO);
	public void updatecourseVideopathway(CourseVO courseVO);
	public void delete(Integer courseID);
	public CourseVO findByPrimaryKey(Integer courseID);
	public List<CourseVO> findBymemberID(Integer memberID,Integer status);
	public void updateStatus(CourseVO courseVO);
	public List<CourseVO> getAllonlineCourse();
}
