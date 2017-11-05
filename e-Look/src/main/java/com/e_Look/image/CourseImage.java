package com.e_Look.image;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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

import org.apache.commons.io.IOUtils;

import com.e_Look.Course.CourseService;
import com.e_Look.Course.CourseVO;

/**
 * Servlet implementation class CourseImage
 */
@WebServlet("/CourseImage")
public class CourseImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String CourseID=request.getParameter("CourseID");
		CourseService courseService =new CourseService();
		CourseVO CourseVO = courseService.findByPrimaryKey(Integer.valueOf(CourseID));
		ServletOutputStream os=null;
		byte[] bytes;
		response.setContentType("image/jpeg");
		if(CourseVO.getcPhoto()!=null){
			bytes=CourseVO.getcPhoto();
		}else{
			bytes = IOUtils.toByteArray(new FileInputStream(new File(request.getServletContext().getRealPath("")+"/img/請上傳課程封面.png")));
		}
		os = response.getOutputStream();
		os.write(bytes);
		os.close();
	}

	

}
