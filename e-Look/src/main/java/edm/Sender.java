package edm;

import java.net.URL;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.URLDataSource;
import javax.mail.*;
 
import javax.mail.internet.*;

import com.e_Look.Course.CourseVO;
import com.e_Look.buyCourse.model.BuyCourseMailService;
 
public class Sender extends java.lang.Thread {
    // 寄件對向
    private String to;
    // 設定檔
    //private Properties p;
 
    // 建構
    public Sender(String to, String subject, String content, Properties p) {
        super();
        this.to = to;
        //this.p = p;
    }
 
    // thread run
	public void run() {
        try {
 
            // 設定傳送基本資訊
            // 取得mail host名稱(寄件的smtp伺服器)
            String host = "smtp.gmail.com";
            
            // 取得寄信者mail
            //String from = p.getProperty("from");
            String from = "eeit9702@gmail.com";
 
            // 取得寄信者帳號
            String  user = "eeit9702@gmail.com";
            
            // 取得寄信者帳號密碼
            String  pwd = "eeit9702eeit9702";
 
            Properties props = System.getProperties();
 
            // 設定SMTP server
            props.put("mail.smtp.host", host);
            // 是否需要認證
            props.put("mail.smtp.auth", "true");
            
            //Bypass the SSL authentication
            props.put("mail.smtp.ssl.enable", true);
            props.put("mail.smtp.starttls.enable", true);
 
            // 依據Properties建立一個Session
 
            Session mailSession = Session.getInstance(props, null);
 
            // 從Session建立一個Message
            MimeMessage message = new MimeMessage(mailSession);
            
            // 設定mail From
//          message.setFrom(new InternetAddress(from, p.getProperty("fromName",
//                    "utf-8")));
            message.setFrom(new InternetAddress(from, "e-Look學習平台"));
            // 設定mail To
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(
                    to));
            // 設定標題
            message.setSubject("e-Look電子月刊tt");
 
            // 設定寄件日期
            message.setSentDate(new Date());
            
            
            // 建立郵件本文內容
            Multipart multipart = new MimeMultipart();
 
            //呼叫Service,取前3名熱門購買的課程
            BuyCourseMailService bcServ = new BuyCourseMailService();
            List<CourseVO> cVOs = bcServ.getTopThreeBuyCourse(3);
            
            // **文字部份，注意 img src 部份要用 cid:接下面附檔的header
            MimeBodyPart textPart = new MimeBodyPart();
            StringBuffer html = new StringBuffer();
            //original
            html.append("<h2>親愛的會員您好，</h2>");
            html.append("<h2>推薦您前三名熱門課程：</h2>");
            for( CourseVO cVO:cVOs){
        	html.append("<img style='width:300px;' src='cid:" + cVO.getCourseID() + "'/><br>");
            if(cVO.getSoldPrice() == 0) {
            	//System.out.println("free");
            	html.append("<h3 style='width:300px;text-align:center;'><a href='http://localhost:8081/e-Look/freeCourse-v1.jsp?CourseID="
    			+ cVO.getCourseID() + "'>" + cVO.getCourseName() +"</a><br><br>");
            }else if(cVO.getSoldPrice() > 0){
            	//System.out.println("buy");
            	html.append("<h3 style='width:300px;text-align:center;'><a href='http://localhost:8081/e-Look/onlineCourse-v2.jsp?CourseID="
    			+ cVO.getCourseID() + "'>" + cVO.getCourseName() +"</a><br><br>");
            }
            // 圖檔部份，注意 html 用 cid:image，則header要設<image>
            MimeBodyPart picturePart = new MimeBodyPart();
    		URL url  = new URL("http://localhost:8081/e-Look/CourseImage?CourseID=" + cVO.getCourseID());
            URLDataSource fds = new URLDataSource(url);
            //要找讀取遠端ulr路徑的方法
            picturePart.setDataHandler(new DataHandler(fds));
            picturePart.setFileName(fds.getName());
            //picturePart.setHeader("Content-ID", "<image>");
            picturePart.setHeader("Content-ID", "<" + cVO.getCourseID() + ">");

            multipart.addBodyPart(picturePart);
            } //for迴圈結束括號
            textPart.setContent(html.toString(), "text/html; charset=UTF-8");
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
 
            // 將multipart加到mail的message裡
            message.setContent(multipart);
            // 產生mail message
            message.saveChanges();
 
            Transport transport = mailSession.getTransport("smtp");
            // 傳送
            transport.connect(host, user, pwd);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println(to + ",寄送完成");
            
        } catch (Exception e) {
            System.out.println(this.to + "-" + e.getMessage());
            e.printStackTrace();
 
        }
 
    }
}
