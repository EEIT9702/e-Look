package zhi;

import java.io.*;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(location = "", 
fileSizeThreshold = 1024 * 1024, 
maxFileSize = 1024 * 1024 * 500, 
maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/testjsp/zhi/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		

		//getPart()方法是getParameter()的檔案版
		Part part = request.getPart("myFile");
		System.out.println(part.getContentType());
		
		//取得MineType
		String fileName = part.getSubmittedFileName();
		System.out.println(fileName);
		
		
		//取得副檔名".jpg"
		String subFileName=fileName.substring(fileName.lastIndexOf("."));
		System.out.println(subFileName);
		
		
		//以下參考基礎JAVA IO
		InputStream is = part.getInputStream();
		
		
		//之後上傳檔案的路徑可以根據memberID和courseID動態變更		
		//JAVA 路徑的兩種表示方式  由於\為跳脫字元 所以要打\\
		//建立資料夾
		new File("D:/eLookvideo/memberID").mkdirs();
		
		
		FileOutputStream fos = new FileOutputStream("D:\\eLookvideo\\memberID\\courseID"+subFileName);
		int data;
		while((data=is.read())!=-1){
			fos.write(data);
		}
		fos.close();
		is.close();		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
