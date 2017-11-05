package edm;

import java.util.Properties;
 
public class EdmMain extends java.lang.Thread {
    //private org.apache.log4j.Logger log;
    private java.util.ArrayList<String> toList;
 
    private Properties p;
    private String content;
    private String subject;
 
    public EdmMain() throws java.io.IOException {
        super();
 
        java.io.FileReader fis = null;
        java.io.BufferedReader bis = null;
        toList = new java.util.ArrayList<String>();
 
        try {
            // 從外部取得設定檔資料
            p = new Properties();
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
            //fis = new java.io.FileReader("C:\\Users\\MSI-GL72-6QF\\Desktop\\list.txt");
            fis = new java.io.FileReader("src\\main\\java\\edm\\list.txt");
            bis = new java.io.BufferedReader(fis);
 
            while ((str = bis.readLine()) != null) {
                toList.add(str.trim());
            }
            fis.close();
            bis.close();
            fis = null;
            bis = null;

        } catch (java.io.IOException e) {
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
    	EdmMain m = new EdmMain();
        m.start();
        //System.out.println("Mail Sent");
    }
}