package com.e_Look.OrderSystem.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.e_Look.Order.model.OrderDAO;
import com.e_Look.Order.model.OrderVO;
import com.e_Look.OrderDetails.model.OrderDetailsDAO;
import com.e_Look.OrderDetails.model.OrderDetailsVO;
import com.e_Look.member.model.MemberVO;

import net.minidev.json.JSONValue;

@WebServlet("/OrderEdit")
public class OrderEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter rw = response.getWriter();
		
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO) session.getAttribute("LoginOK");
//		if(memberVO==null){
//			rw.write("<script>alert('請先登入'); location.href='"+request.getContextPath()+"'</script>");
//			return;
//		}
		
		String action=request.getParameter("action");
		if("loading".equals(action)){
			OrderDAO odao=new OrderDAO();
			OrderDetailsDAO oddao = new OrderDetailsDAO();
			
			OrderVO orderVO = odao.findMemberUncheckOrder(memberVO.getMemberID());
			
			List<OrderDetailsVO> odVOs= oddao.findByOrderID(orderVO.getOrderID());
			String jsonString = JSONValue.toJSONString(odVOs);  
			response.getWriter().print(jsonString);
		}
		
		
	}

}
