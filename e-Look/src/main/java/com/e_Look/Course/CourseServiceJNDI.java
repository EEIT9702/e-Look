package com.e_Look.Course;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

public class CourseServiceJNDI {
	private CourseDAO_interface dao;
	public CourseServiceJNDI() {
		dao = new CourseDAO();
	}
	public Integer CreateNewCourse(Integer memberID) {
		CourseVO CourseVO1 = new CourseVO();
		CourseVO1.setSoldPrice(0);
		CourseVO1.setCourseLength(0);
		CourseVO1.setTargetStudentNumber(0);
		CourseVO1.setStatus(0);
		CourseVO1.setMemberID(memberID);
		CourseVO1.setAvgScore(0.0);
		Integer CourseID = dao.insert(CourseVO1);
		return CourseID;
	}
	public void updateCourseContent(CourseVO courseVO) {
		dao.update(courseVO);
	}
	public void updateCourseVideoPathway(CourseVO courseVO) {
		dao.updatecourseVideopathway(courseVO);
	}
	public void updateCourseImage(Integer CourseID, Part part) {

		if (part.getSize() > 0) {
			CourseVO courseVO2 = new CourseVO();
			courseVO2.setCourseID(CourseID);
			try {
				byte[] bytes = IOUtils.toByteArray(part.getInputStream());
				courseVO2.setcPhoto(bytes);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dao.updateimage(courseVO2);
		}

	}
	
	public void updateCoursePaper(Integer CourseID, Part part) {

		if (part.getSize() > 0) {
			CourseVO courseVO3 = new CourseVO();
			courseVO3.setCourseID(CourseID);
			try {
				byte[] bytes = IOUtils.toByteArray(part.getInputStream());
				courseVO3.setPaper(bytes);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dao.updatepaper(courseVO3);
		}

	}
	public CourseVO getCourseData(Integer courseID) {
		return dao.findByPrimaryKey(courseID);
		
	}

	public void deleteCourse(Integer courseID) {

			dao.delete(courseID);
		
	}
	public void updateProposalStatus(Integer courseID){
			dao.postProposal(courseID);
	}
	public void rollbacktoEditorStatus(Integer courseID){
		dao.changeStatustoEditor(courseID);
	}
	public void changeStatustoOnlineStatus(Integer courseID){
		dao.changeStatustoOnline(courseID);
	}
	public void changeStatustoFundStatus(Integer courseID){
		dao.changeStatustoFund(courseID);
	}
	public void updateStatus(CourseVO courseVO){
		dao.updateStatus(courseVO);
	}
	public List<CourseVO> getAllCourseData(Integer memberID, Integer status){
		return dao.findAllCourse(memberID, status);
	}

	public List<CourseVO> getAllReviewCourseData(){
		return dao.getAllReviewCourse();
	}
	public List<CourseVO> getAllFundRaiseCourse(){
		return dao.getAllFundRaiseCourse();
	}
	

	public void updateAVGScore(Integer courseID ,Double avgScore) {
		CourseVO courseVO = new CourseVO();
		courseVO.setCourseID(courseID);
		courseVO.setAvgScore(avgScore);
		dao.updateAVGScore(courseID, avgScore);
	}
	
	public Integer countdown(Integer courseID) {
		CourseVO courseVO = dao.findByPrimaryKey(courseID);
		Long timeMillis = courseVO.getFundEndDate().getTime() - System.currentTimeMillis();
		Integer time = (int)(timeMillis/1000);
		Integer day = time / (60*60*24);
		if(day <=0 ){
			return null;
		}else{
			return day;			
		}
	}
	public List<CourseVO> getOnlineCourseByCourseName(String keyWord){
		List<CourseVO> courseVOs = dao.getAllOnlineCourseNotFree();
		List<CourseVO> courseVOs2 = new LinkedList<CourseVO>();
		for(CourseVO courseVO:courseVOs){
			if(courseVO.getCourseName().indexOf(keyWord)!=-1){
				courseVOs2.add(courseVO);
			}
			
		}
		return courseVOs2;
	}
	
	public List<CourseVO> getFreeCourseByCourseName(String keyWord){
		List<CourseVO> courseVOs = dao.getAllFreeCourse();
		List<CourseVO> courseVOs2 = new LinkedList<CourseVO>();
		for(CourseVO courseVO:courseVOs){
			if(courseVO.getCourseName().indexOf(keyWord)!=-1){
				courseVOs2.add(courseVO);
			}
			
		}
		return courseVOs2;
	}
	
}