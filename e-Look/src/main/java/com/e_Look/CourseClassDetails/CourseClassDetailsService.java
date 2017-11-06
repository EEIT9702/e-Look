package com.e_Look.CourseClassDetails;

import java.util.LinkedList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.e_Look.Course.CourseVO;
import com.e_Look.courseClass.CourseClassVO;

public class CourseClassDetailsService {
	private CourseClassDetails_interface dao;
	
	public CourseClassDetailsService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
		dao =(CourseClassDetails_interface) context.getBean("courseClassDetailsDAO");
	}
	
	public void delete(Integer courseID){
		dao.delete(courseID);
	}
	public void insert(CourseVO courseVO, CourseClassVO courseClassVO){
		dao.insert(courseVO, courseClassVO);
	}
	
	public List<CourseClassDetailsVO> findBycourseID(Integer courseClassID){
		
		return dao.findBycourseID(courseClassID);
	}
	public List<CourseClassDetailsVO> getFreeCourse(Integer courseClassID){
		List<CourseClassDetailsVO> ccdVOs = dao.getBycourseClassID(courseClassID);
		List<CourseClassDetailsVO> freeccdVOs = new LinkedList<CourseClassDetailsVO>();
		
		for(CourseClassDetailsVO ccdVO : ccdVOs){
			if(ccdVO.getCourseVO().getSoldPrice() == 0 && ccdVO.getCourseVO().getStatus() == 2){
				freeccdVOs.add(ccdVO);
			}
		}
		return freeccdVOs;
	}
	
	public List<CourseClassDetailsVO> getFreeCourse(Integer courseClassID,String keyWord){
		List<CourseClassDetailsVO> ccdVOs = dao.getBycourseClassID(courseClassID);
		List<CourseClassDetailsVO> freeccdVOs = new LinkedList<CourseClassDetailsVO>();
		
		for(CourseClassDetailsVO ccdVO : ccdVOs){
			if(ccdVO.getCourseVO().getSoldPrice() == 0 && ccdVO.getCourseVO().getStatus() == 2 && ccdVO.getCourseVO().getCourseName().indexOf(keyWord)>=0){
				freeccdVOs.add(ccdVO);
			}
		}
		return freeccdVOs;
	}
	

	public List<CourseClassDetailsVO> getOnlineCourse(Integer courseClassID) {
		List<CourseClassDetailsVO> ccdVOs = dao.getBycourseClassID(courseClassID);
		List<CourseClassDetailsVO> onlineccdVOs = new LinkedList<CourseClassDetailsVO>();
		
		for(CourseClassDetailsVO ccdVO : ccdVOs) {
			if(ccdVO.getCourseVO().getSoldPrice() > 0 && ccdVO.getCourseVO().getStatus() == 2) {
				onlineccdVOs.add(ccdVO);
			}
		}
		return onlineccdVOs;
	}
	
	public List<CourseClassDetailsVO> getOnlineCourse(Integer courseClassID,String keyWord) {
		List<CourseClassDetailsVO> ccdVOs = dao.getBycourseClassID(courseClassID);
		List<CourseClassDetailsVO> onlineccdVOs = new LinkedList<CourseClassDetailsVO>();
		for(CourseClassDetailsVO ccdVO : ccdVOs) {
			if(ccdVO.getCourseVO().getSoldPrice() > 0 && ccdVO.getCourseVO().getStatus() == 2 && ccdVO.getCourseVO().getCourseName().indexOf(keyWord)>=0 ) {
				onlineccdVOs.add(ccdVO);
			}
		}
		return onlineccdVOs;
	}
	
	
	public List<CourseClassDetailsVO> getFoundRaiseCourse(Integer courseClassID) {
		List<CourseClassDetailsVO> ccdVOs = dao.getBycourseClassID(courseClassID);
		List<CourseClassDetailsVO> foundraiseccdVOs = new LinkedList<CourseClassDetailsVO>();
		
		for(CourseClassDetailsVO ccdVO : ccdVOs) {
			if(ccdVO.getCourseVO().getStatus() == 3) {
				foundraiseccdVOs.add(ccdVO);
			}
		}
		return foundraiseccdVOs;
	}
	
}


