package com.e_Look.sponsor.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.e_Look.sponsor.model.SponsorService;

@WebServlet("/SponsorController")
public class SponsorInserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String SponsorName=request.getParameter("SponsorName");
		int money=Integer.parseInt(request.getParameter("money"));
		int courseID=Integer.parseInt(request.getParameter("courseID"));
		
		SimpleDateFormat sfd=new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String sponosorDate=sfd.format(new Date());
		
		HttpSession session = request.getSession();
		List<Object> sponsor=new ArrayList<Object>();
		sponsor.add(SponsorName);
		sponsor.add(money);
		sponsor.add(courseID);

		session.setAttribute("sponosr", sponsor);
		
		
		SponsorService SponsorService=new SponsorService();
		SponsorService.addNameMoney(courseID,SponsorName,money);
		
		
		
		
		
		
		
		
	}

}
