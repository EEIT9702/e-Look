package com.e_Look.buyCourse.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Transactional(readOnly = true)
public class BuyCourseDAO implements BuyCourseDAO_interface {
	
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	private static final String DELETE_BUYCOURSE = "delete from BuyCourseVO where memberID=? and courseID=?";
	private static final String SELECT_AVG_SCORE = "select avg(score) from BuyCourseVO where courseID=?";
	private static final String SELECT_MEMBER_BUYCOURSE = "from BuyCourseVO where memberID=?";
	private static final String SELECT_ALL = "from BuyCourseVO";
	private static final String SELECT_BYCOURSEID = " from BuyCourseVO where courseID=?";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(BuyCourseVO buyCourseVO) {
		hibernateTemplate.save(buyCourseVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(BuyCourseVO buyCourseVO) {
		hibernateTemplate.update(buyCourseVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(BuyCourseVO buyCourseVO) {
		hibernateTemplate.bulkUpdate(DELETE_BUYCOURSE, buyCourseVO.getMemberID(),buyCourseVO.getCourseID());
	}

	@Override
	public Double getAvgScore(Integer courseID) {
		List<Double> AvgScore =(List<Double>) hibernateTemplate.find(SELECT_AVG_SCORE, courseID);
		Double avg = null;
		if(AvgScore.size()>0){
			avg=AvgScore.get(0);
		}
		return avg;
	}

	@Override
	public List<BuyCourseVO> findByMemberID(Integer memberID) {
		
		return (List<BuyCourseVO>) hibernateTemplate.find(SELECT_MEMBER_BUYCOURSE, memberID);
		
	}

	@Override
	public List<BuyCourseVO> getAll() {
		return (List<BuyCourseVO>) hibernateTemplate.find(SELECT_ALL);
	}

	@Override
	public List<BuyCourseVO> getByCourseID(Integer courseID) {
		return (List<BuyCourseVO>) hibernateTemplate.find(SELECT_BYCOURSEID,courseID);
	}
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");

        // 建立DAO物件
		BuyCourseDAO_interface dao =(BuyCourseDAO_interface) context.getBean("buyCourseDAO");
		// 新增一筆購買
		 BuyCourseVO buyCourseVO1 = new BuyCourseVO();
//		 buyCourseVO1.setMemberID(100002);
//		 buyCourseVO1.setCourseID(200002);
//		 dao.insert(buyCourseVO1);
//		
		//修改(本DAO修改僅修改score欄位)
//		BuyCourseVO buyCourseVO2 = new BuyCourseVO();
//		buyCourseVO2.setMemberID(100002);
//		buyCourseVO2.setCourseID(200002);
//		buyCourseVO2.setScore(3);
//		dao.update(buyCourseVO2);
//		
		//計算課程平均分數
		//System.out.println(dao.getAvgScore(200002));
		
		// 查詢該會員購買之課程
//		List<BuyCourseVO> list1 = dao.findByMemberID(100001);
//		for (BuyCourseVO buyCourseVO : list1) {
//			System.out.print(buyCourseVO.getMemberID() + ",");
//			System.out.print(buyCourseVO.getCourseID() + ",");
//			System.out.println(buyCourseVO.getScore() + ",");
//		}
		// 查全部
//		List<BuyCourseVO> list2 = dao.getAll();
//		for (BuyCourseVO buyCourseVO : list2) {
//			System.out.print(buyCourseVO.getMemberID() + ",");
//			System.out.print(buyCourseVO.getCourseID() + ",");
//			System.out.println(buyCourseVO.getScore() + ",");
//		}

	
	
	}
	
	
}
