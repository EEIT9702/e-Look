package com.e_Look.OrderDetails.model;

import java.io.Serializable;

public class OrderDetailsVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer orderID;
	private Integer courseID;
	private Integer buyingPrice;
	private Integer originalPrice;
	public OrderDetailsVO(){
		
	}
	public OrderDetailsVO(Integer orderID, Integer courseID, Integer buyingPrice, Integer originalPrice) {
		this.orderID = orderID;
		this.courseID = courseID;
		this.buyingPrice = buyingPrice;
		this.originalPrice = originalPrice;
	}


	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getCourseID() {
		return courseID;
	}
	public void setCourseID(Integer courseID) {
		this.courseID = courseID;
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
