package edm;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class test {

	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException {
		
      InputStream in = null;
      FileOutputStream out = null;
		//URL url  = new URL(mPhoto);
		//memberVO1.setmPhoto(url.openStream());
      URL url = new URL("http://localhost:8081/e-Look/onlineCourse-v2.jsp?CourseID=200001");// 利用使用者輸入的網址建立URL對像
      URLConnection conn = url.openConnection();// 利用URL對像獲得URLConnection對像
      in = conn.getInputStream();// 獲得InputStream對像
      //out = new FileOutputStream("C:\\Users\\MSI-GL72-6QF\\Desktop" + "download.html");// 建立下載的檔案及輸出流
      out = new FileOutputStream("C:\\Users\\MSI-GL72-6QF\\Desktop" + "download.html");// 建立下載的檔案及輸出流
      int data;
      while ((data = in.read()) != -1) {
          out.write(data);// 寫入要下載的檔案的資料
      }

	}

}
