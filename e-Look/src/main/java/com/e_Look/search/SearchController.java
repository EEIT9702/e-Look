package com.e_Look.search;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.DispatcherServlet;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SearchDAO dao=new SearchDAO();
		String keyWord=request.getParameter("keyWord");
		String[] kk = keyWord.split(" ");
		for(String k:kk){
			System.out.println(k);
			if(k.length()>=1){
				SearchVO searchVO=new SearchVO();
				searchVO.setKeyWord(k);
				dao.insert(searchVO);
			}
		}
//		response.sendRedirect(getServletContext().getContextPath()+"/body/body_river.jsp");
		
		RequestDispatcher rd = request.getRequestDispatcher("/body/body_river.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
