package com.e_Look.eLookEvent;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Date;
public class eLookEventVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private Integer eventID;
	private String eventName;
	private InputStream ePhoto;
	private Date eStartDate;
	private Date eEndDate;
	private Double discount;
	
	public eLookEventVO(){}
	
	public eLookEventVO(Integer eventID, String eventName,InputStream ePhoto,
								Date eStartDate, Date eEndDate,Double discount){
		this.eventID=eventID;
		this.eventName=eventName;
		this.ePhoto=ePhoto;
		this.eStartDate=eStartDate;
		this.eEndDate=eEndDate;
		this.discount=discount;
		
	}
	
	
	public Integer getEventID() {
		return eventID;
	}
	public void setEventID(Integer eventID) {
		this.eventID = eventID;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public InputStream getePhoto() {
		return ePhoto;
	}
	public void setePhoto(InputStream ePhoto) {
		this.ePhoto = ePhoto;
	}
	public Date geteStartDate() {
		return eStartDate;
	}
	public void seteStartDate(Date eStartDate) {
		this.eStartDate = eStartDate;
	}
	public Date geteEndDate() {
		return eEndDate;
	}
	public void seteEndDate(Date eEndDate) {
		this.eEndDate = eEndDate;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	
}
