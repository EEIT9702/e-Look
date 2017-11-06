package com.e_Look.Course;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class CourseDAO implements CourseDAO_interface {
	public HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	private static final String UPDATE_Course = "update CourseVO set courseName=?,preTool=?,background=?,ability=?,targetgroup=?,soldPrice=?,courseLength=?,targetStudentNumber=?,fundStartDate=?,fundEndDate=?,courseStartDate=?,courseContent=? where courseID= ?";
	private static final String UPDATE_Course_IMAGE = "update CourseVO set cPhoto=? where courseID= ?";
	private static final String UPDATE_Course_PAPER = "update CourseVO set paper=? where courseID= ?";
	private static final String UPDATE_Course_CourseVideopathway = "update CourseVO set CourseVideopathway=? where courseID= ?";
	private static final String UPDATE_Proposal_Status = "update CourseVO set Status=1 where courseID=?";
	private static final String UPDATE_Editor_Status = "update CourseVO set Status=0 where courseID=?";
	private static final String UPDATE_Fund_Status = "update CourseVO set Status=3 where courseID=?";
	private static final String UPDATE_Online_Status = "update CourseVO set Status=2 where courseID=?";
	private static final String SELECT_ALL_Course = "from CourseVO where memberID= ? and status= ?";
	private static final String SELECT_ALL_ReviewCourse = "from CourseVO where status= 1";
	private static final String CHANGE_Course_Stage = "update CourseVO set status=? where courseID= ?";
	private static final String SELECT_ALL_ONLINECourse = "from CourseVO where  status= 2 ";
	private static final String UPDATE_AVG_SCORE = "UPDATE CourseVO SET avgScore=? WHERE courseID=?";
	private static final String SELECT_ALL_FREE_COURSE = "FROM CourseVO WHERE status=2 AND soldPrice=0";
	private static final String SELECT_ALL_ONLINE_COURSE = "FROM CourseVO WHERE status=2 AND soldPrice>0";
	private static final String SELECT_ALL_FUNDRAISE_COURSE = "FROM CourseVO WHERE status=3 AND fundStartDate <= getDate()";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Integer insert(CourseVO courseVO) {
		return (Integer) hibernateTemplate.save(courseVO);
	}

	// 以下為自動儲存草稿的功能
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(CourseVO courseVO) {
		hibernateTemplate.bulkUpdate(UPDATE_Course, courseVO.getCourseName(), courseVO.getPreTool(),
				courseVO.getBackground(), courseVO.getAbility(), courseVO.getTargetgroup(), courseVO.getSoldPrice(),
				courseVO.getCourseLength(), courseVO.getTargetStudentNumber(), courseVO.getFundStartDate(),
				courseVO.getFundEndDate(), courseVO.getCourseStartDate(), courseVO.getCourseContent(),
				courseVO.getCourseID());
	}

	// 更新平均分數
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updateAVGScore(Integer courseID, Double avgScore) {
		hibernateTemplate.bulkUpdate(UPDATE_AVG_SCORE, avgScore, courseID);
	}

	// 以下為更新圖片的功能
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updateimage(CourseVO courseVO) {
		hibernateTemplate.bulkUpdate(UPDATE_Course_IMAGE, courseVO.getcPhoto(), courseVO.getCourseID());
	}

	// 以下為更新講義的功能
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updatepaper(CourseVO courseVO) {
		hibernateTemplate.bulkUpdate(UPDATE_Course_PAPER, courseVO.getPaper(), courseVO.getCourseID());
	}

	// 以下為更新影片路徑的功能
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updatecourseVideopathway(CourseVO courseVO) {
		hibernateTemplate.bulkUpdate(UPDATE_Course_CourseVideopathway, courseVO.getCourseVideopathway(),
				courseVO.getCourseID());
	}

	// 以下為刪除功能
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer courseID) {
		CourseVO coursevo = new CourseVO();
		coursevo.setCourseID(courseID);
		hibernateTemplate.delete(coursevo);
	}

	// 選擇草稿、選擇單一課程頁面
	@Override
	public CourseVO findByPrimaryKey(Integer courseID) {
		CourseVO courseVO = hibernateTemplate.get(CourseVO.class, courseID);
		return courseVO;
	}

	// 會員後臺管理(選擇我的草稿、我開的課)、管理員後台待審核中的課程列表
	@Override
	public List<CourseVO> findAllCourse(Integer memberID, Integer status) {
		return (List<CourseVO>) hibernateTemplate.find(SELECT_ALL_Course, memberID, status);
	}

	// 會員編輯草稿完成送出審核
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void postProposal(Integer courseID) {
		hibernateTemplate.bulkUpdate(UPDATE_Proposal_Status, courseID);
	}

	// 審核不過，退回成草稿狀態
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void changeStatustoEditor(Integer courseID) {
		hibernateTemplate.bulkUpdate(UPDATE_Editor_Status, courseID);
	}

	// 審核通過，改為上線狀態
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void changeStatustoOnline(Integer courseID) {
		hibernateTemplate.bulkUpdate(UPDATE_Online_Status, courseID);

	}

	// 審核通過，改為募資中的狀態
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void changeStatustoFund(Integer courseID) {
		hibernateTemplate.bulkUpdate(UPDATE_Fund_Status, courseID);
	}

	// 管理員改變課程狀態(通過審核、下架等等....)
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updateStatus(CourseVO courseVO) {
		hibernateTemplate.bulkUpdate(CHANGE_Course_Stage,  courseVO.getStatus(),courseVO.getCourseID());
	}

	// 顯示所有status2的免費課程
	@Override
	public List<CourseVO> getAllFreeCourse() {
		return (List<CourseVO>) hibernateTemplate.find(SELECT_ALL_FREE_COURSE);
	}

	// 顯示所有status2的付費課程
	@Override
	public List<CourseVO> getAllOnlineCourseNotFree() {
		return (List<CourseVO>) hibernateTemplate.find(SELECT_ALL_ONLINE_COURSE);
	}

	// 顯示所有status3的募資課程
	@Override
	public List<CourseVO> getAllFundRaiseCourse() {
		return (List<CourseVO>) hibernateTemplate.find(SELECT_ALL_FUNDRAISE_COURSE);
	}

	// 顯示所有status2的課程(顯示首頁的熱門課程等....)
	@Override
	public List<CourseVO> getAllonlineCourse() {
		return (List<CourseVO>) hibernateTemplate.find(SELECT_ALL_ONLINECourse);
	}

	// 顯示所有待審核(status1)的課程(會員中心觀看審查中的課程)
	@Override
	public List<CourseVO> getAllReviewCourse() {
		return (List<CourseVO>) hibernateTemplate.find(SELECT_ALL_ReviewCourse);
	}

	public static void main(String[] args) throws FileNotFoundException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");

        // 建立DAO物件
		CourseDAO_interface dao =(CourseDAO_interface) context.getBean("courseDAO");
		//測試用：新增課程		
//		CourseVO CourseVO1 =new CourseVO();
//		CourseVO1.setSoldPrice(0);
//		CourseVO1.setCourseLength(0);
//		CourseVO1.setTargetStudentNumber(0);
//		CourseVO1.setStatus(0);
//		CourseVO1.setMemberID(100004);
//		CourseVO1.setAvgScore(0.0);
//		Integer CourseID= dao.insert(CourseVO1);
//		System.out.println(CourseID);
		
		//測試用：自動儲存草稿
//		CourseVO CourseVO2 = new CourseVO();
//		CourseVO2.setCourseName("java的基本功能介紹");//課程名稱
//		CourseVO2.setPreTool("需要安裝Adobe CC 2017的版本");
//		CourseVO2.setBackground("無限制");
//		CourseVO2.setAbility("需要基本的美術觀念");
//		CourseVO2.setTargetgroup("影像後製特效師、剪接師");
//		CourseVO2.setSoldPrice(1000);
//		CourseVO2.setCourseLength(10);
//		CourseVO2.setTargetStudentNumber(20);
//		CourseVO2.setFundStartDate(null);
//		CourseVO2.setFundEndDate(java.sql.Date.valueOf("2017-10-24"));
//		CourseVO2.setCourseStartDate(java.sql.Date.valueOf("2017-10-26"));
//		CourseVO2.setCourseVideopathway("img/EEIT97(e_Look)第一版.mp4");
//		CourseVO2.setCourseContent("第一次使用 After Effects 將會出現歡迎對話框，您可以選擇 New Composition 建立新的合成，或是選擇 Open Project 開啟已儲存的 After Effects 專案。若是以後不需要顯示此歡迎對話框，只要將下方的「Show Welcome Screen at startup」取消勾選即可。");
//		CourseVO2.setCourseID(200116);
//		dao.update(CourseVO2);
		
		//新增圖片
//		CourseVO CourseVO3 = new CourseVO();
//		byte[] bytes = IOUtils.toByteArray(new FileInputStream(new File("src/main/webapp/img/02.jpg")));
//		CourseVO3.setcPhoto(bytes);
//		CourseVO3.setCourseID(200116);
//		dao.updateimage(CourseVO3);
		
		//更新平均分數
//		dao.updateAVGScore(200116,5.0);
		
		//測試用：選擇草稿、選擇單一課程頁面
//		CourseVO CourseVO4 = dao.findByPrimaryKey(200116);
//		System.out.println(CourseVO4.getCourseID());
//		System.out.println(CourseVO4.getCourseName());
//		System.out.println(CourseVO4.getcPhoto());
//		System.out.println(CourseVO4.getPreTool());
//		System.out.println(CourseVO4.getBackground());
//		System.out.println(CourseVO4.getAbility());
//		System.out.println(CourseVO4.getTargetgroup());
//		System.out.println(CourseVO4.getSoldPrice());
//		System.out.println(CourseVO4.getCourseLength());
//		System.out.println(CourseVO4.getTargetStudentNumber());
//		System.out.println(CourseVO4.getFundStartDate());
//		System.out.println(CourseVO4.getFundEndDate());
//		System.out.println(CourseVO4.getCourseStartDate());
//		System.out.println(CourseVO4.getCourseVideopathway());
//		System.out.println(CourseVO4.getPaper());
//		System.out.println(CourseVO4.getStatus());
//		System.out.println(CourseVO4.getCourseContent());
//		System.out.println(CourseVO4.getMemberID());
//		System.out.println(CourseVO4.getAvgScore());
		
		//測試查出全部上線課程
//		List<CourseVO> list =dao.getAllonlineCourse();
//		for(CourseVO CourseVO5:list){
//			System.out.print(CourseVO5.getCourseID()+",");
//			System.out.print(CourseVO5.getCourseName()+",");
//			System.out.print(CourseVO5.getcPhoto()+",");
//			System.out.print(CourseVO5.getPreTool()+",");
//			System.out.print(CourseVO5.getBackground()+",");
//			System.out.print(CourseVO5.getAbility()+",");
//			System.out.print(CourseVO5.getTargetgroup()+",");
//			System.out.print(CourseVO5.getSoldPrice()+",");
//			System.out.print(CourseVO5.getCourseLength()+",");
//			System.out.print(CourseVO5.getTargetStudentNumber()+",");
//			System.out.print(CourseVO5.getFundStartDate()+",");
//			System.out.print(CourseVO5.getFundEndDate()+",");
//			System.out.print(CourseVO5.getCourseStartDate()+",");
//			System.out.print(CourseVO5.getCourseVideopathway()+",");
//			System.out.print(CourseVO5.getPaper()+",");
//			System.out.print(CourseVO5.getStatus()+",");
//			System.out.print(CourseVO5.getCourseContent()+",");
//			System.out.print(CourseVO5.getMemberID()+",");
//			System.out.println(CourseVO5.getAvgScore()+",");
//		}
	}

}