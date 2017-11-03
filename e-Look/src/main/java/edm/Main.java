package edm;

import java.util.Properties;
 
public class Main extends java.lang.Thread {
    private org.apache.log4j.Logger log;
    private java.util.ArrayList<String> toList;
 
    private Properties p;
    private String content;
    private String subject;
 
    public Main() throws java.io.IOException {
        super();
 
        //log = org.apache.log4j.Logger.getLogger(this.getClass());
        java.io.FileReader fis = null;
        java.io.BufferedReader bis = null;
        toList = new java.util.ArrayList<String>();
 
        try {
            // 從外部取得設定檔資料
            p = new Properties();
           // log.info(this.getClass().getResource("/mail.properties").getPath());
            java.io.FileReader fr = new java.io.FileReader("src\\main\\java\\edm\\mail.properties");
            java.io.BufferedReader br = new java.io.BufferedReader(fr);
            String str;
            while ((str = br.readLine()) != null) {
                String[] tmp = str.split("=");
                p.setProperty(tmp[0], tmp[1]);
            }
            br.close();
            fr.close();
 
            // 名單
            fis = new java.io.FileReader(p.getProperty("edmList"));
            bis = new java.io.BufferedReader(fis);
 
            while ((str = bis.readLine()) != null) {
                toList.add(str.trim());
            }
            fis.close();
            bis.close();
            fis = null;
            bis = null;
 
            // 取得網頁內容
//            WebModule web = new WebModule();
//            if (web.doGet(p.getProperty("edmUrl"), null, null, "utf-8")) {
//                content = web.getContent();
//            } else {
//                throw new java.io.IOException("取得網頁資料錯誤!");
//            }
            
          content = "親愛的會員您好<br><br>推薦您前三名熱門課程：<br><br>"
        		  	+ "<img src='/webapp/body/img/001.jpg'/><br>"
            		+ "<a href='http://localhost:8081/e-Look/freeCourse-v1.jsp?CourseID=200001'>菁英中路教學</a><br>"
            		+ "<a href='http://localhost:8081/e-Look/freeCourse-v1.jsp?CourseID=200026'>photoshop入門</a><br>"
            		+ "<a href='http://localhost:8081/e-Look/freeCourse-v1.jsp?CourseID=200029'>西餐禮儀教學</a><br>"
            		+ "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            		+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            		+ "e-Look學習平台&nbsp;敬上";
       
 
            // 郵件標題
            //this.subject = p.getProperty("edmSubject", "utf-8");
            this.subject = "e-Look電子月刊";
 
        } catch (java.io.IOException e) {
            //log.info(e.getMessage());
        	System.out.println("log.info(e.getMessage()");
 
            throw e;
        } finally {
            try {
                if (bis != null)
                    bis.close();
 
                if (fis != null)
                    fis.close();
                bis = null;
                fis = null;
            } catch (java.io.IOException ex) {
 
            }
        }
 
    }
 
    public void run() {
 
        java.io.FileWriter fw = null;
 
        try {
 
            for (int i = 0; i < toList.size(); i++) {
 
                // 啟動thread開始寄信
            	Sender sender = new Sender(
                        toList.get(i), subject, content, p);
                sender.start();
                // 暫停數秒後再開始寄信
                Thread.sleep(Integer.parseInt(p.getProperty("sleep")));
 
                if (fw != null) {
                    fw.flush();
                    fw.write(toList.get(i) + "\r\n");
                }
 
            }
 
        } catch (Exception e) {
            //log.info(e.getMessage());
            e.printStackTrace();
        } finally {
            if (fw != null) {
                try {
                    fw.flush();
                    fw.close();
                } catch (Exception e) {
                }
 
            }
        }
 
    }
 
    public static void main(String args[]) throws java.io.IOException {
    	Main m = new Main();
        m.start();
        //System.out.println("Mail Sent");
    }
}