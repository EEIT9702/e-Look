package edm;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.e_Look.member.model.MemberDAO_JDBC;
import com.e_Look.member.model.MemberVO;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

public class test {

	public static void main(String[] args) {
		Calendar firstday = Calendar.getInstance();
		
		firstday.set(Calendar.DATE, firstday.getActualMinimum(Calendar.DATE));
		Long first = firstday.getTimeInMillis();
		//System.out.println(firstday.getTimeInMillis());
		
		Date today = new Date();
		Long tday = today.getTime();
		//System.out.println(today.getTime());
		System.out.println((tday - first)/1000/60/60);
		if((tday - first) > 0 && ((tday - first)/1000/60/60) <= 96) {
			System.out.println("1111");
			MemberDAO_JDBC mdao = new MemberDAO_JDBC();
			List<MemberVO> mVOs = mdao.getAll();
			
			try{
				
			//File txtfils = new File("D:\\Java Project\\e-Look\\repository\\e-Look\\src\\main\\java\\edm\\elist.txt");
			File txtfils = new File("src\\main\\java\\edm\\elist.txt");
			//File txtfils = new File("C:\\Users\\Student\\Desktop\\elist.txt");
			//FileOutputStream fout = new FileOutputStream(txtfils, true);
		    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(txtfils,false),"utf8"));
			for(MemberVO mVO : mVOs) {
					//FileWriter tfw = new FileWriter(txtfils);
					bw.write(mVO.getEmail());
					bw.write("\r\n");
					//bw.newLine();
//					tfw.flush();
//					tfw.close();
					
					//fout.close();

				System.out.println(mVO.getEmail());
			}
			bw.flush();
			bw.close();
			
			} catch(FileNotFoundException e){
				e.printStackTrace();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else{
			System.out.println("2222");

		}
		
	}

}
