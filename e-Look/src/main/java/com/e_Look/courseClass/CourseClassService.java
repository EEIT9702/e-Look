package com.e_Look.courseClass;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CourseClassService {
	private CourseClass_interface dao;
	public CourseClassService()	{
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");

        // 建立DAO物件
		dao =(CourseClass_interface) context.getBean("courseClassDAO");
	}
	
	public void updateEventID(CourseClassVO courseClassVO) {
		dao.updateEventID(courseClassVO);
	}
	public CourseClassVO getByCourseClassID(Integer courseClassID) {
		return dao.getByCourseClassID(courseClassID);
	}
	public List<CourseClassVO> getAll() {
		return dao.getAll();
	}
}
