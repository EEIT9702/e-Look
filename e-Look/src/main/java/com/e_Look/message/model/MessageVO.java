package com.e_Look.message.model;

import java.io.Serializable;
import java.io.InputStream;
import java.sql.Date;

public class MessageVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer messageID;
	private String mContent;
	private Date mTime;
	private Integer messageID_response;
	private Integer memberID;
	private Integer courseID;
	private Long bought;
	private Byte status;
	
	public MessageVO(){}
	

	public Integer getMessageID() {
		return messageID;
	}

	public void setMessageID(Integer messageID) {
		this.messageID = messageID;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public Date getmTime() {
		return mTime;
	}

	public void setmTime(Date mTime) {
		this.mTime = mTime;
	}

	public Integer getMessageID_response() {
		return messageID_response;
	}

	public void setMessageID_response(Integer messageID_response) {
		this.messageID_response = messageID_response;
	}

	public Integer getMemberID() {
		return memberID;
	}

	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}

	public Integer getCourseID() {
		return courseID;
	}

	public void setCourseID(Integer courseID) {
		this.courseID = courseID;
	}

	public Long getBought() {
		return bought;
	}

	public void setBought(Long bought) {
		this.bought = bought;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	};
	
	
}
