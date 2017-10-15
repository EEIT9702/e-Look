package com.e_Look.reportMessage;

import java.io.Serializable;
import java.sql.Date;

public class ReportMessageVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer reportId;
	private Integer reportMessageID;
	private Integer reportMemberID;
	private String reportContent;
	private Date reportTime;
	private Byte status;
	public ReportMessageVO(){};
	
	public ReportMessageVO(Integer reportId, Integer reportMessageID, Integer reportMemberID,
			String reportContent, Date reportTime, Byte status){
		this.reportId = reportId;
		this.reportMessageID = reportMessageID;
		this.reportMemberID = reportMemberID;
		this.reportContent = reportContent;
		this.reportTime = reportTime;
		this.status = status;
	};
	
	public Integer getReportId() {
		return reportId;
	}
	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}
	public Integer getReportMessageID() {
		return reportMessageID;
	}
	public void setReportMessageID(Integer reportMessageID) {
		this.reportMessageID = reportMessageID;
	}
	public Integer getReportMemberID() {
		return reportMemberID;
	}
	public void setReportMemberID(Integer reportMemberID) {
		this.reportMemberID = reportMemberID;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Date getReportTime() {
		return reportTime;
	}
	public void setReportTime(Date reportTime) {
		this.reportTime = reportTime;
	}
	public Byte getStatus() {
		return status;
	}
	public void setStatus(Byte status) {
		this.status = status;
	}
}
