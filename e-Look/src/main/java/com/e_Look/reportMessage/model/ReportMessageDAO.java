package com.e_Look.reportMessage.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.message.model.MessageVO;

public class ReportMessageDAO implements ReportMessageDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	
	private static final String INSERT_REPORT_MESSAGE =
			"INSERT INTO ReportMessage (reportMessageID, reportMemberID, reportContent, reportTime, status) VALUES (?,?,?,getDate(),0)";
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(ReportMessageVO reportMessageVO) {
		hibernateTemplate.save(reportMessageVO);
	}
	
	private static final String UPDATE_STATUS =
		    "UPDATE ReportMessageVO SET status=? WHERE reportId=?";
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(ReportMessageVO reportMessageVO) {	
		hibernateTemplate.bulkUpdate(UPDATE_STATUS, reportMessageVO.getStatus(), reportMessageVO.getReportId());
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer reportID) {
		ReportMessageVO rmVO = new ReportMessageVO();
		rmVO.setReportId(reportID);
		hibernateTemplate.delete(rmVO);
	}
	
	@Override
	public ReportMessageVO findByReportId(Integer reportId) {
		return hibernateTemplate.get(ReportMessageVO.class, reportId);
	}
	
	private static final String SELECT_NOT_HANDLE_REPORT_MESSAGE =
			"FROM ReportMessageVO WHERE status=0";
	@Override
	public List<ReportMessageVO> getNotHandle() {
		List<ReportMessageVO> notHandleList = (List<ReportMessageVO>)hibernateTemplate.find(SELECT_NOT_HANDLE_REPORT_MESSAGE);
		return notHandleList;
	}
	
	@Override
	public List<ReportMessageVO> getAll() {
		List<ReportMessageVO> list = (List<ReportMessageVO>)hibernateTemplate.find("from ReportMessageVO");
		return list;
	}
	
	private static final String GET_JSON = "SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID,"
			+ " rm.reportMemberID, rm.reportContent, rm.reportTime, rm.status"
			+ " FROM Message m INNER JOIN ReportMessage rm ON m.messageID = "
			+ "rm.reportMessageID WHERE rm.status=?";
	@Override
	public String getJSON(Integer status) {
		String jsonString;
		List <ReportMessageVO>l2 = (List<ReportMessageVO>) hibernateTemplate.find("from ReportMessageVO WHERE status=?", status);
		
		List l1 = new LinkedList();
			 
			 for(ReportMessageVO rVO : l2) {
				 Map m1 = new HashMap();  
				 m1.put("messageID", rVO.getMessageVO().getMessageID());   
				 m1.put("mContent", rVO.getMessageVO().getmContent());  
				 m1.put("reportID", rVO.getReportId());   
				 m1.put("reportMemberID", rVO.getReportMemberID()); 
				 m1.put("reportContent", rVO.getReportContent());
				 m1.put("reportTime", rVO.getReportTime());
				 m1.put("status", rVO.getStatus());
				 l1.add(m1);
			 }
			 jsonString = JSONValue.toJSONString(l1);  

		return jsonString;
	}
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		
		// 建立DAO物件
		ReportMessageDAO_interface dao = (ReportMessageDAO_interface) context.getBean("reportMessageDAO");
		
		// 新增
//		ReportMessageVO reportMessageVO1 = new ReportMessageVO();
//		MessageVO messageVO1 = new MessageVO();
//		messageVO1.setMessageID(1003);
//		reportMessageVO1.setMessageVO(messageVO1);
//		reportMessageVO1.setReportMemberID(100001);
//		reportMessageVO1.setReportContent("spring");
//		reportMessageVO1.setReportTime(new Date(System.currentTimeMillis()));
//		reportMessageVO1.setStatus((byte) 0);
//		dao.insert(reportMessageVO1);
		
		//修改
//		ReportMessageVO reportMessageVO2 = new ReportMessageVO();
//		reportMessageVO2.setReportId(1015);
//		reportMessageVO2.setStatus((byte) 1);
//		dao.update(reportMessageVO2);
		
		//查詢單一
//		ReportMessageVO reportMessageVO3 = dao.findByReportId(1015);
//		System.out.println(reportMessageVO3.getReportId());
//		System.out.println(reportMessageVO3.getMessageVO().getMessageID());
//		System.out.println(reportMessageVO3.getMessageVO().getmContent());
//		System.out.println(reportMessageVO3.getReportMemberID());
//		System.out.println(reportMessageVO3.getReportContent() + " ");
//		System.out.println(reportMessageVO3.getReportTime());
//		System.out.println(reportMessageVO3.getStatus());
//		System.out.println("---------------------------");
		
//		List<ReportMessageVO> list1 =dao.getNotHandle();
//		System.out.println("getNotHandle()");
//		for(ReportMessageVO reportMessageVO4 : list1) {
//			System.out.print(reportMessageVO4.getReportId() + "  ");
//			System.out.print(reportMessageVO4.getMessageVO().getMessageID() + "  ");
//			System.out.print(reportMessageVO4.getMessageVO().getmContent() + " ");
//			System.out.print(reportMessageVO4.getReportMemberID() + "  ");
//			System.out.print(reportMessageVO4.getReportContent() + "  ");
//			System.out.print(reportMessageVO4.getReportTime() + "  ");
//			System.out.print(reportMessageVO4.getStatus() + "\n");
//		}
		
		
		//查詢全部
		List<ReportMessageVO> list = dao.getAll();
		System.out.println("getAll()");
		for(ReportMessageVO reportMessageVO5 : list) {
			System.out.print(reportMessageVO5.getReportId() + "  ");
			System.out.print(reportMessageVO5.getMessageVO().getMessageID() + "  ");
			System.out.print(reportMessageVO5.getMessageVO().getmContent() + " ");
			System.out.print(reportMessageVO5.getReportMemberID() + "  ");
			System.out.print(reportMessageVO5.getReportContent() + "  ");
			System.out.print(reportMessageVO5.getReportTime() + "  ");
			System.out.print(reportMessageVO5.getStatus() + "\n");
		}
		
	}
	
	
}
