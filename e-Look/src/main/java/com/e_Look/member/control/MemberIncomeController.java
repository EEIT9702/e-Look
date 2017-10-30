package com.e_Look.member.control;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.Course.CourseService;
import com.e_Look.Course.CourseVO;

import net.minidev.json.JSONValue;

/**
 * Servlet implementation class MemberIncome
 */
@WebServlet("/MemberIncomeController")
public class MemberIncomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIncomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String  memberID=request.getParameter("MemberID");
		CourseService courseService =new CourseService();
		List<CourseVO> onlineCourse= courseService.getAllCourseData(Integer.valueOf(memberID), 2);
		List<CourseVO> fundraisingCourse=courseService.getAllCourseData(Integer.valueOf(memberID), 3);
		 Map<String,List> map=new LinkedHashMap<String,List>();
		 map.put("onlineCourse", onlineCourse);
		 map.put("fundraisingCourse", fundraisingCourse);
		 String OrderVOJson= JSONValue.toJSONString(map);
		 response.getWriter().println(OrderVOJson);
		
	}

}
