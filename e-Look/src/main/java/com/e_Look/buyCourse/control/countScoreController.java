package com.e_Look.buyCourse.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.buyCourse.model.BuyCourseService;


@WebServlet("/countScoreController")
public class countScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BuyCourseService buyCourseService = new BuyCourseService();
		Integer courseID= Integer.parseInt(request.getParameter("courseID"));
		System.out.println(courseID);
		String Score=buyCourseService.avgScore(courseID).toString();
		if(Score==null||Score==""){
			
			
			
		}
		
		
	}

}
