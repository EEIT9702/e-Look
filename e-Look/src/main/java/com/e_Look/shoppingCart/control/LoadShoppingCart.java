package com.e_Look.shoppingCart.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.e_Look.Course.CourseVO;
import com.e_Look.shoppingCart.model.jdbc.ShoppingCartDAO;

import net.minidev.json.JSONValue;

/**
 * Servlet implementation class LoadShoppingCart
 */
@WebServlet("/LoadShoppingCart")
public class LoadShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer memberID = Integer.parseInt(request.getParameter("memberID"));
		response.setCharacterEncoding("UTF-8");
		ShoppingCartDAO dao = new ShoppingCartDAO();
		List<CourseVO> courseVOs = dao.findByMemberID(memberID);
		String jsonString = JSONValue.toJSONString(courseVOs);  
		response.getWriter().print(jsonString);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
