package com.e_Look.ReportCourse.model;

public class ReportCourseService {
	private ReportCourseDAO_interface dao;
	public ReportCourseService (){
		dao= new ReportCourseDAO();
	}
	public void insertReportCourse(Integer courseID,Integer memberID,String reportContent){
			ReportCourseVO reportCourseVO =new ReportCourseVO();
			reportCourseVO.setReportCourseID(courseID);
			reportCourseVO.setReportMemberID(memberID);
			reportCourseVO.setReportContent(reportContent);
			dao.insert(reportCourseVO);
	}


}
