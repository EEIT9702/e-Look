package com.e_Look.image;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.e_Look.member.model.MemberService;
import com.e_Look.member.model.MemberVO;

/**
 * Servlet implementation class Image
 */
@WebServlet("/Image")
public class MemberImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String MemberID=request.getParameter("MemberID");
		MemberService service =new MemberService();
		MemberVO memberVo=service.getMember(Integer.valueOf(MemberID));
		ServletOutputStream os=null;
		response.setContentType("image/jpeg");
		 os = response.getOutputStream();
		 os.write(memberVo.getmPhoto());
	}


}
