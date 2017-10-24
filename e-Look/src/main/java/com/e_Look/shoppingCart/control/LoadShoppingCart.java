package com.e_Look.shoppingCart.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.Course.CourseVO;
import com.e_Look.shoppingCart.model.jdbc.*;

import net.minidev.json.JSONValue;

/**
 * Servlet implementation class LoadShoppingCart
 */
@WebServlet("/LoadShoppingCart")
public class LoadShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("不合法的請求");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("courseID"));
		try{
			Integer courseID = Integer.parseInt(request.getParameter("courseID"));
			Integer memberID = Integer.parseInt(request.getParameter("memberID"));
			ShoppingCartDAO dao = new ShoppingCartDAO();
			ShoppingCartVO shoppingCartVO=new ShoppingCartVO();
			CourseVO courseVO=new CourseVO();
			
			courseVO.setCourseID(courseID);
			shoppingCartVO.setMemberID(memberID);
			shoppingCartVO.setCourseVO(courseVO);
			dao.delete(shoppingCartVO);
			System.out.println("delete shoppingcart");
		}catch(NumberFormatException e){
			System.out.println(e);
			
			Integer memberID = Integer.parseInt(request.getParameter("memberID"));
			response.setCharacterEncoding("UTF-8");
			ShoppingCartDAO dao = new ShoppingCartDAO();
			List<CourseVO> courseVOs = dao.findByMemberID(memberID);
			String jsonString = JSONValue.toJSONString(courseVOs);  
			response.getWriter().print(jsonString);
			System.out.println("dopost");
		}
		
		
	}

}
