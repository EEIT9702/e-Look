package com.e_Look.OrderSystem.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.e_Look.Course.CourseVO;
import com.e_Look.Order.model.OrderService;
import com.e_Look.Order.model.OrderVO;
import com.e_Look.OrderDetails.model.OrderDetailsService;
import com.e_Look.OrderDetails.model.OrderDetailsVO;
import com.e_Look.member.model.MemberVO;
import com.e_Look.shoppingCart.model.jdbc.ShoppingCartService;
import com.e_Look.shoppingCart.model.jdbc.ShoppingCartVO;

@WebServlet("/ShoppingCartIntoOrder")
public class ShoppingCartIntoOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter rw = response.getWriter();
		
		ShoppingCartService scSvc = new ShoppingCartService();
		OrderService orderSvc = new OrderService();
		OrderDetailsService odSvc=new OrderDetailsService();
		
		
		HttpSession session = request.getSession();
		MemberVO memberVO=(MemberVO) session.getAttribute("LoginOK");
		Integer memberID = memberVO.getMemberID();
		
		
		OrderVO orderVO = orderSvc.findMemberUncheckOrder(memberID);
		List<CourseVO> list = scSvc.findByMemberID(memberID);
		if(orderVO==null && list.size()==0){
			rw.write("<script>alert('請先選購商品'); location.href='"+request.getHeader("Referer")+"'</script>");
			return;
		}else{
			if(orderVO==null){
				orderVO=new OrderVO();
				orderVO.setMemberID(memberID);
				orderSvc.insert(orderVO);
				orderVO=orderSvc.findMemberUncheckOrder(memberID);
			}
				for(CourseVO courseVO:list){
					ShoppingCartVO scVO = new ShoppingCartVO(memberID, courseVO);
					scSvc.delete(scVO);
					OrderDetailsVO odVO=new OrderDetailsVO();
					odVO.setCourseVO(courseVO);
					odVO.setOrderVO(orderVO);
					odVO.setOriginalPrice(courseVO.getSoldPrice());
					//記得調整成特價後的價格
					odVO.setBuyingPrice(courseVO.getSoldPrice());
					
					odSvc.insert(odVO);
				}
				response.sendRedirect(request.getContextPath()+"/settled/settled.jsp");
				return;
				
		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
