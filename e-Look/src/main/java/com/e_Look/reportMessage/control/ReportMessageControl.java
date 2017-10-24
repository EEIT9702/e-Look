package com.e_Look.reportMessage.control;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.reportMessage.model.ReportMessageService;
import com.e_Look.reportMessage.model.ReportMessageVO;

/**
 * Servlet implementation class ReportMessageControl
 */
@WebServlet("/ReportMessageControl")
public class ReportMessageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if ("insertReportMessage".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String reportContent = request.getParameter("reportContent");
				if (reportContent == null || reportContent.trim().length() == 0) {
					errorMsgs.add("請輸入檢舉內容");
				}
				//以下練習正則(規)表示式(regular-expression)
				
				/***************************其他可能的錯誤處理*************************************/
			}catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/message/message.jsp");
				failureView.forward(request, response);
			}
			
		}
		
		if("getReportMessage".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數****************************************/
				Integer status = new Integer(request.getParameter("status"));
				/***************************2.開始查詢資料*****************************************/
				ReportMessageService rmService = new ReportMessageService();
				List<ReportMessageVO> reportMessageVO = rmService.findNotHandle();
				
				if (reportMessageVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = request
							.getRequestDispatcher("/backstage/back_report.jsp");
					failureView.forward(request, response);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				request.setAttribute("reportMessageVO", reportMessageVO); // 資料庫取出的empVO物件,存入req
				String url = "/backstage/back_report.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(request, response);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/backstage/back_report.jsp");
				failureView.forward(request, response);
			}
		}
	}

}
