package com.e_Look.OrderDetails.model;

import java.io.Serializable;

import com.e_Look.Course.CourseVO;

public class OrderDetailsVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer orderID;
	private CourseVO courseVO;
	private Integer buyingPrice;
	private Integer originalPrice;
	public OrderDetailsVO(){
		
	}
	public OrderDetailsVO(Integer orderID, CourseVO courseVO, Integer buyingPrice, Integer originalPrice) {
		this.orderID = orderID;
		this.courseVO = courseVO;
		this.buyingPrice = buyingPrice;
		this.originalPrice = originalPrice;
	}


	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public CourseVO getCourseVO() {
		return courseVO;
	}
	public void setCourseVO(CourseVO courseVO) {
		this.courseVO = courseVO;
	}
	public Integer getBuyingPrice() {
		return buyingPrice;
	}
	public void setBuyingPrice(Integer buyingPrice) {
		this.buyingPrice = buyingPrice;
	}
	public Integer getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(Integer originalPrice) {
		this.originalPrice = originalPrice;
	}
	
	
}
