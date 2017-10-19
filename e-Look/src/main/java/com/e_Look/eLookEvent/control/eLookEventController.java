package com.e_Look.eLookEvent.control;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.eLookEvent.eLookEventService;
import com.e_Look.eLookEvent.eLookEventVO;

@WebServlet("/backstage/elookeventinsert")
public class eLookEventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		 if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String eventName = req.getParameter("eventName");
					if (eventName == null || eventName.trim().length() == 0) {
						errorMsgs.add("活動名稱: 請勿空白");
					}
					//以下練習正則(規)表示式(regular-expression)
					String eventNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
					if(!eventName.trim().matches(eventNameReg) ) { 
						errorMsgs.add("員工姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
		            }
					
					java.sql.Date eStartDate = null;
					try {
						eStartDate = java.sql.Date.valueOf(req.getParameter("eStartDate").trim());
					} catch (IllegalArgumentException e) {
						eStartDate=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請選擇日期!");
					}
					
					java.sql.Date eEndDate = null;
					try {
						eEndDate = java.sql.Date.valueOf(req.getParameter("eEndDate").trim());
					} catch (IllegalArgumentException e) {
						eEndDate=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請選擇日期!");
					}
					
					
					Double discount = null;
					try {
						discount = new Double(req.getParameter("discount").trim());
					} catch (NumberFormatException e) {
						discount = 0.0;
						errorMsgs.add("折扣優惠請填數字");
					}
					
					
					
					eLookEventVO eLookEventVO = new eLookEventVO();
					eLookEventVO.setEventName(eventName);
					eLookEventVO.seteStartDate(eStartDate);
					eLookEventVO.seteEndDate(eEndDate);
					eLookEventVO.setDiscount(discount);
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("eLookEventVO", eLookEventVO); // 含有輸入格式錯誤的eLookEventVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("eventinsert.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					eLookEventService eLookEventSvc = new eLookEventService();
					eLookEventVO = eLookEventSvc.addEmp(eventName, eStartDate, eEndDate, discount);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					RequestDispatcher successView = req.getRequestDispatcher("backHome.jsp"); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("eventinsert.jsp");
					failureView.forward(req, res);
				}
			}
			
			
	
	}
	
	}
