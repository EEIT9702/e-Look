package com.e_Look.reportMessage.model;

import com.e_Look.message.model.MessageVO;

public class ReportMessageService {
	private ReportMessageDAO_interface dao;
	public ReportMessageService() {
		dao = new ReportMessageDAO();
	}
	public ReportMessageVO insertReportMessage(Integer messageID, Integer reportMemberID,
			String reportContent) {
		
		ReportMessageVO reportMessageVO = new ReportMessageVO();
		MessageVO messageVO = new MessageVO();
		
		messageVO.setMessageID(messageID);
		reportMessageVO.setMessageVO(messageVO);
		reportMessageVO.setReportMemberID(reportMemberID);
		reportMessageVO.setReportContent(reportContent);
		dao.insert(reportMessageVO);
		
		return reportMessageVO;
	}

	public ReportMessageVO updateReportMessageStatus(Integer reportId, Byte status) {
		
		ReportMessageVO reportMessageVO = new ReportMessageVO();
		reportMessageVO.setReportId(reportId);
		reportMessageVO.setStatus(status);
		dao.update(reportMessageVO);
		
		return reportMessageVO;
	}
	//寫著,但應該用不到
	public ReportMessageVO deleteReportMessage(Integer reportId) {
		
		ReportMessageVO reportMessageVO = new ReportMessageVO();
		reportMessageVO.setReportId(reportId);
		dao.update(reportMessageVO);
		
		return reportMessageVO;
	}
}
