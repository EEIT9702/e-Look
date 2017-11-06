package com.e_Look.courseClass;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Transactional(readOnly = true)
public class CourseClassDAO implements CourseClass_interface{
	
	
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	
	private static final String SELECT_EVENT_COURSE_CLASS = "FROM CourseClassVO WHERE eventID=?";
	private static final String SELECT_ALL_COURSE_CLASS = "FROM CourseClassVO";
	private static final String UPDATE_EVENTID = "UPDATE CourseClassVO SET eventID=? WHERE CourseClassID=?";
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(CourseClassVO courseClassVO) {
		hibernateTemplate.save(courseClassVO);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer CourseClassID) {
		
		CourseClassVO courseClassVO=new CourseClassVO();
		courseClassVO.setCourseClassID(CourseClassID);
		hibernateTemplate.delete(courseClassVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(CourseClassVO courseClassVO) {
		
	hibernateTemplate.update(courseClassVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updateEventID(CourseClassVO courseClassVO) {
		if(courseClassVO.getEventVO()==null){
			hibernateTemplate.update(courseClassVO);
		}else{
			hibernateTemplate.bulkUpdate(UPDATE_EVENTID, courseClassVO.getEventVO().getEventID(),courseClassVO.getCourseClassID());
		}
	}
	
	@Override
	public CourseClassVO getByCourseClassID(Integer CourseClassID) {
		CourseClassVO courseClassVO = hibernateTemplate.get(CourseClassVO.class, CourseClassID);
		return courseClassVO;
	
	}

	public List<CourseClassVO> getByEventID(Integer eventID){
		return (List<CourseClassVO>) hibernateTemplate.find(SELECT_EVENT_COURSE_CLASS,eventID );
		
		
	}
			

	@Override
	public List<CourseClassVO> getAll() {
		return (List<CourseClassVO>) hibernateTemplate.find(SELECT_ALL_COURSE_CLASS);
	
	}
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");

        // 建立DAO物件
		CourseClass_interface dao =(CourseClass_interface) context.getBean("courseClassDAO");
		
//		查詢全部
		List<CourseClassVO> list1 = dao.getAll();
		for(CourseClassVO courseClassVO3:list1){
			System.out.print(courseClassVO3.getCourseClassID() + ",");
			System.out.print(courseClassVO3.getCcName() + ",");
			System.out.print(courseClassVO3.getEventVO().getEventID() + "\n");
		
		}
	}
}

