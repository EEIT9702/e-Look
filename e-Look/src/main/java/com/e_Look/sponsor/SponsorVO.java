package com.e_Look.sponsor;

import java.io.Serializable;

public class SponsorVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer courseID;
	private String SponsorName;
	private Integer money;
	public SponsorVO() {};
	
	public SponsorVO(Integer courseID, String SponsorName, Integer money) {
		this.courseID = courseID;
		this.SponsorName = SponsorName;
		this.money = money;
	}
	
	public Integer getCourseID() {
		return courseID;
	}

	public void setCourseID(Integer courseID) {
		this.courseID = courseID;
	}

	public String getSponsorName() {
		return SponsorName;
	}

	public void setSponsorName(String sponsorName) {
		SponsorName = sponsorName;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

}
