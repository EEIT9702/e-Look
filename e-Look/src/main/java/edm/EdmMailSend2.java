package edm;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.URLDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import com.e_Look.Course.CourseVO;
import com.e_Look.buyCourse.model.BuyCourseMailService;
import com.e_Look.courseClass.CourseClassService;
import com.e_Look.courseClass.CourseClassVO;
import com.e_Look.eLookEvent.eLookEventService;
import com.e_Look.eLookEvent.eLookEventVO;
import com.e_Look.member.model.MemberDAO;
import com.e_Look.member.model.MemberDAO_JDBC;
import com.e_Look.member.model.MemberVO;

public class EdmMailSend2 {

	public static void sendmail() {
		
		//Transport transport=null;
   try {
        //接收者的email.
        //String to = email;
        // 設定傳送基本資訊
        // 取得mail host名稱(寄件的smtp伺服器)
        String host = "smtp.gmail.com";
        
        // 取得寄信者mail
        String from = "eeit9702@gmail.com";

        // 取得寄信者帳號
        String  user = "eeit9702@gmail.com";
        
        // 取得寄信者帳號密碼
        String  pwd = "eeit9702eeit9702";

        Properties props = System.getProperties();

        // 設定SMTP server
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "465");
        // 是否需要認證
        props.put("mail.smtp.auth", "true");
        
        //Bypass the SSL authentication
        props.put("mail.smtp.ssl.enable", true);
        props.put("mail.smtp.starttls.enable", true);

        Session mailSession = Session.getInstance(props, null);
     
        //建立一個 MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);

        // 設定寄件人                                          Java是收件人顯示寄件人的名稱
        message.setFrom(new InternetAddress(from,"e-Look線上學習網"));

        // 設定收件人
        message.addRecipient(Message.RecipientType.TO, new InternetAddress("money11258@gmail.com"));

        // 設定主旨
        message.setSubject("e-Look電子月刊");
        
        // 設定寄件日期
        message.setSentDate(new Date("2017/11/18"));

        // 建立郵件本文內容
        Multipart multipart = new MimeMultipart();

        //呼叫Service,取前3名熱門購買的課程
        BuyCourseMailService bcServ = new BuyCourseMailService();
        List<CourseVO> cVOs = bcServ.getTopThreeBuyCourse(3);
        
        //呼叫AdService,取目前優惠活動類別名稱
        eLookEventService eeServ = new eLookEventService();
        List<eLookEventVO> eeVOs = eeServ.getAll();
        
        // **文字部份，注意 img src 部份要用 cid:接下面附檔的header
        MimeBodyPart textPart = new MimeBodyPart();
        StringBuffer html = new StringBuffer();
        //original
        html.append("<h1 style='color:black;width:100%'>親愛的會員您好 :</h1>");
        
        html.append("<h2 style='width:100%;color:red;font-size:45px'>感恩節優惠，11/21 ~ 11/30生活與烹飪類課程全部85折!!!</h2>");
        
        html.append("<h1 style='color:black;'>推薦您前三名熱門課程：</h1>");
        for( CourseVO cVO:cVOs){
    	html.append("<div style='display:inlineblock;float:left;width:400px;height:350px'>");
    	html.append("<img width='400px' height='300px' style='padding-right:5px;' src='cid:" + cVO.getCourseID() + "'/></br>");

        html.append("<h2 style='width:405px;text-align:center'><a href='http://localhost:8081/e-Look/onlineCourse-v2.jsp?CourseID="+ cVO.getCourseID() + "'>" + cVO.getCourseName() +"</a></h2><br><br>");
        html.append("</div>");
       
        // 圖檔部份，注意 html 用 cid:image，則header要設<image>
        MimeBodyPart picturePart = new MimeBodyPart();
		URL url  = new URL("http://localhost:8081/e-Look/CourseImage?CourseID=" + cVO.getCourseID());
        URLDataSource fds = new URLDataSource(url);
        //要找讀取遠端ulr路徑的方法
        picturePart.setDataHandler(new DataHandler(fds));
        picturePart.setFileName(fds.getName());
        picturePart.setHeader("Content-ID", "<" + cVO.getCourseID() + ">");

        multipart.addBodyPart(picturePart);
        } //for迴圈結束括號
     
        textPart.setContent(html.toString(), "text/html; charset=UTF-8");
        multipart.addBodyPart(textPart);

        // 將multipart加到mail的message裡
        message.setContent(multipart);
        // 產生mail message
        message.saveChanges();

        Transport transport = mailSession.getTransport("smtp");
        // 傳送
        transport.connect(host, user, pwd);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

    	System.out.println("janhsu36@gmail.com ,寄送完成");

    } catch (MessagingException | UnsupportedEncodingException mex) {
    	System.out.println(mex.getMessage());
    } catch (Exception e) {
    	System.out.println("janhsu36@gmail.com-" + e.getMessage());
        e.printStackTrace();
        
    }
	}
}

