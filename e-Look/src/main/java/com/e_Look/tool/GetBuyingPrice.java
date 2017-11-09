package com.e_Look.tool;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.Course.CourseService;
import com.e_Look.Course.CourseVO;

/**
 * Servlet implementation class GetBuyingPrice
 */
@WebServlet("/GetBuyingPrice")
public class GetBuyingPrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter rw = response.getWriter();
		try{
			Integer courseID=Integer.parseInt(request.getParameter("courseID"));
			CourseService cSvc = new CourseService();
			CourseVO courseVO=cSvc.findByPrimaryKey(courseID);
			
			int soldPrice=courseVO.getSoldPrice();
			int buyingPrice=BuyingPrice.getBuyingPrice(courseID);
			
			if(buyingPrice!=soldPrice && courseVO.getStatus()!=3){
				rw.write("<span class='"+buyingPrice+"' style='color:red' >特價："+buyingPrice+" 元</span>");
			}else{
				rw.write("<span class='"+buyingPrice+"' > 售價："+buyingPrice+" 元</span>");
			}
			
		}catch(NumberFormatException e){
			e.printStackTrace();
		}finally {
			rw.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
