package com.e_Look.eLookEvent.control;

import java.io.IOException;
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
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("ErrMsg", errorMsgs);

		
		 if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
				
				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String eventName = req.getParameter("eventName");
					if (eventName == null || eventName.trim().length() == 0) {
						//errorMsgs.add("活動名稱: 請勿空白");
						errorMsgs.put("errName", "請勿空白");
					}
					//以下練習正則(規)表示式(regular-expression)

					
					java.sql.Date eStartDate = null;
					try {
						eStartDate = java.sql.Date.valueOf(req.getParameter("eStartDate").trim());
					} catch (IllegalArgumentException e) {
						eStartDate=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.put("errStartDate","請選擇起始日期!");
					}
					
					java.sql.Date eEndDate = null;
					try {
						eEndDate = java.sql.Date.valueOf(req.getParameter("eEndDate").trim());
					} catch (IllegalArgumentException e) {
						eEndDate=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.put("errEndDate","請選擇結束日期!");
					}
					
					
					Double discount = null;
					try {
						discount = new Double(req.getParameter("discount").trim());
					} catch (NumberFormatException e) {
						errorMsgs.put("errCount","折扣優惠請填數字");
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
					errorMsgs.put("",e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("eventinsert.jsp");
					failureView.forward(req, res);
				}
			}
			
			
	
	}
	
	}
