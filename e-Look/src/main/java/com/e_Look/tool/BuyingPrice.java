package com.e_Look.tool;

import java.sql.Date;
import java.util.List;

import com.e_Look.Course.CourseDAO;
import com.e_Look.Course.CourseVO;
import com.e_Look.CourseClassDetails.CourseClassDetailsDAO;
import com.e_Look.CourseClassDetails.CourseClassDetailsVO;

public class BuyingPrice {
	
	public static Integer getBuyingPrice(Integer courseID){
		Double discount = 1.0;
		CourseDAO cdao = new CourseDAO();
		CourseVO courseVO=cdao.findByPrimaryKey(courseID);
		Integer oPrice = courseVO.getSoldPrice();
		Integer price = oPrice;
		CourseClassDetailsDAO ccddao = new CourseClassDetailsDAO();
		List<CourseClassDetailsVO> ccdVOs = ccddao.findBycourseID(courseID);
		for(CourseClassDetailsVO ccdVO:ccdVOs){
			if(ccdVO.getCourseClassVO().getEventVO()!=null){
				System.out.println("該類別有活動");
				Date startDate = ccdVO.getCourseClassVO().getEventVO().geteStartDate();
				Date endDate = ccdVO.getCourseClassVO().getEventVO().geteEndDate();
				System.out.println("startDate:"+startDate);
				System.out.println("endDate:"+endDate);
				System.out.println("startDateMills:"+startDate.getTime());
				System.out.println("endDateMills:"+endDate.getTime());
				if(startDate.getTime()<=System.currentTimeMillis() && endDate.getTime()>=System.currentTimeMillis()){
					if(discount>ccdVO.getCourseClassVO().getEventVO().getDiscount()){
						discount=ccdVO.getCourseClassVO().getEventVO().getDiscount();
					}
				}
			}
		}
		price=(int) Math.round(oPrice*discount);
		return price;
	}
	
	
}
