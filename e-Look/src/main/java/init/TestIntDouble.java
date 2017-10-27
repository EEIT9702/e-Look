package init;

import java.sql.Date;

public class TestIntDouble {

	public static void main(String[] args) {
		java.util.Date jdate = new java.util.Date();
		System.out.println(jdate);
		
		java.sql.Date sdate = (java.sql.Date)jdate;
		System.out.println(sdate);
		
		
	}

}
