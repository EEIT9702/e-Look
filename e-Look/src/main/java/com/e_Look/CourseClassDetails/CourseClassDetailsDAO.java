package com.e_Look.CourseClassDetails;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.Course.CourseVO;
import com.e_Look.courseClass.CourseClassVO;
@Transactional(readOnly = true)
public class CourseClassDetailsDAO implements CourseClassDetails_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	
	private static final String INSERT_COURSE_N_CLASS = 
			"INSERT INTO CourseClassDetailsVO (courseID,courseName,courseClassID,ccName) VALUES (?,?,?,?)";
	
//	private static final String UPDATE_courseNClass = 
//			"update CourseClassDetails set CourseClassID=? where courseID=?";
	
	private static final String DELETE_COURSE_N_CLASS = 
			"DELETE FROM CourseClassDetailsVO WHERE courseID=?";
	
	private static final String SELECT_BY_COURSE_CLASSID = 
			"FROM CourseClassDetailsVO WHERE courseClassID=?";
	
	private static final String SELECT_BY_COURSEID = 
			"FROM CourseClassDetailsVO WHERE courseID=?";
	
	private static final String SELECT_ALL = 
			"FROM CourseClassDetailsVO";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(CourseVO courseVO, CourseClassVO courseClassVO) {
		CourseClassDetailsVO courseClassDetailsVO=new CourseClassDetailsVO();
		courseClassDetailsVO.setCcName(courseClassVO.getCcName());
		courseClassDetailsVO.setCourseClassVO(courseClassVO);
		courseClassDetailsVO.setCourseVO(courseVO);
		courseClassDetailsVO.setCourseName(courseVO.getCourseName());
		hibernateTemplate.save(courseClassDetailsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(CourseClassVO courseClassVO, CourseVO courseVO) {


	}
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer courseID) {
		
//		CourseVO courseVO=new CourseVO();
//		courseVO.setCourseID(courseID);
//		CourseClassDetailsVO courseClassDetailsVO=new CourseClassDetailsVO();
//		courseClassDetailsVO.setCourseVO(courseVO);
		hibernateTemplate.bulkUpdate(DELETE_COURSE_N_CLASS, courseID);
	}

	@Override
	public List<CourseClassDetailsVO> getBycourseClassID(Integer CourseClassID) {
		return (List<CourseClassDetailsVO>) hibernateTemplate.find(SELECT_BY_COURSE_CLASSID, CourseClassID);

	}

	@Override
	public List<CourseClassDetailsVO> findBycourseID(Integer CourseID) {
		return (List<CourseClassDetailsVO>) hibernateTemplate.find(SELECT_BY_COURSEID, CourseID);
	}

	@Override
	public List<CourseClassDetailsVO> getAll() {
		
		return (List<CourseClassDetailsVO>) hibernateTemplate.find(SELECT_ALL);
	}
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");

        // 建立DAO物件
		CourseClassDetails_interface dao =(CourseClassDetails_interface) context.getBean("courseClassDetailsDAO");
		//新増
//			CourseVO courseVO=new CourseVO();
//			courseVO.setCourseID(200119);
//			courseVO.setCourseName("輸入課程標題11");
//			CourseClassVO courseClassVO =new CourseClassVO();
//			courseClassVO.setCcName("影音");
//			courseClassVO.setCourseClassID(104);
//			dao.insert(courseVO, courseClassVO);
		//刪除
//		dao.delete(200119);
		//查詢全部
//		List<CourseClassDetailsVO> list = dao.getAll();
//		for(CourseClassDetailsVO ccDetailsVO3 : list) {
//			System.out.print(ccDetailsVO3.getCourseVO().getCourseID() + ", ");
//			System.out.print(ccDetailsVO3.getCourseName() + ", ");
//			System.out.print(ccDetailsVO3.getCourseClassVO().getCourseClassID() + ", ");
//			System.out.print(ccDetailsVO3.getCcName() + "\n");
//		}
	}
}
