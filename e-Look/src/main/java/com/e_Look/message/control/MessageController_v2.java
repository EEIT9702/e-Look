package com.e_Look.message.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.message.model.MessageService;
import com.e_Look.message.model.MessageVO;

import net.minidev.json.JSONValue;

@WebServlet("/MessageController_v2")

public class MessageController_v2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Integer messageID=Integer.parseInt(request.getParameter("messageID"));
		System.out.println(messageID);
		MessageService messageService=new MessageService();
		
		List<MessageVO> messageList=messageService.findAllResponse(messageID);//取回應
		for(MessageVO MessageVO:messageList){
			System.out.print(MessageVO.getmContent()+"*****"+MessageVO.getmTime());
		}
		String messageJSON=JSONValue.toJSONString(messageList);
		System.out.println(messageJSON);
		out.print(messageJSON);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Integer messageID=Integer.parseInt(request.getParameter("messageID"));
		System.out.println(messageID);
		MessageService messageService=new MessageService();
		
		List<MessageVO> messageList=messageService.findAllResponse(messageID);//取回應
		for(MessageVO MessageVO:messageList){
			System.out.print(MessageVO.getmContent()+"*****"+MessageVO.getmTime());
		}
		
		String messageJSON=JSONValue.toJSONString(messageList);
							
		System.out.println(messageJSON);
		out.print(messageJSON);
		
	}
}