package edm;

import java.util.*;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
 
import javax.mail.internet.*;

import com.e_Look.Course.CourseVO;
import com.e_Look.buyCourse.model.BuyCourseMailService;
 
public class Sender extends java.lang.Thread {
    private String content;
    // log
    private org.apache.log4j.Logger log;
    // 郵件標題
    private String subject;
    // 寄件對向
    private String to;
    // 設定檔
    private Properties p;
 
    // 建構
    public Sender(String to, String subject, String content, Properties p) {
        super();
        this.content = content;
        this.to = to;
        //log = org.apache.log4j.Logger.getLogger(this.getClass());
        this.p = p;
        this.subject = subject;
    }
 
    // thread run
    public void run() {
        try {
 
            // 設定傳送基本資訊
            // 取得mail host名稱
            String host = p.getProperty("host");
            // 取得寄信者mail
            String from = p.getProperty("from");
 
            // 取得寄信者帳號
            String user = p.getProperty("user");
            // 取得寄信者帳號密碼
            String pwd =  p.getProperty("pwd");
 
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
//            message.setFrom(new InternetAddress(from, p.getProperty("fromName",
//                    "utf-8")));
            message.setFrom(new InternetAddress(from, "e-Look學習平台"));
            // 設定mail To
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(
                    to));
            // 設定標題
            message.setSubject(this.subject);
 
            // 設定寄件日期
            message.setSentDate(new Date());
            
            
            //t++
            BuyCourseMailService bcServ = new BuyCourseMailService();
            List<CourseVO> cVOs = bcServ.getTopThreeBuyCourse(3);
            for( CourseVO cVO:cVOs){
            
            // 建立郵件本文內容
            Multipart multipart = new MimeMultipart();
 
            /**/

            
            
            // 文字部份，注意 img src 部份要用 cid:接下面附檔的header
            MimeBodyPart textPart = new MimeBodyPart();
            StringBuffer html = new StringBuffer();
            //StringBuffer div= html.append("<div style='text-align:center;'></div>");
            
            //original
            //for( CourseVO cVO:cVOs){
            
            html.append("<h2>親愛的會員您好，</h2>");
            html.append("<h2>推薦您前三名熱門課程：</h2>");
            html.append("<img style='width:300px;' src='cid:image'/><br>");
            if(cVO.getSoldPrice() == 0) {
            	html.append("<h3 style='margin-left:100px;'><a href='http://localhost:8081/e-Look/freeCourse-v1.jsp?CourseID="
    			+ cVO.getCourseID() + "'>" + cVO.getCourseName() +"</a><br>");
            }else{
            	html.append("<h3 style='margin-left:100px;'><a href='http://localhost:8081/e-Look/onlineCourse-v2.jsp?CourseID="
    			+ cVO.getCourseID() + "'>" + cVO.getCourseName() +"</a><br>");
            }
            textPart.setContent(html.toString(), "text/html; charset=UTF-8");

            
            // 圖檔部份，注意 html 用 cid:image，則header要設<image>
            MimeBodyPart picturePart = new MimeBodyPart();
            //FileDataSource fds = new FileDataSource("src/main/webapp/body/img/001.jpg");
            //要找讀取遠端ulr路徑的方法
            FileDataSource fds = new FileDataSource("http://localhost:8081/e-Look/CourseImage?CourseID=" + cVO.getCourseID());
            picturePart.setDataHandler(new DataHandler(fds));
            picturePart.setFileName(fds.getName());
            picturePart.setHeader("Content-ID", "<image>");

            multipart.addBodyPart(textPart);
            multipart.addBodyPart(picturePart);
//            }

            message.setContent(multipart);
      
            
            /**/
            
            // 郵件內容
            //BodyPart contentPart = new MimeBodyPart();
            // 給BodyPart對像設置內容和格式/編碼方式
           // contentPart.setContent(content, "text/html;charset=utf8");
 
            // 加入郵件內容到mutipart裡
           // multipart.addBodyPart(contentPart);
 
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
            //log.info(to + ",寄送完成");
            
            //+++
            }
        } catch (Exception e) {
 
            //log.info(this.to + "-" + e.getMessage());
            System.out.println(this.to + "-" + e.getMessage());
            e.printStackTrace();
 
        }
 
    }
}
