package com.e_Look.ReportCourse.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.minidev.json.JSONValue;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.Course.CourseVO;

public class ReportCourseDAO implements ReportCourseDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	
	private static final String INSERT_REPORTCOURSE =
			"INSERT INTO ReportCourse (reportCourseID, reportMemberID, reportContent, reportTime,status ) VALUES (?,?,?,getDate(),0)";
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(ReportCourseVO ReportCourseVO) {
		hibernateTemplate.save(ReportCourseVO);
	}
	
	private static final String UPDATE_STATUS =
		    "UPDATE ReportCourseVO SET status=? WHERE reportId=?";	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(ReportCourseVO reportCourseVO) {
		hibernateTemplate.bulkUpdate(UPDATE_STATUS, reportCourseVO.getStatus(), reportCourseVO.getReportId());
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer reportID) {
		ReportCourseVO rcVO = new ReportCourseVO();
		rcVO.getReportId();
		hibernateTemplate.delete(rcVO);
	}
	
	private static final String SELECT_ONE_REPORT_MESSAGE =
			"SELECT reportId,reportCourseID,reportMemberID,reportContent,reportTime,status FROM ReportCourse WHERE reportId=?";
	@Override
	public ReportCourseVO findByReportId(Integer reportId) {
		return hibernateTemplate.get(ReportCourseVO.class, reportId);
	}
	
	
	private static final String SELECT_NOT_HANDLE_REPORT_COURSE =
			"FROM ReportCourseVO WHERE status=0";
	@Override
	public List<ReportCourseVO> getNotHandle(byte status) {
		List<ReportCourseVO> notHandleList = (List<ReportCourseVO>) hibernateTemplate.find(SELECT_NOT_HANDLE_REPORT_COURSE);
		return notHandleList;
	}
	
	
	@Override
	public List<ReportCourseVO> getAll() {
		List<ReportCourseVO> list = (List<ReportCourseVO>) hibernateTemplate.find("from ReportCourseVO");
		return list;
	}
	
	private static final String GET_JSON = "SELECT rc.reportID, rc.reportCourseID, rc.reportContent, rc.reportTime, rc.status,"
			+ "rc.reportMemberID, c.courseID, c.soldPrice FROM Course c INNER JOIN ReportCourse rc "
			+ "ON c.courseID = rc.reportCourseID WHERE rc.status=?";
	@Override
	public String getJSON(byte status) {
		String jsonString;
		List<ReportCourseVO> l2 = (List<ReportCourseVO>) hibernateTemplate.find("from ReportCourseVO WHERE status =?", status);
		
		List l1 = new LinkedList();
		
		for(ReportCourseVO rcVO : l2) {
			 Map m1 = new HashMap();  
			 m1.put("reportID", rcVO.getReportId());   
			 m1.put("reportCourseID", rcVO.getCourseVO().getCourseID());  
			 m1.put("reportContent", rcVO.getReportContent());   
			 m1.put("reportTime", rcVO.getReportTime()); 
			 m1.put("status", rcVO.getStatus()); 
			 m1.put("reportMemberID", rcVO.getReportMemberID());
			 m1.put("courseID", rcVO.getCourseVO().getCourseID());
			 m1.put("soldPrice", rcVO.getCourseVO().getSoldPrice());
			 l1.add(m1);
		} 
		 jsonString = JSONValue.toJSONString(l1);  
			
		return jsonString;
	}
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
	
		// 建立DAO物件
		ReportCourseDAO_interface dao = (ReportCourseDAO_interface) context.getBean("reportCourseDAO");
		
		// 新增	
//		ReportCourseVO reportCourseVO1 = new ReportCourseVO();
//		CourseVO cvo1 = new CourseVO();
//		cvo1.setCourseID(200001);
//		reportCourseVO1.setCourseVO(cvo1);
//		reportCourseVO1.setReportMemberID(100005);
//		reportCourseVO1.setReportContent("惡意送頭");
//		reportCourseVO1.setReportTime(new Date(System.currentTimeMillis()));
//		reportCourseVO1.setStatus((byte)0);
//		dao.insert(reportCourseVO1);
		
		//修改
//		ReportCourseVO reportCourseVO2 = new ReportCourseVO();
//		reportCourseVO2.setReportId(1001);
//		reportCourseVO2.setStatus((byte) 1);
//		dao.update(reportCourseVO2);
		
		//查詢單一
//		ReportCourseVO reportCourseVO2 = dao.findByReportId(1001);
//		System.out.println(reportCourseVO2.getReportId());
//		System.out.println(reportCourseVO2.getCourseVO().getCourseID());
//		System.out.println(reportCourseVO2.getReportMemberID());
//		System.out.println(reportCourseVO2.getReportContent());
//		System.out.println(reportCourseVO2.getReportTime());
//		System.out.println(reportCourseVO2.getStatus());
//		System.out.println("---------------------------");
		
		//查詢全部
		List<ReportCourseVO> list = dao.getAll();
		for(ReportCourseVO reportCourseVO4 : list) {
			System.out.print(reportCourseVO4.getReportId() + "  ");
			System.out.print(reportCourseVO4.getCourseVO().getCourseID() + "  ");
			System.out.print(reportCourseVO4.getReportMemberID() + "  ");
			System.out.print(reportCourseVO4.getReportContent() + "  ");
			System.out.print(reportCourseVO4.getReportTime() + "  ");
			System.out.print(reportCourseVO4.getStatus() + "\n");
		}
		
	}

	
}
