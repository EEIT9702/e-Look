package com.e_Look.message.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Integer messageID=Integer.parseInt(request.getParameter("messageID"));
//		System.out.println(messageID);
		MessageService messageService=new MessageService();
		List<MessageVO> messageList=messageService.findAllResponse(messageID);
		List<Map<String,Object>> list =new  LinkedList<Map<String,Object>>();
		//取回應
		for(MessageVO message:messageList){
			Map<String,Object> messageMap=new LinkedHashMap<String,Object>();
			messageMap.put("messageID", message.getMessageID());
			messageMap.put("mContent", message.getmContent());
			messageMap.put("mTime", message.getmTime());
			messageMap.put("messageID_response", message.getMessageID_response());
			messageMap.put("memberID", message.getMemberVO().getMemberID());
			messageMap.put("name", message.getMemberVO().getmName());
			messageMap.put("courseID", message.getCourseID());
			messageMap.put("status",message.getStatus());
			list.add(messageMap);
		}
		String messageJSON=JSONValue.toJSONString(list);
//		System.out.println(messageJSON);
		out.print(messageJSON);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("Utf-8");
		
		String mContent=request.getParameter("mContent");
		Integer courseID=Integer.parseInt(request.getParameter("courseID"));
		Integer memberID=Integer.parseInt(request.getParameter("memberID"));
		Byte status=0;
		System.out.println(mContent);
		System.out.println(courseID);

		System.out.println(memberID);
		MessageService messageService = new MessageService();
		messageService.addMessage(mContent, memberID, courseID, status);
		
	
	}
}