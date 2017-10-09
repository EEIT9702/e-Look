package com.e_Look.courseClass;

import java.io.Serializable;

public class courseClassVO  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer CourseClassID;
	private String ccName;
	private Integer eventID;
	public courseClassVO(){}
	public courseClassVO(Integer CourseClassID,String ccName, Integer eventID){
		this.CourseClassID=CourseClassID;
		this.ccName=ccName;
		this.eventID=eventID;
		
	}
	
	public Integer getCourseClassID() {
		return CourseClassID;
	}
	public void setCourseClassID(Integer courseClassID) {
		CourseClassID = courseClassID;
	}
	public String getCcName() {
		return ccName;
	}
	public void setCcName(String ccName) {
		this.ccName = ccName;
	}
	public Integer getEventID() {
		return eventID;
	}
	public void setEventID(Integer eventID) {
		this.eventID = eventID;
	}
	
}
