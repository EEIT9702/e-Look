package com.e_Look.tool;

import java.util.LinkedList;
import java.util.List;

import com.e_Look.Course.CourseVO;
import com.e_Look.CourseClassDetails.CourseClassDetailsVO;

public class RandomCourse {
	public static List<CourseClassDetailsVO> getRandomCourseClassDetailsVO(List<CourseClassDetailsVO> list){
		List<CourseClassDetailsVO> list2 = new LinkedList<CourseClassDetailsVO>();
		while(!list.isEmpty()){
			int i =(int) (Math.random()*list.size());
			list2.add(list.get(i));
			list.remove(i);
		}
		return list2;
	}
	
	public static List<CourseVO> getRandomCoureVO(List<CourseVO> list){
		List<CourseVO> list2 = new LinkedList<CourseVO>();
		while(!list.isEmpty()){
			int i =(int) (Math.random()*list.size());
			list2.add(list.get(i));
			list.remove(i);
		}
		return list2;
	}
	
	
}
