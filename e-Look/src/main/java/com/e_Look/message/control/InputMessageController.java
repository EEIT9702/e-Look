package com.e_Look.message.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.message.model.MessageService;


@WebServlet("/InputMessageController")
public class InputMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Utf-8");
		
		String mContent=request.getParameter("mContent");
		Integer courseID=Integer.parseInt(request.getParameter("courseID"));
		Integer messageID_response=Integer.parseInt(request.getParameter("messageID_response"));
		Integer memberID=Integer.parseInt(request.getParameter("memberID"));
		Byte status=0;
		System.out.println(mContent);
		System.out.println(courseID);
		System.out.println(messageID_response);
		System.out.println(memberID);
		System.out.println(status);
		
		MessageService messageService = new MessageService();
		messageService.addResponse(mContent, messageID_response, memberID, courseID, status);
	}

}
