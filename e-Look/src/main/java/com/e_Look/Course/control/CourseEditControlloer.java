package com.e_Look.Course.control;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.Course.CourseService;
import com.e_Look.Course.CourseVO;
import com.e_Look.CourseClassDetails.CourseClassDetailsDAO;

/**
 * Servlet implementation class CreateNewCourseControlloer
 */
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 1024, maxRequestSize = 1024
* 1024 * 1024)
@WebServlet("/com.e_Look.Course.control/CourseEditControlloer")
public class CourseEditControlloer extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Integer memberID= Integer.valueOf(request.getParameter("memberID"));
		Integer courseID= Integer.valueOf(request.getParameter("courseID"));
		CourseService courseService=new CourseService();
		courseService.deleteCourse(courseID);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		CourseService service = null;
		CourseVO courseVO = null;		
		Integer courseID = new Integer(request.getParameter("CourseID"));
		String courseName = request.getParameter("courseName");
		String preTool = request.getParameter("preTool");
		String background = request.getParameter("background");
		String ability = request.getParameter("ability");
		String targetgroup = request.getParameter("targetgroup");		
		Integer soldPrice=0;
		String soldPriceTEST = request.getParameter("soldPrice");
		if (!soldPriceTEST.equals("")){
			 soldPrice = new Integer(request.getParameter("soldPrice"));
		}
		
		Integer courseLength=0;
		String courseLengthTEST=request.getParameter("courseLength");
		if(!courseLengthTEST.equals("")){
			courseLength = new Integer(request.getParameter("courseLength"));	
		}
		Integer targetStudentNumber=0;
		String targetStudentNumberTEST=request.getParameter("targetStudentNumber");
		if(targetStudentNumberTEST!=null){
			if(targetStudentNumberTEST.length()>0)
			targetStudentNumber = new Integer(request.getParameter("targetStudentNumber"));	
		}
		
		Date fundStartDate =null;
		String fundStartDateTEST = request.getParameter("fundStartDate");
		if(fundStartDateTEST!=null){
			if(fundStartDateTEST.length()>0)
			fundStartDate =  Date.valueOf(request.getParameter("fundStartDate"));
		}
		
		Date fundEndDate =null;
		String fundEndDateTEST = request.getParameter("fundEndDate");
		if(fundEndDateTEST!=null){
			if(fundEndDateTEST.length()>0)
			fundEndDate =  Date.valueOf(request.getParameter("fundEndDate"));
		}
		
		Date courseStartDate =null;
		String courseStartDateTEST = request.getParameter("courseStartDate");
		if(courseStartDateTEST!=null){
			if(courseStartDateTEST.length()>0)
			courseStartDate =  Date.valueOf(request.getParameter("courseStartDate"));
		}
								
		String courseContent =request.getParameter("courseContent");
		
		
		service = new CourseService();
		courseVO= new CourseVO(courseID,courseName,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseContent);
		service.updateCourseContent(courseVO);		
		service.updateCourseImage(courseID, request.getPart("picture"));
		
	}

}
