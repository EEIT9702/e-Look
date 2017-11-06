package com.e_Look.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.minidev.json.JSONValue;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController.do")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		SearchService ss = new SearchService();
//		SearchDAO dao=new SearchDAO();
		String keyWord=request.getParameter("keyWord");
		if(keyWord.length()>0){
			keyWord=keyWord.toLowerCase();
			SearchVO searchVO = new SearchVO();
			searchVO.setKeyWord(keyWord);
			searchVO.setEnterTime(new Date(System.currentTimeMillis()));
//			dao.insert(searchVO);     //spring修改前
			ss.addSearch(searchVO);     //spring修改
			
		}
		String[] strary = ss.getKeyWordRank();
		String jsonstrary = JSONValue.toJSONString(strary);
		PrintWriter rw = response.getWriter();
		rw.print(jsonstrary);
		rw.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
