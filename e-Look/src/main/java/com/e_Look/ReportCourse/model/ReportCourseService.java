package com.e_Look.ReportCourse.model;

import java.sql.Date;

public class ReportCourseService {
	private ReportCourseDAO_interface dao;
	public ReportCourseService (){
		dao= new ReportCourseDAO();
	}
	public void insertReportCourse(Integer courseID,Integer memberID,String reportCon,Date reportDate){
		
		
	}
}
