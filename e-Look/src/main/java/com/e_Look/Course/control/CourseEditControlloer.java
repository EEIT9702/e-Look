package com.e_Look.Course.control;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.Course.CourseService;
import com.e_Look.Course.CourseVO;

/**
 * Servlet implementation class CreateNewCourseControlloer
 */
@WebServlet("/CourseEditControlloer")
public class CourseEditControlloer extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CourseService service = null;
		CourseVO course = null;
		Integer courseID = new Integer(request.getParameter("CourseID"));
		String courseName = request.getParameter("courseName");
		String preTool = request.getParameter("preTool");
		String background = request.getParameter("background");
		String ability = request.getParameter("ability");
		String targetgroup = request.getParameter("targetgroup");
		Integer soldPrice = new Integer(request.getParameter("soldPrice"));
		Integer courseLength = new Integer(request.getParameter("courseLength"));
		Integer targetStudentNumber = new Integer(request.getParameter("targetStudentNumber"));
		Date fundStartDate =  Date.valueOf(request.getParameter("fundStartDate"));
		Date fundEndDate =  Date.valueOf(request.getParameter("fundEndDate"));
		Date courseStartDate =  Date.valueOf(request.getParameter("courseStartDate"));
		Integer status = 0;
		String courseContent =request.getParameter("courseContent");
		Integer memberID = new Integer(request.getParameter("memberID"));
		
		
		
		
		
		
		
		
		
		
	}

}
