package com.e_Look.reportMessage;

import java.util.List;

public interface ReportMessageDAO_interface {

	public void insert(ReportMessageVO reportMessageVO);
	//public void update(ReportMessageVO reportMessageVO);
	//public void delete(ReportMessageVO reportMessageVO);
	public ReportMessageVO findByReportId(Integer reportId);
	public List<ReportMessageVO> getAll();
}
