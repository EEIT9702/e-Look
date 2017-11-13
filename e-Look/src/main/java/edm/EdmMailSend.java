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

public class EdmMailSend {

	public static void sendmail() {
		
        //計算時間是否在每月1日,並擷取目前最新的會員名單email
        Calendar firstday = Calendar.getInstance();
		
		firstday.set(Calendar.DATE, firstday.getActualMinimum(Calendar.DATE));
		Long first = firstday.getTimeInMillis();
		
		Date today = new Date();
		Long tday = today.getTime();
		//System.out.println((tday - first)/1000/60/60);
        //目前日期毫秒-當月第一天毫秒,若相差在24小時內就執行,demo時再打開並把日期調到下月
//		if((tday - first) > 0 && ((tday - first)/1000/60/60) <= 24) {
			//System.out.println("1111");
			MemberDAO mdao = new MemberDAO();
			List<MemberVO> mVOs = mdao.getAll();
			
//		}//判斷式-每月第一天的結尾
		
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

        //帳號，密碼
//        SmtpAuthenticator authentication = 
//                new SmtpAuthenticator(user, pwd);

        // 建立一個Session物件，並把properties傳進去
//        Session mailSession = Session.
//                getDefaultInstance(props, authentication);
        Session mailSession = Session.getInstance(props, null);
     
        //建立一個 MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);

        // 設定寄件人                                          Java是收件人顯示寄件人的名稱
        message.setFrom(new InternetAddress(from,"e-Look線上學習網"));

        // 設定收件人
        //message.addRecipient(Message.RecipientType.TO,
        //        new InternetAddress(to));
        //for(MemberVO mVO : mVOs) {
            //message.addRecipient(Message.RecipientType.TO, new InternetAddress(mVO.getEmail()));
        	//改寫成固定mail,避免擾人luke710130@yahoo.com.tw
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("janhsu36@gmail.com"));
        //}

        // 設定主旨
        message.setSubject("e-Look電子月刊");
        
        // 設定寄件日期
        message.setSentDate(new Date());

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
        
        String CourseClass1 = "", CourseClass2 = "", CourseClass3 = "";
        if(eeVOs.get((eeVOs.size()-1)).getCourseClass1() != null) {
        	CourseClass1 = eeVOs.get((eeVOs.size()-1)).getCourseClass1() + " ";
        }
        if(eeVOs.get((eeVOs.size()-1)).getCourseClass2() != null) {
        	CourseClass2 = eeVOs.get((eeVOs.size()-1)).getCourseClass2() + " ";
        }
        if(eeVOs.get((eeVOs.size()-1)).getCourseClass3() != null) {
        	CourseClass3 = eeVOs.get((eeVOs.size()-1)).getCourseClass3();
        }
        String event = eeVOs.get(eeVOs.size()-1).getEventName();
        Integer discount = (int)(eeVOs.get(eeVOs.size()-1).getDiscount()*100);
        html.append("<h2 style='width:100%;color:red;font-size:45px'>" + event
        	+ "&nbsp;活動期間，" + CourseClass1 + CourseClass2 
        	+ CourseClass3 + " 類別課程享" + discount + "折優惠！！！</h2>");
        
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
        //picturePart.setHeader("Content-ID", "<image>");
        picturePart.setHeader("Content-ID", "<" + cVO.getCourseID() + ">");

        multipart.addBodyPart(picturePart);
        } //for迴圈結束括號
     
        textPart.setContent(html.toString(), "text/html; charset=UTF-8");
        multipart.addBodyPart(textPart);
        //message.setContent(multipart);

        // 將multipart加到mail的message裡
        message.setContent(multipart);
        // 產生mail message
        message.saveChanges();

        Transport transport = mailSession.getTransport("smtp");
        // 傳送
        transport.connect(host, user, pwd);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        //for(MemberVO mVO : mVOs) {
        	
        	//System.out.println(mVO.getEmail() + ",寄送完成");
        	System.out.println("janhsu36@gmail.com ,寄送完成");
        //}
    } catch (MessagingException | UnsupportedEncodingException mex) {
    	System.out.println(mex.getMessage());
    } catch (Exception e) {
    	//for(MemberVO mVO : mVOs) {
    	//System.out.println(mVO.getEmail() + "-" + e.getMessage());
    	System.out.println("janhsu36@gmail.com-" + e.getMessage());
    	//}
        e.printStackTrace();
        
    }
	}
}

