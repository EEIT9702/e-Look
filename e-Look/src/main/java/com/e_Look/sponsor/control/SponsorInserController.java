package com.e_Look.sponsor.control;

import java.io.IOException;
import java.io.PrintWriter;
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
		request.setCharacterEncoding("UTF-8");
		
		String SponsorName=request.getParameter("SponsorName");
		String money=request.getParameter("money");
		int moneyInt=Integer.parseInt(money);
		int courseID=Integer.parseInt("200002");
		//用時間當oPay流水號
		SimpleDateFormat sfd=new SimpleDateFormat("yyyyMMddHHmmss");
		String MerchantTradeNo=sfd.format(new Date());
		
		HttpSession session = request.getSession();
		List<Object> sponsor=new ArrayList<Object>();
		sponsor.add(SponsorName);
		sponsor.add(moneyInt);
		sponsor.add(courseID);
		session.setAttribute("sponosr", sponsor);
		
		
		SponsorService SponsorService=new SponsorService();
		String formElement=SponsorService.getOPay(MerchantTradeNo,"200002", money, "HOME.jsp");
		System.out.println(formElement);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out =response.getWriter();
		
		out.print("<html>");
		out.print("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
		out.print("<title>oPay</title>");
		out.print("<body>");
		out.print(formElement);
		out.print("</body>");
		out.print("</html>");
		out.close();
		
		
		
		
	}

}
