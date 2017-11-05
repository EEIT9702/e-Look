package edm;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import com.e_Look.member.model.MemberDAO_JDBC;
import com.e_Look.member.model.MemberVO;
 
public class EdmMain extends java.lang.Thread {
    //private org.apache.log4j.Logger log;
    private java.util.ArrayList<String> toList;
 
    private Properties p;
    private String content;
    private String subject;
 
    public EdmMain() throws java.io.IOException {
        super();
        
        //計算時間是否在每月1日,並擷取目前最新的會員名單email
        Calendar firstday = Calendar.getInstance();
		
		firstday.set(Calendar.DATE, firstday.getActualMinimum(Calendar.DATE));
		Long first = firstday.getTimeInMillis();
		
		Date today = new Date();
		Long tday = today.getTime();
		System.out.println((tday - first)/1000/60/60);
        //目前日期毫秒-當月第一天毫秒,若相差在24小時內就執行,demo時再打開並把日期調到下月
//		if((tday - first) > 0 && ((tday - first)/1000/60/60) <= 24) {
			System.out.println("1111");
			MemberDAO_JDBC mdao = new MemberDAO_JDBC();
			List<MemberVO> mVOs = mdao.getAll();
			
			try{
			File txtfils = new File("src\\main\\java\\edm\\elist.txt");
		    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(txtfils,false),"utf8"));
			for(MemberVO mVO : mVOs) {
					bw.write(mVO.getEmail());
					bw.write("\r\n");
				//System.out.println(mVO.getEmail());
			}
			bw.flush();
			bw.close();
			} catch(FileNotFoundException e){
				e.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
//		}//判斷式-每月第一天的結尾
        
        
		//要讀取寄信設定檔用
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
            //測試時先用list.txt的mail測試,demo時再改用elist.txt,會取出當下所有會員並寄信
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