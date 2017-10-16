package com.e_Look.CourseClassDetails;

import java.io.Serializable;
import com.e_Look.courseClass.courseClassVO;
import com.e_Look.Course.CourseVO;
public class CourseClassDetailsVO  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer courseID;
	private Integer CourseClassID;
	private courseClassVO courseClassVO;
	private CourseVO CourseVO;
	public CourseClassDetailsVO(){}
	public CourseClassDetailsVO( Integer courseID,Integer CourseClassID){
		this.CourseClassID=CourseClassID;
		this.courseID=courseID;
		
	}
	public Integer getCourseID() {
		return courseID;
	}
	public void setCourseID(Integer courseID) {
		this.courseID = courseID;
	}
	public Integer getCourseClassID() {
		return CourseClassID;
	}
	public void setCourseClassID(Integer courseClassID) {
		CourseClassID = courseClassID;
	}
	
	public courseClassVO getCourseClassVO() {
		return courseClassVO;
	}
	public void setCourseClassVO(courseClassVO courseClassVO) {
		this.courseClassVO = courseClassVO;
	}
	public CourseVO getCourseVO() {
		return CourseVO;
	}
	public void setCourseVO(CourseVO courseVO) {
		CourseVO = courseVO;
	}

	
}
