package com.e_Look.message.control;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.e_Look.member.model.MemberService;
import com.e_Look.member.model.MemberVO;
import com.e_Look.message.model.MessageDAO;
import com.e_Look.message.model.MessageService;
import com.e_Look.message.model.MessageVO;

/**
 * Servlet implementation class MessageController
 */
@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
//		String messageID=request.getParameter("messageID");
		String mContent=request.getParameter("mContent").trim();
//		String mTime=request.getParameter("mTime");
//		String messageID_response=request.getParameter("messageID_response");
		
//		Integer memberID = new Integer(request.getParameter("memberID"));
//		Integer courseID = new Integer(request.getParameter("courseID"));
//		Long bought= new Long(request.getParameter("bought"));
//		Byte status= new Byte(request.getParameter("status"));
		String action = request.getParameter("action");
		String update = request.getParameter("update");
//		
				
		HttpSession session = request.getSession(false);
		
				
      if ("insert".equals(action)) { 
	
		MessageVO messageVO = null;
		// 準備存放錯誤訊息的物件
		
				// 將errorMsgMap放入request物件內，識別字串為 "errorMsgs"
		        List<String> errorMsgs = new LinkedList<String>();
				request.setAttribute("errorMsgs", errorMsgs);
//				if (status == 1) {
//					errorMsgs.add("無法新增留言");
//				}
				try{			
				if (mContent == null || mContent.trim().length() == 0) {
					errorMsgs.add("必須輸入內文");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher rd = request.getRequestDispatcher("/_Ccc/Message.jsp");
					rd.forward(request, response);
					System.out.println("2222");
					return;
					}

				
				MessageService service = new MessageService();
//				MessageDAO md;
//要再轉型   		MessageVO mb = new MessageVO(messageID, mContent, mTime, messageID_response, memberID,courseID,bought,status);
				
//				MessageVO messageVO1= new MessageVO();
//				messageVO1.setmContent(mContent);
//				messageVO1.setmTime();
//				MemberVO member=(MemberVO)session.getAttribute("LoginOK");
//				messageVO1.setMemberID(member.getMemberID());
//				messageVO1.setMemberID(100001);
//				messageVO1.setCourseID(200001);
//				messageVO1.setBought((long) 123);
//				messageVO1.setStatus((byte) 1);
				
				Integer memberID = 100001;
				Integer courseID = 200001;
				Long bought= (long)123;
				Byte status= 1;
				
				
				messageVO = service.addMessage(mContent, memberID,courseID,bought,status);
				
				session.setAttribute("MessageInsertOK", "新增留言成功");
				response.sendRedirect(request.getContextPath() +"/_Ccc/Message.jsp");
				} catch (Exception e) {
					errorMsgs.add("新增資料失敗:"+e.getMessage());
					RequestDispatcher failureView = request
							.getRequestDispatcher("/_Ccc/Message.jsp");
					failureView.forward(request, response);
				}
			}
      if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			
			if ("message".equals(update)){    // 修改留言
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer messageID = new Integer(request.getParameter("messageID").trim());
				
				if (mContent == null || mContent.trim().length() == 0) {
					errorMsgs.add("必須輸入內文");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher rd = request.getRequestDispatcher("/_Ccc/Message.jsp");
					rd.forward(request, response);
					System.out.println("2222");
					return;
					}
				
				MessageService service = new MessageService();
//				MessageDAO md;
//要再轉型   		MessageVO mb = new MessageVO(messageID, mContent, mTime, messageID_response, memberID,courseID,bought,status);
				
//				MessageVO messageVO1= new MessageVO();
//				messageVO1.setmContent(mContent);
//				messageVO1.setmTime();
//				MemberVO member=(MemberVO)session.getAttribute("LoginOK");
//				messageVO1.setMemberID(member.getMemberID());
//				messageVO1.setMemberID(100001);
//				messageVO1.setCourseID(200001);
//				messageVO1.setBought((long) 123);
//				messageVO1.setStatus((byte) 1);
				
				Integer memberID = 100001;
				Integer courseID = 200001;
				Long bought= (long)123;
				Byte status= 1;
				
				
				messageVO = service.addMessage(mContent, memberID,courseID,bought,status);
				
				session.setAttribute("MessageInsertOK", "新增留言成功");
				response.sendRedirect(request.getContextPath() +"/_Ccc/Message.jsp");
				} catch (Exception e) {
					errorMsgs.add("新增資料失敗:"+e.getMessage());
					RequestDispatcher failureView = request
							.getRequestDispatcher("/_Ccc/Message.jsp");
					failureView.forward(request, response);
				}
			}
				/***************************2.開始修改資料*****************************************/
				EmpService empSvc = new EmpService();
				empVO = empSvc.updateEmp(messageID, ename, job, hiredate, sal,comm, deptno);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				request.setAttribute("empVO", empVO); // 資料庫update成功後,正確的的empVO物件,存入request
				String url = "/emp/listOneEmp.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(request, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/emp/update_emp_input.jsp");
				failureView.forward(request, res);
			}
		} 
      
      }
      
	}
	}
