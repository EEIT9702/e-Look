package com.e_Look.Order.model;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Date;


public class OrderVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer orderID;
	private Integer memberID;
	private String receiptNO;
	private Date orderTime;
	public OrderVO(){};
	public OrderVO(Integer orderID, Integer memberID, String receiptNO, Date orderTime) {
		super();
		this.orderID = orderID;
		this.memberID = memberID;
		this.receiptNO = receiptNO;
		this.orderTime = orderTime;
	}

	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public String getReceiptNO() {
		return receiptNO;
	}
	public void setReceiptNO(String receiptNO) {
		this.receiptNO = receiptNO;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	
}
